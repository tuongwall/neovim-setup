return {
  "szw/vim-maximizer",
  -- Lazy-load the plugin only when the shortcut is pressed to optimize startup time
  keys = {
    { 
      "<leader>sm", 
      "<cmd>MaximizerToggle<CR>", 
      desc = "Maximize/Minimize current split window" 
    },
  },
}