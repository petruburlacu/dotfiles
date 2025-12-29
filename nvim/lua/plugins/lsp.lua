return {
  -- LSP Configuration
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    lazy = true,
    config = false,
    init = function()
      -- Disable automatic setup, we are doing it manually
      vim.g.lsp_zero_extend_cmp = 0
      vim.g.lsp_zero_extend_lspconfig = 0
    end,
  },

  -- LSP Support
  {
    "neovim/nvim-lspconfig",
    cmd = { "LspInfo", "LspInstall", "LspStart" },
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "hrsh7th/cmp-nvim-lsp" },
      { "williamboman/mason-lspconfig.nvim" },
    },
    config = function()
      local lsp_zero = require("lsp-zero")
      lsp_zero.extend_lspconfig()

      -- LSP keybindings (only active when LSP is attached)
      lsp_zero.on_attach(function(client, bufnr)
        local opts = { buffer = bufnr, remap = false }

        -- Navigation
        vim.keymap.set("n", "gd", function()
          vim.lsp.buf.definition()
        end, vim.tbl_extend("force", opts, { desc = "Go to definition" }))

        vim.keymap.set("n", "gD", function()
          vim.lsp.buf.declaration()
        end, vim.tbl_extend("force", opts, { desc = "Go to declaration" }))

        vim.keymap.set("n", "gi", function()
          vim.lsp.buf.implementation()
        end, vim.tbl_extend("force", opts, { desc = "Go to implementation" }))

        vim.keymap.set("n", "gr", function()
          vim.lsp.buf.references()
        end, vim.tbl_extend("force", opts, { desc = "Show references" }))

        vim.keymap.set("n", "gt", function()
          vim.lsp.buf.type_definition()
        end, vim.tbl_extend("force", opts, { desc = "Go to type definition" }))

        -- Hover and help
        vim.keymap.set("n", "K", function()
          vim.lsp.buf.hover()
        end, vim.tbl_extend("force", opts, { desc = "Hover documentation" }))

        vim.keymap.set("n", "<C-k>", function()
          vim.lsp.buf.signature_help()
        end, vim.tbl_extend("force", opts, { desc = "Signature help" }))

        -- Leader-based LSP commands
        vim.keymap.set("n", "<leader>lr", function()
          vim.lsp.buf.rename()
        end, vim.tbl_extend("force", opts, { desc = "Rename symbol" }))

        vim.keymap.set("n", "<leader>la", function()
          vim.lsp.buf.code_action()
        end, vim.tbl_extend("force", opts, { desc = "Code actions" }))

        vim.keymap.set("n", "<leader>lf", function()
          vim.lsp.buf.format({ async = true })
        end, vim.tbl_extend("force", opts, { desc = "Format file" }))

        vim.keymap.set("n", "<leader>ld", function()
          vim.diagnostic.open_float()
        end, vim.tbl_extend("force", opts, { desc = "Show diagnostics" }))

        vim.keymap.set("n", "<leader>lk", function()
          vim.diagnostic.goto_prev()
        end, vim.tbl_extend("force", opts, { desc = "Previous diagnostic" }))

        vim.keymap.set("n", "<leader>lj", function()
          vim.diagnostic.goto_next()
        end, vim.tbl_extend("force", opts, { desc = "Next diagnostic" }))

        vim.keymap.set("n", "<leader>lq", function()
          vim.diagnostic.setloclist()
        end, vim.tbl_extend("force", opts, { desc = "Diagnostics to location list" }))

        vim.keymap.set("n", "<leader>li", "<cmd>LspInfo<cr>", vim.tbl_extend("force", opts, { desc = "LSP Info" }))
      end)

      -- Configure diagnostic signs
      lsp_zero.set_sign_icons({
        error = "✘",
        warn = "▲",
        hint = "⚑",
        info = "»",
      })

      -- Configure diagnostic display
      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        update_in_insert = false,
        underline = true,
        severity_sort = true,
        float = {
          border = "rounded",
          source = "always",
          header = "",
          prefix = "",
        },
      })
    end,
  },

  -- Mason: LSP installer
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = true,
  },

  -- Bridge between Mason and lspconfig
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    dependencies = {
      "williamboman/mason.nvim",
    },
    config = function()
      local lsp_zero = require("lsp-zero")

      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",     -- Lua
          "rust_analyzer", -- Rust
          "ts_ls",      -- TypeScript/JavaScript
          "pyright",    -- Python
          "gopls",      -- Go
        },
        handlers = {
          lsp_zero.default_setup,
          -- Custom configuration for specific servers
          lua_ls = function()
            require("lspconfig").lua_ls.setup({
              settings = {
                Lua = {
                  diagnostics = {
                    globals = { "vim" },
                  },
                  workspace = {
                    library = {
                      [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                      [vim.fn.stdpath("config") .. "/lua"] = true,
                    },
                  },
                },
              },
            })
          end,
        },
      })
    end,
  },

  -- Autocompletion
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      { "L3MON4D3/LuaSnip" },
      { "saadparwaiz1/cmp_luasnip" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "rafamadriz/friendly-snippets" },
    },
    config = function()
      local lsp_zero = require("lsp-zero")
      lsp_zero.extend_cmp()

      local cmp = require("cmp")
      local luasnip = require("luasnip")
      local cmp_action = lsp_zero.cmp_action()

      -- Load friendly-snippets
      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        sources = {
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        },
        mapping = cmp.mapping.preset.insert({
          -- Confirm completion
          ["<CR>"] = cmp.mapping.confirm({ select = false }),

          -- Tab to select next item
          ["<Tab>"] = cmp_action.luasnip_supertab(),
          ["<S-Tab>"] = cmp_action.luasnip_shift_supertab(),

          -- Ctrl+Space to trigger completion
          ["<C-Space>"] = cmp.mapping.complete(),

          -- Scroll documentation
          ["<C-u>"] = cmp.mapping.scroll_docs(-4),
          ["<C-d>"] = cmp.mapping.scroll_docs(4),

          -- Navigate between snippet placeholders
          ["<C-f>"] = cmp_action.luasnip_jump_forward(),
          ["<C-b>"] = cmp_action.luasnip_jump_backward(),
        }),
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        formatting = lsp_zero.cmp_format(),
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
      })
    end,
  },
}
