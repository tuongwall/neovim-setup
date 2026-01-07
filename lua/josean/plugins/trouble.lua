return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
  opts = {
    focus = true, -- Automatically focus the Trouble window when it opens
  },
  -- Lazy-load the plugin only when the :Trouble command is called
  cmd = "Trouble",
  keys = {
    -- 1. DIAGNOSTICS (LSP Errors & Warnings)
    { 
      "<leader>xw", 
      "<cmd>Trouble diagnostics toggle<CR>", 
      desc = "Toggle Workspace Diagnostics (All open files)" 
    },
    { 
      "<leader>xd", 
      "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", 
      desc = "Toggle Document Diagnostics (Current file only)" 
    },

    -- 2. LIST MANAGEMENT
    { 
      "<leader>xq", 
      "<cmd>Trouble quickfix toggle<CR>", 
      desc = "Toggle Quickfix List" 
    },
    { 
      "<leader>xl", 
      "<cmd>Trouble loclist toggle<CR>", 
      desc = "Toggle Location List" 
    },

    -- 3. PLUGINS INTEGRATION
    { 
      "<leader>xt", 
      "<cmd>Trouble todo toggle<CR>", 
      desc = "Toggle Todo-Comments in Trouble" 
    },
  },
}