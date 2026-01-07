return {
  "stevearc/dressing.nvim",
  event = "VeryLazy",
  config = function()
    require("dressing").setup({
      -- 1. INPUT CONFIGURATION (Floating Input Boxes)
      input = {
        enabled = true,
        default_prompt = "Input:",
        title_pos = "left",
        insert_only = true,      -- Focus on typing immediately
        start_in_insert = true,  -- Automatically enter Insert mode when the box opens
        
        -- [IMPORTANT] Position the box relative to the cursor
        -- Extremely helpful for context-aware tasks like "Smart Rename"
        relative = "cursor", 
        border = "rounded",      -- Rounded borders to match a modern UI aesthetic
        
        prefer_width = 40,
        width = nil,
        max_width = { 140, 0.9 },
        min_width = { 20, 0.2 },

        mappings = {
          n = {
            ["<Esc>"] = "Close",
            ["<CR>"] = "Confirm",
          },
          i = {
            ["<C-c>"] = "Close",
            ["<CR>"] = "Confirm",
            ["<Up>"] = "HistoryPrev",   -- Cycle through previous inputs
            ["<Down>"] = "HistoryNext", -- Cycle through next inputs
          },
        },
      },

      -- 2. SELECT CONFIGURATION (Selection Menus/Code Actions)
      select = {
        enabled = true,
        
        -- Priority list for selection backends
        backend = { "telescope", "fzf", "builtin" },
        
        trim_prompt = true,
        
        -- Telescope Integration: Use a compact "Dropdown" theme for menus
        telescope = require("telescope.themes").get_dropdown({
          layout_config = {
            width = 0.5,
            height = 0.5,
          },
        }),
      },
    })
  end,
}