return {
  -- Snacks.nvim - Terminal and utility functions (required by claudecode.nvim)
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {},
  },

  -- Claude Code integration (coder/claudecode.nvim)
  -- Requires Claude Code CLI to be installed: https://docs.anthropic.com/claude/docs/install
  -- Installation: npm install -g @anthropic-ai/claude-code
  {
    "coder/claudecode.nvim",
    dependencies = {
      "folke/snacks.nvim", -- Required for terminal support
    },
    opts = {
      -- Server settings
      port_range = { min = 10000, max = 65535 },
      auto_start = true,
      log_level = "info",

      -- Terminal behavior
      terminal = {
        split_side = "right",
        split_width_percentage = 0.40,
        provider = "auto", -- Use snacks.nvim for terminal
      },

      -- Use git repository root as working directory
      git_repo_cwd = true,
    },
    keys = {
      { "<leader>cc", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude terminal", mode = "n" },
      { "<leader>cf", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude terminal", mode = "n" },
      { "<leader>cs", "<cmd>ClaudeCodeSend<cr>", desc = "Send selection to Claude", mode = "v" },
      { "<leader>cm", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model", mode = "n" },
      { "<leader>ca", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current file to Claude context", mode = "n" },
    },
  },

  -- Optional: GitHub Copilot integration
  -- Uncomment the block below if you have GitHub Copilot access
  --[==[
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = "<M-l>",
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-]>",
        },
      },
      panel = { enabled = false },
    },
  },
  --]==]
}
