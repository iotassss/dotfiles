-- 必要な設定は追加し、不要なものは削除すること
-- 把握できる設定のみを追加すること

-- leaderはデフォルトでは\だが、一般的なカスタマイズとしてスペースを設定
vim.g.mapleader = " "

require("options")
require("config.lazy")

-- ----------------------------
-- Plugin dependent settings
-- ----------------------------

-- Goのimportを自動で整理するための関数
local function organize_imports()
  local bufnr = vim.api.nvim_get_current_buf()

  -- 今のバッファに付いている LSP client から encoding を取る
  local clients = vim.lsp.get_clients({ bufnr = bufnr, name = "gopls" })
  if #clients == 0 then
    return
  end

  local client = clients[1]
  local params = vim.lsp.util.make_range_params(0, client.offset_encoding)
  params.context = { only = { "source.organizeImports" } }

  local result = vim.lsp.buf_request_sync(bufnr, "textDocument/codeAction", params, 3000)
  for cid, res in pairs(result or {}) do
    for _, action in pairs(res.result or {}) do
      if action.edit then
        local c = vim.lsp.get_client_by_id(cid)
        vim.lsp.util.apply_workspace_edit(action.edit, c and c.offset_encoding or "utf-16")
      end
    end
  end
end

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function(args)
    organize_imports()
    vim.lsp.buf.format({
      bufnr = args.buf,
      async = false,
      name = "gopls",
    })
  end,
})

-- 診断ポップのキー設定
vim.keymap.set("n", "gl", vim.diagnostic.open_float)
-- -- 枠線を表示するための設定
-- vim.keymap.set("n", "gl", function()
--   vim.diagnostic.open_float(nil, { border = "rounded" })
-- end)

-- 診断ポップアップの背景色をシンプルに変更
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#0000cd" })
vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#00ff00", bg = "#ff0000" })
-- LSPエラー popup の文字色
vim.api.nvim_set_hl(0, "DiagnosticFloatingError", { fg = "#ff5555" })
vim.api.nvim_set_hl(0, "DiagnosticFloatingWarn", { fg = "#f1fa8c" })

-- VSCode風のファイルシステム表示をするための設定
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- プロジェクトディレクトリ内部の検索を行うための設定
-- <leader>ff  ファイル名検索
-- <leader>fg  プロジェクト内全文検索
-- <leader>fb  開いているバッファ検索
-- <leader>fh  ヘルプ検索
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files)
vim.keymap.set("n", "<leader>fg", builtin.live_grep)
vim.keymap.set("n", "<leader>fb", builtin.buffers)
vim.keymap.set("n", "<leader>fh", builtin.help_tags)

-- LSPによるコードナビゲーション設定
-- gd  定義へジャンプ
-- gr  参照一覧を表示
-- gi  実装へジャンプ
-- K   ホバー情報を表示
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gr", vim.lsp.buf.references)
vim.keymap.set("n", "gi", vim.lsp.buf.implementation)
vim.keymap.set("n", "K", vim.lsp.buf.hover)

-- 相対パス取得
vim.keymap.set("n", "<leader>fp", function()
  local path = vim.fn.expand("%")
  vim.fn.setreg("+", path)
  print(path)
end, { desc = "Copy relative path" })
-- 絶対パス取得
vim.keymap.set("n", "<leader>fP", function()
  local path = vim.fn.expand("%:p")
  vim.fn.setreg("+", path)
  print(path)
end, { desc = "Copy absolute path" })

vim.cmd("colorscheme tokyonight")

-- Goだけ例外（必要なら）
vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  callback = function()
    vim.opt_local.expandtab = false
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.softtabstop = 4
  end,
})

