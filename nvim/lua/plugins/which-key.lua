return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {
      preset = "modern",
      icons = {
        mappings = true,
      },
      win = {
        border = "rounded",
        padding = { 1, 2 },
      },
      layout = {
        spacing = 3,
      },
      spec = {
        { "<leader>f", group = "find" },
        { "<leader>b", group = "buffer" },
        { "<leader>t", group = "tabs" },
        { "<leader>n", group = "navigate" },
        { "<leader>m", group = "motions" },
        { "<leader>s", group = "search/edit" },
        { "<leader>l", group = "lsp" },
        { "<leader>g", group = "git" },
        { "<leader>c", group = "claude" },
        { "<leader>p", group = "plugins" },
        { "<leader>q", group = "quit" },
      },
    },
  },
}
