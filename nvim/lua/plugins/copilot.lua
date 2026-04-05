return {
  -- 補完機能
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = "<C-l>",
          accept_word = "<C-j>",
          accept_line = "<C-k>",
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-]>",
        },
      },
      panel = { enabled = false },
      filetypes = {
        yaml = true,
        markdown = true,
        gitcommit = true,
        help = false,
      },
    },
  },
  -- chat機能
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "zbirenbaum/copilot.lua" },
    },
    build = "make tiktoken",
    opts = {
      debug = false,
    },
    keys = {
      { "<leader>ac", "<cmd>CopilotChatToggle<cr>", desc = "Chat" },
      { "<leader>ax", "<cmd>CopilotChatExplain<cr>", desc = "Explain" },
      { "<leader>ar", "<cmd>CopilotChatReview<cr>", desc = "Review" },
      { "<leader>af", "<cmd>CopilotChatFix<cr>", desc = "Fix" },
      { "<leader>cr", "<cmd>CopilotChatReset<cr>", desc = "Reset Copilot Chat" }, 
    },
  },
}
