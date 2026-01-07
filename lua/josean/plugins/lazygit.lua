return {
  "kdheepak/lazygit.nvim",
  -- Lazy-load the plugin only when one of these commands is called
  cmd = {
    "LazyGit",
    "LazyGitConfig",
    "LazyGitCurrentFile",
    "LazyGitFilter",
    "LazyGitFilterCurrentFile",
  },
  -- Required dependencies
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  -- Keybindings to trigger LazyGit
  keys = {
    -- Press Space + l + g to open the LazyGit terminal interface
    { "<leader>lg", "<cmd>LazyGit<CR>", desc = "Open LazyGit" },
  },
}