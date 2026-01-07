return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim", -- Bridges Mason with lspconfig
    "WhoIsSethDaniel/mason-tool-installer.nvim", -- Automates installation of Linters and Formatters
  },
  config = function()
    -- Import Mason related plugins
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local mason_tool_installer = require("mason-tool-installer")

    -- 1. Initialize Mason (The Package Manager UI)
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    -- 2. Configuration for Automatic Tool Installation
    mason_tool_installer.setup({
      ensure_installed = {
        -- --- LSP (Language Servers) ---
        "lua_ls",         -- Lua
        "ts_ls",          -- TypeScript/JavaScript (formerly tsserver)
        "html",           -- HTML
        "cssls",          -- CSS
        "tailwindcss",    -- Tailwind CSS
        "prismals",       -- Prisma
        "graphql",        -- GraphQL
        "emmet_ls",       -- Emmet (HTML/CSS abbreviations)
        "pyright",        -- Python
        "rust_analyzer",  -- Rust
        "jdtls",          -- Java
        "clangd",         -- C/C++

        -- --- Formatters (Code Formatting) ---
        "prettier",           -- Formatter for JS/TS/HTML/CSS/JSON
        "stylua",             -- Formatter for Lua
        "isort",              -- Python import sorter
        "black",              -- Python code formatter
        "google-java-format", -- Java formatter

        -- --- Linters (Code Quality & Logic Errors) ---
        "eslint_d",     -- Fast JavaScript/TypeScript linter
        "pylint",       -- Python linter
      },
    })

    -- 3. Mason-LSPConfig Bridge Configuration
    mason_lspconfig.setup({
      -- List of servers to ensure are installed for LSPConfig to bind
      ensure_installed = {
        "lua_ls",
        "ts_ls",
        "html",
        "cssls",
        "tailwindcss",
        "prismals",
        "graphql",
        "emmet_ls",
        "pyright",
        "rust_analyzer",
        "jdtls",
        "clangd",
      },
      -- Automatically install servers that are configured in lspconfig but not yet installed
      automatic_installation = true,
    })
  end,
}