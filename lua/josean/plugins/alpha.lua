return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- 1. HEADER: ASCII Art Logo
    dashboard.section.header.val = {
      "                                                     ",
      "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
      "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
      "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
      "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
      "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
      "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
      "                                                     ",
    }

    -- 2. BUTTONS: Quick Access Navigation
    dashboard.section.buttons.val = {
      dashboard.button("e", "  > New File", "<cmd>ene<CR>"),
      dashboard.button("SPC ee", "  > Toggle file explorer", "<cmd>NvimTreeToggle<CR>"),
      dashboard.button("SPC ff", "󰱼 > Find File", "<cmd>Telescope find_files<CR>"),
      dashboard.button("SPC fs", "  > Find Word", "<cmd>Telescope live_grep<CR>"),
      -- Note: Requires 'auto-session' plugin to function
      dashboard.button("SPC wr", "󰁯  > Restore Session", "<cmd>SessionRestore<CR>"), 
      dashboard.button("q", " > Quit NVIM", "<cmd>qa<CR>"),
    }

    -- 3. FOOTER: Startup Statistics
    -- Calculates loaded plugins and total startup time
    dashboard.section.footer.val = function()
      local stats = require("lazy").stats()
      local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
      return "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms"
    end

    -- 4. STYLING: Colors and Layout
    dashboard.section.header.opts.hl = "AlphaHeader"   -- Highlight group for logo
    dashboard.section.buttons.opts.hl = "AlphaButtons" -- Highlight group for buttons
    dashboard.section.footer.opts.hl = "AlphaFooter"   -- Highlight group for footer
    
    dashboard.config.layout[1].val = 2 -- Top padding (vertical offset)

    -- Apply the configuration
    alpha.setup(dashboard.config)

    -- Disable code folding specifically for the dashboard buffer
    vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
  end,
}