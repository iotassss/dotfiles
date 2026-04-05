return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup({
      diagnostics = {
        enable = true,
        show_on_dirs = true,
        icons = {
          hint = "",
          info = "",
          warning = "",
          error = "",
        },
      },
      renderer = {
        highlight_diagnostics = true,
      },
    })

    vim.api.nvim_set_hl(0, "NvimTreeDiagnosticErrorFileHL", { fg = "#ff5555" })
    vim.api.nvim_set_hl(0, "NvimTreeDiagnosticWarnFileHL", { fg = "#f1fa8c" })
  end,
}
