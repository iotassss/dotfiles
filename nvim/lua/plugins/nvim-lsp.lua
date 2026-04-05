return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.lsp.config("gopls", {})
      vim.lsp.enable("gopls")
    end,
  },
}
