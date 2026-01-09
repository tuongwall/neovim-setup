return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer", -- Source for text suggestions within the current buffer
    "hrsh7th/cmp-path", -- Source for file system path suggestions

    -- [CRITICAL] Bridges nvim-cmp with Neovim's built-in LSP
    "hrsh7th/cmp-nvim-lsp",

    {
      "L3MON4D3/LuaSnip",
      -- Follows latest stable releases
      version = "v2.*",
      -- Build step to enable JS regex support in snippets
      build = "make install_jsregexp",
    },
    "saadparwaiz1/cmp_luasnip", -- Bridges LuaSnip with nvim-cmp
    "rafamadriz/friendly-snippets", -- Provides a collection of ready-to-use snippets
    "onsails/lspkind.nvim", -- Adds VS Code-like pictograms (icons) to the menu
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local lspkind = require("lspkind")

    -- Load VS Code style snippets from installed plugins (like friendly-snippets)
    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
      completion = {
        -- menu: pop-up menu, menuone: show even for one match, preview: show docs
        -- noselect: don't automatically select the first item
        completeopt = "menu,menuone,preview,noselect",
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(), -- Move up in the menu
        ["<C-j>"] = cmp.mapping.select_next_item(), -- Move down in the menu
        ["<C-b>"] = cmp.mapping.scroll_docs(-4), -- Scroll documentation window up
        ["<C-f>"] = cmp.mapping.scroll_docs(4), -- Scroll documentation window down
        ["<C-Space>"] = cmp.mapping.complete(), -- Manually trigger completion menu
        ["<C-e>"] = cmp.mapping.abort(), -- Close completion menu
        ["<CR>"] = cmp.mapping.confirm({ select = false }), -- Confirm selection
      }),

      -- Source Priority: The order here determines suggestion ranking
      sources = cmp.config.sources({
        { name = "nvim_lsp" }, -- 1. High-priority smart suggestions (LSP)
        { name = "luasnip" }, -- 2. Code snippets
        { name = "buffer" }, -- 3. Text existing in the current file
        { name = "path" }, -- 4. File system paths
      }),

      -- Configure the look of the completion menu
      formatting = {
        format = lspkind.cmp_format({
          maxwidth = 50, -- Prevent the menu from becoming too wide
          ellipsis_char = "...", -- Show "..." when a suggestion is truncated
        }),
      },
    })
    -- Completion sources for SQL-related filetype
    cmp.setup.filetype({ "sql", "mysql", "plsql" }, {
      sources = cmp.config.sources({
        {
          name = "vim-dadbod-completion",
          -- Primary SQL completion sourecs (tables, columns, keywords)
          -- Requires an active vim-dadbod database connection
        },

        {
          name = "nvim_lsp",
          -- LSP-based SQL syntax and language features
        },

        {
          name = "buffer",
          -- Fallback suggestions from the current buffer
        },
      }),
    })
  end,
}
