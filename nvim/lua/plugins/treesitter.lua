return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.config").setup({
        ensure_installed = { "go", "lua", "vim", "vimdoc" },
        highlight = {
          enable = true,
        },
      })
    end,
  },
}
