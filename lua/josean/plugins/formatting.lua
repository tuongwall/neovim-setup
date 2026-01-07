return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        -- Web Development: Using Prettier as the universal formatter
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        svelte = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        graphql = { "prettier" },
        
        -- Scripting Languages
        lua = { "stylua" },
        python = { "isort", "black" }, -- isort (sorts imports) followed by black (formats code)

        -- Compiled Languages
        java = { "google-java-format" },
        c = { "clang-format" },
        cpp = { "clang-format" },
        rust = { "rustfmt" }, -- Standard Rust formatter
      },
      
      -- Format on Save Configuration
      format_on_save = {
        -- [IMPORTANT] If no dedicated formatter is found above, fallback to the LSP's formatting capabilities
        lsp_fallback = true, 
        async = false,       -- Run synchronously to ensure the file is formatted before being written to disk
        timeout_ms = 1000,   -- Higher timeout to accommodate slower formatters like Java or C++
      },
    })

    -- Manual Formatting Keymap (Space + m + p for "Make Pretty")
    -- Works in both Normal and Visual mode (to format specific code ranges)
    vim.keymap.set({ "n", "v" }, "<leader>mp", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      })
    end, { desc = "Format file or selection" })
  end,
}