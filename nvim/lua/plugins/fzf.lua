return {
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "<leader>ff", "<cmd>FzfLua files<cr>", desc = "Find files" },
      { "<leader>fg", "<cmd>FzfLua live_grep<cr>", desc = "Live grep" },
      { "<leader>fb", "<cmd>FzfLua buffers<cr>", desc = "Find buffers" },
      { "<leader>fh", "<cmd>FzfLua help_tags<cr>", desc = "Help tags" },
      { "<leader>fo", "<cmd>FzfLua oldfiles<cr>", desc = "Recent files" },
      { "<leader>fw", "<cmd>FzfLua grep_cword<cr>", desc = "Find word under cursor" },
      { "<leader>fc", "<cmd>FzfLua commands<cr>", desc = "Find commands" },
      { "<leader>fk", "<cmd>FzfLua keymaps<cr>", desc = "Find keymaps" },
    },
    opts = {
      "default",
      winopts = {
        height = 0.85,
        width = 0.85,
        preview = {
          default = "bat",
          border = "border",
          wrap = "nowrap",
          hidden = "nohidden",
          vertical = "down:45%",
          horizontal = "right:50%",
          layout = "flex",
        },
      },
      files = {
        prompt = "Files❯ ",
        git_icons = true,
        file_icons = true,
        color_icons = true,
      },
      grep = {
        prompt = "Grep❯ ",
        input_prompt = "Grep For❯ ",
        git_icons = true,
        file_icons = true,
        color_icons = true,
      },
    },
  },
}
