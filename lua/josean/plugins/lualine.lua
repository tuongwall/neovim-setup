return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status") -- Module to check for plugin updates

    -- Custom color palette for UI status indicators
    local colors = {
      error_red     = "#FF4A4A", -- Vivid red for errors (Bugs)
      warn_yellow   = "#FFDA7B",
      update_orange = "#ff9e64",
    }

    lualine.setup({
      options = {
        theme = "auto", -- Automatically matches the active colorscheme
        globalstatus = true, -- Use a single statusline across all splits
        
        -- Powerline-style separators (Triangle shapes)
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        
        -- Hide statusline on specific UI buffers
        disabled_filetypes = { statusline = { "dashboard", "alpha", "starter" } },
      },
      sections = {
        -- LEFT SECTIONS
        lualine_a = {
          { 
            "mode", 
            icon = "", -- Arch Linux Logo
            padding = 2 
          },
        },
        lualine_b = {
          { "branch", icon = "" },
          "diff",
          {
            "diagnostics",
            sources = { "nvim_lsp" },
            symbols = { error = ' ', warn = ' ', info = ' ' },
            -- [IMPORTANT] Force high-visibility colors for Bugs/Diagnostics
            diagnostics_color = {
              error = { fg = colors.error_red, gui = "bold" }, -- Errors appear in BOLD RED
              warn  = { fg = colors.warn_yellow },
            },
          },
        },
        lualine_c = { 
          { "filename", path = 1 } -- Shows relative file path
        },

        -- RIGHT SECTIONS
        lualine_x = {
          -- Plugin update notifications via lazy.nvim
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = colors.update_orange },
          },
          { "encoding" },
          { "fileformat" },
          { "filetype" },
        },
        lualine_y = { "progress" }, -- Percentage through the file
        lualine_z = { "location" }, -- Current line and column numbers
      },
    })
  end,
}