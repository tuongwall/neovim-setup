return {
  "folke/todo-comments.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  opts = {
    signs = true,         -- Show icons in the sign column (gutter)
    sign_priority = 8,    -- Priority of the sign in the gutter

    -- Configuration for specific keyword categories
    keywords = {
      FIX = {
        icon = " ",       -- Bug icon
        color = "error",   -- Uses the 'error' highlight group
        alt = { "FIXME", "BUG", "ISSUE" }, -- Alias words that trigger this highlight
      },
      TODO = {
        icon = " ", 
        color = "info",
      },
      HACK = {
        icon = " ", 
        color = "warning",
      },
      NOTE = {
        icon = " ", 
        color = "hint",
        alt = { "INFO" },
      },
      TEST = {
        icon = "⏲ ", 
        color = "test",
      },
    },
  },
  config = function(_, opts)
    local todo = require("todo-comments")
    todo.setup(opts)

    local keymap = vim.keymap

    -- 🔁 NAVIGATION
    -- Jump to the next TODO/FIXME comment in the buffer
    keymap.set("n", "]t", todo.jump_next, { desc = "Next TODO comment" })
    -- Jump to the previous TODO/FIXME comment in the buffer
    keymap.set("n", "[t", todo.jump_prev, { desc = "Previous TODO comment" })

    -- 🔍 SEARCHING (Telescope Integration)
    -- Lists all TODOs across the entire project in a Telescope picker
    keymap.set("n", "<leader>st", "<cmd>TodoTelescope<cr>", {
      desc = "Search project TODOs via Telescope",
    })

    -- 📋 QUICKFIX LIST
    -- Lists all TODOs in the project using Neovim's Quickfix window
    keymap.set("n", "<leader>xt", "<cmd>TodoQuickFix<cr>", {
      desc = "Open all TODOs in Quickfix list",
    })
  end,
}