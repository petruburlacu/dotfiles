return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false, -- Official docs: treesitter does not support lazy-loading
    config = function()
      -- Check if treesitter is properly installed first
      local status_ok, treesitter_configs = pcall(require, "nvim-treesitter.configs")
      if not status_ok then
        -- First time install - treesitter not ready yet
        -- It will be configured on next restart after :TSUpdate completes
        return
      end

      treesitter_configs.setup({
        -- Install parsers for these languages
        ensure_installed = {
          "lua",
          "vim",
          "vimdoc",
          "query",
          "python",
          "javascript",
          "typescript",
          "tsx",
          "rust",
          "go",
          "html",
          "css",
          "json",
          "yaml",
          "toml",
          "markdown",
          "markdown_inline",
          "bash",
          "c",
          "cpp",
        },

        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,

        -- Automatically install missing parsers when entering buffer
        auto_install = true,

        highlight = {
          enable = true,
          -- Disable slow treesitter highlight for large files
          disable = function(lang, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
              return true
            end
          end,
          additional_vim_regex_highlighting = false,
        },

        indent = {
          enable = true,
        },

        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<C-space>",
            node_incremental = "<C-space>",
            scope_incremental = false,
            node_decremental = "<bs>",
          },
        },
      })
    end,
  },

  -- Textobjects - only uncomment AFTER treesitter is working
  -- {
  --   "nvim-treesitter/nvim-treesitter-textobjects",
  --   dependencies = "nvim-treesitter/nvim-treesitter",
  --   config = function()
  --     require("nvim-treesitter.configs").setup({
  --       textobjects = {
  --         select = {
  --           enable = true,
  --           lookahead = true,
  --           keymaps = {
  --             ["af"] = "@function.outer",
  --             ["if"] = "@function.inner",
  --             ["ac"] = "@class.outer",
  --             ["ic"] = "@class.inner",
  --             ["aa"] = "@parameter.outer",
  --             ["ia"] = "@parameter.inner",
  --           },
  --         },
  --         move = {
  --           enable = true,
  --           set_jumps = true,
  --           goto_next_start = {
  --             ["]f"] = "@function.outer",
  --             ["]c"] = "@class.outer",
  --           },
  --           goto_next_end = {
  --             ["]F"] = "@function.outer",
  --             ["]C"] = "@class.outer",
  --           },
  --           goto_previous_start = {
  --             ["[f"] = "@function.outer",
  --             ["[c"] = "@class.outer",
  --           },
  --           goto_previous_end = {
  --             ["[F"] = "@function.outer",
  --             ["[C"] = "@class.outer",
  --           },
  --         },
  --       },
  --     })
  --   end,
  -- },
}
