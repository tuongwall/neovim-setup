return {
  "mgierada/lazydocker.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  
  -- Lazy-load the plugin only when the :LazyDocker command is executed
  cmd = "LazyDocker", 
  
  keys = {
    -- Shortcut: Space + l + d to open the Docker management interface
    { "<leader>ld", "<cmd>LazyDocker<CR>", desc = "Open LazyDocker" },
  },
  
  config = function()
    -- Initialize the plugin with default settings
    require("lazydocker").setup({})
  end,
}