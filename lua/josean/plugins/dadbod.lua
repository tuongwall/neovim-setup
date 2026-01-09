return {
  {
    "tpope/vim-dadbod",
    dependencies = {
      "kristijanhusak/vim-dadbod-ui", -- UI interface for vim-dadbod
      "kristijanhusak/vim-dadbod-completion", -- SQL autocompletion support
    },
    cmd = {
      "DBUI",
      "DBUIToggle",
      "DBUIAddConnection",
      "DBUIFindBuffer",
    },

    -- Added a keyboard shortcut (Leader + d + b) to open and close DBUI.
    keys = {
      { "<leader>db", "<cmd>DBUIToggle<cr>", desc = "Toggle DB UI" },
    },

    init = function()
      -- Basic UI configuration
      vim.g.db_ui_use_nerd_fonts = 1 -- Enable Nerd Fonts icons
      vim.g.db_ui_show_database_icon = 1 -- Show database icons in the UI

      -- Optional: automatically execute helper queries for tables
      -- vim.g.db_ui_auto_execute_table_helpers = 1

      --Important: Where to save your connections
      -- This helps prevent you from losing your connection when you restart your computer
      vim.g.db_ui_save_location = vim.fn.stdpath("config") .. "/db_ui"
    end,
  },
}
