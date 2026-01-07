-- Define the path where the lazy.nvim plugin manager will be installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Automatically clone lazy.nvim if it's not already installed (Bootstrap process)
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- Download the latest stable release
    lazypath,
  })
end

-- Add the lazy.nvim path to Neovim's runtime path so it can be used
vim.opt.rtp:prepend(lazypath)

-- Initialize lazy.nvim
require("lazy").setup({
  -- Specify the directories to import plugin configurations from
  -- This will load all .lua files in lua/josean/plugins/ and lua/josean/plugins/lsp/
  spec = {
    { import = "josean.plugins" },
    { import = "josean.plugins.lsp" },
  },

  -- Check for plugin updates automatically
  checker = {
    enabled = true, -- Enable the update checker
    notify = false, -- Disable intrusive notifications when updates are found
  },

  -- Configuration for detecting changes in the config files
  change_detection = {
    -- Disable the "Config change detected" notification when you save a .lua file
    notify = false, 
  },
})