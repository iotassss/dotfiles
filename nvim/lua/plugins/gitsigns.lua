return {
  "lewis6991/gitsigns.nvim",
  event = "BufReadPre",
  opts = {
    signs = {
      add          = { text = "│" },
      change       = { text = "│" },
      delete       = { text = "_" },
      topdelete    = { text = "‾" },
      changedelete = { text = "~" },
    },

    current_line_blame = true,

    on_attach = function(bufnr)
      print("gitsigns attached")
      local gs = require("gitsigns")

      local function map(mode, lhs, rhs, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, lhs, rhs, opts)
      end

      -- 差分移動（expr 必須）
      map("n", "]c", function()
        if vim.wo.diff then return "]c" end
        vim.schedule(function() gs.nav_hunk("next") end)
        return "<Ignore>"
      end, { expr = true })

      map("n", "[c", function()
        if vim.wo.diff then return "[c" end
        vim.schedule(function() gs.nav_hunk("prev") end)
        return "<Ignore>"
      end, { expr = true })

      map("n", "<leader>hp", gs.preview_hunk)

      -- =========================
      -- hunk（変更単位）の操作
      -- =========================
      
      -- 現在の変更（hunk）をステージング（git add の部分版）
      map("n", "<leader>hs", gs.stage_hunk)
      
      -- 現在の変更（hunk）を元に戻す（git checkout 相当）
      map("n", "<leader>hr", gs.reset_hunk)
      
      -- ビジュアル選択した範囲をステージング
      map("v", "<leader>hs", function()
        gs.stage_hunk { vim.fn.line("."), vim.fn.line("v") }
      end)
      
      -- ビジュアル選択した範囲を元に戻す
      map("v", "<leader>hr", function()
        gs.reset_hunk { vim.fn.line("."), vim.fn.line("v") }
      end)
      
      -- =========================
      -- ファイル全体の操作
      -- =========================
      
      -- ファイル全体の変更をすべてステージング
      map("n", "<leader>hS", gs.stage_buffer)
      
      -- ファイル全体の変更をすべて取り消し（完全リセット）
      map("n", "<leader>hR", gs.reset_buffer)
      
      -- =========================
      -- 情報確認系
      -- =========================
      
      -- カーソル行の blame 情報を表示（誰がいつ変更したか）
      map("n", "<leader>hb", gs.blame_line)
      
      -- =========================
      -- 差分表示
      -- =========================
      
      -- index（ステージング）との差分を表示
      map("n", "<leader>hd", gs.diffthis)
      
      -- HEAD（最新コミット）との差分を表示
      map("n", "<leader>hD", function()
        gs.diffthis("~")
      end)
      
      -- =========================
      -- テキストオブジェクト
      -- =========================
      
      -- hunk（変更箇所）をテキストオブジェクトとして選択可能にする
      -- 例:
      --   vih → 変更部分をビジュアル選択
      --   dih → 変更部分を削除
      map({ "o", "x" }, "ih", gs.select_hunk)
      
      -- =========================
      -- 表示トグル
      -- =========================
      
      -- 行末に表示される blame 情報の ON/OFF 切り替え
      map("n", "<leader>tb", gs.toggle_current_line_blame)
      
      -- 削除された行（diff上の削除）の表示 ON/OFF
      map("n", "<leader>td", gs.toggle_deleted)    end,
  },
}
