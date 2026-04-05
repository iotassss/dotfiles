return {
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.lsp.config("gopls", {})
      vim.lsp.enable("gopls")
    end,
  },
}
