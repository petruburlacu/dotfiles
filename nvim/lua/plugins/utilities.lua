return {
  -- Auto pairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
      check_ts = true,
      ts_config = {
        lua = { "string" },
        javascript = { "template_string" },
      },
      fast_wrap = {
        map = "<M-e>",
        chars = { "{", "[", "(", '"', "'" },
        pattern = [=[[%'%"%>%]%)%}%,]]=],
        end_key = "$",
        keys = "qwertyuiopzxcvbnmasdfghjkl",
        check_comma = true,
        highlight = "Search",
        highlight_grey = "Comment",
      },
    },
  },

  -- Comment with Ctrl+/
  {
    "numToStr/Comment.nvim",
    event = { "BufReadPre", "BufNewFile" },
    keys = {
      { "<C-_>", mode = { "n", "v" }, desc = "Toggle comment" },
    },
    config = function()
      require("Comment").setup({
        toggler = {
          line = "<C-_>",
          block = "gbc",
        },
        opleader = {
          line = "<C-_>",
          block = "gb",
        },
        mappings = {
          basic = true,
          extra = true,
        },
      })
    end,
  },

  -- Auto detect indentation
  {
    "tpope/vim-sleuth",
    event = { "BufReadPre", "BufNewFile" },
  },

  -- Indentation guides with rainbow colors
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      indent = {
        char = "│",
        tab_char = "│",
      },
      scope = {
        enabled = true,
        show_start = true,
        show_end = false,
      },
      exclude = {
        filetypes = {
          "help",
          "lazy",
          "mason",
          "neo-tree",
          "Trouble",
        },
      },
    },
  },

  -- Remember last cursor position
  {
    "ethanholz/nvim-lastplace",
    event = "BufReadPre",
    opts = {
      lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
      lastplace_ignore_filetype = { "gitcommit", "gitrebase", "svn", "hgcommit" },
      lastplace_open_folds = true,
    },
  },

  -- Flash for quick navigation
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
      labels = "asdfghjklqwertyuiopzxcvbnm",
      search = {
        multi_window = true,
        forward = true,
        wrap = true,
        mode = "exact",
      },
      jump = {
        jumplist = true,
        pos = "start",
        history = false,
        register = false,
        nohlsearch = false,
      },
      label = {
        uppercase = true,
        rainbow = {
          enabled = true,
          shade = 5,
        },
      },
      modes = {
        search = {
          enabled = true,
        },
        char = {
          enabled = true,
          jump_labels = true,
        },
      },
    },
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash",
      },
      {
        "S",
        mode = { "n", "x", "o" },
        function()
          require("flash").treesitter()
        end,
        desc = "Flash Treesitter",
      },
      {
        "r",
        mode = "o",
        function()
          require("flash").remote()
        end,
        desc = "Remote Flash",
      },
      {
        "R",
        mode = { "o", "x" },
        function()
          require("flash").treesitter_search()
        end,
        desc = "Treesitter Search",
      },
      {
        "<c-s>",
        mode = { "c" },
        function()
          require("flash").toggle()
        end,
        desc = "Toggle Flash Search",
      },
    },
  },
}
