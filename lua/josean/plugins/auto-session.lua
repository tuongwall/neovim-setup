return {
  "rmagatti/auto-session",
  config = function()
    local auto_session = require("auto-session")

    auto_session.setup({
      -- Set to false so Alpha Dashboard appears first instead of jumping into a session
      auto_restore_enabled = false, 
      
      -- List of directories where sessions should NOT be automatically saved/restored
      -- This prevents cluttering your session list with temporary or system folders
      auto_session_suppress_dirs = { "~/", "~/Downloads", "~/Documents", "~/Desktop/" },

      -- Telescope integration for session management (Session Lens)
      session_lens = {
        buftypes_to_ignore = {}, -- List of buffer types to exclude from the session
        load_on_setup = true,    -- Initialize session lens with the plugin
        theme_conf = { border = true }, -- UI customization
        previewer = false,       -- Disable file preview for a cleaner look
      },
    })

    local keymap = vim.keymap

    -- Restore session for the current working directory (Matches the Dashboard button)
    keymap.set("n", "<leader>wr", "<cmd>SessionRestore<CR>", { desc = "Restore session for current directory" })
    
    -- Manually save the current session
    keymap.set("n", "<leader>ws", "<cmd>SessionSave<CR>", { desc = "Save session for current directory" }) 
  end,
}