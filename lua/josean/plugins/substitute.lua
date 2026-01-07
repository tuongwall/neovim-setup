return {
  "gbprod/substitute.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local substitute = require("substitute")

    substitute.setup({
      -- Automatically yank the text that was replaced (useful for recovery or further pasting)
      yank_substituted_text = true, 
      preserve_cursor_position = false,
      -- Briefly highlight the text that was just substituted
      highlight_substituted_text = {
        enabled = true,
        timer = 200, -- Duration of the highlight in milliseconds
      },
    })

    local keymap = vim.keymap

    -- 🔁 SUBSTITUTE OPERATIONS (Supports Dot-Repeat '.')
    -- Use 's' followed by a motion (e.g., 'siw' to replace a word with clipboard content)
    keymap.set("n", "s", substitute.operator, { desc = "Substitute with motion" })
    -- Substitute the entire current line
    keymap.set("n", "ss", substitute.line, { desc = "Substitute line" })
    -- Substitute from cursor position to the end of the line
    keymap.set("n", "S", substitute.eol, { desc = "Substitute to end of line" })
    -- Substitute current visual selection
    keymap.set("x", "s", substitute.visual, { desc = "Substitute visual" })

    -- 🔄 SMART LSP RENAME (Global Code Refactoring)
    -- Map F2 for a familiar VS Code-style renaming experience
    keymap.set("n", "<F2>", vim.lsp.buf.rename, { desc = "LSP Rename (Global)" })
    -- Standard Neovim leader mapping for renaming
    keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "LSP Rename" })
  end,
}