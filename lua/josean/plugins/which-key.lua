return {
  "folke/which-key.nvim",
  -- Load after startup to keep Neovim's initial launch fast
  event = "VeryLazy", 
  init = function()
    vim.o.timeout = true
    -- Delay (ms) before the popup appears (300ms is the "sweet spot" for responsiveness)
    vim.o.timeoutlen = 300 
  end,
  opts = {
    -- PLUGIN & PRESET CONFIGURATION
    plugins = {
      spelling = {
        enabled = true, -- Show spelling suggestions inside the which-key popup
        suggestions = 20,
      },
      presets = {
        operators = false,    -- Hide help for operators (d, y, etc.) to reduce clutter
        motions = false,      -- Hide help for basic motions (h, j, k, l)
        text_objects = true,  -- Show help for text objects (e.g., inside word 'iw')
        windows = true,       -- Show help for window management (<C-w> commands)
        nav = true,           -- Show help for navigation (e.g., tab switching gt, gT)
        z = true,             -- Show help for 'z' prefix commands (e.g., zz, zt)
        g = true,             -- Show help for 'g' prefix commands (e.g., gg, G)
      },
    },
    
    -- UI: ICONS AND SEPARATORS
    icons = {
      breadcrumb = "»", -- Icon used in the hierarchical breadcrumb path
      separator = "➜",  -- Icon separating the key from its description
      group = "+",       -- Icon prefix for folder/group names
    },
    
    -- UI: POPUP LAYOUT
    layout = {
      height = { min = 4, max = 25 }, -- Minimum and maximum height of the window
      width = { min = 20, max = 50 },  -- Minimum and maximum width of the columns
      spacing = 3,                    -- Horizontal spacing between columns
      align = "left",                 -- Align text to the left of the column
    },

    -- KEY GROUP DEFINITIONS
    -- Assigns descriptive labels to leader-key prefixes for easier navigation
    spec = {
      { "<leader>b", group = "Buffers" },             -- Buffer management
      { "<leader>c", group = "Code" },                -- Code actions (LSP)
      { "<leader>e", group = "Explorer" },            -- File Explorer (NvimTree)
      { "<leader>f", group = "Find (Telescope)" },    -- Fuzzy finding
      { "<leader>g", group = "Git" },                 -- Global Git actions
      { "<leader>h", group = "Gitsigns/Hunk" },       -- Local Git hunk manipulation
      { "<leader>l", group = "LSP" },                 -- LSP Configuration/Server info
      { "<leader>s", group = "Search/Replace" },      -- Search and substitution
      { "<leader>t", group = "Tabs/Terminal" },       -- Tab and terminal management
      { "<leader>w", group = "Window" },              -- Window split management
      { "<leader>x", group = "Diagnostics/Quickfix" },-- Error and warning lists (Trouble)
      
      -- Quick Access Shortcuts
      { "<leader>q", "<cmd>q<cr>", desc = "Quit Current Window" },
      { "<leader>W", "<cmd>w<cr>", desc = "Save Current File" },
    },
  },
}