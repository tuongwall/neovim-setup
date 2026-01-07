return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false, -- Load immediately to ensure the explorer is available on startup
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    -- Disable netrw (the built-in Vim file explorer) to prevent conflicts
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    require("nvim-tree").setup({
      -- 1. VIEW CONFIGURATION
      view = {
        width = 30,
        side = "left",          -- Anchor the explorer to the left side
        signcolumn = "yes",      -- Always show the sign column for icons/git status
        relativenumber = true,   -- Use relative line numbers for faster navigation with j/k
      },
      
      -- 2. RENDERING & ICON CUSTOMIZATION
      renderer = {
        root_folder_label = false, -- Hide the path label of the root folder
        highlight_git = true,      -- Color-code filenames based on Git status
        indent_markers = { enable = true }, -- Show visual lines for folder nesting
        icons = {
          glyphs = {
            default = "󰈚",
            symlink = "",
            folder = {
              default = "",
              empty = "",
              empty_open = "",
              open = "",
              symlink = "",
              symlink_open = "",
              arrow_open = "",
              arrow_closed = "",
            },
            git = {
              unstaged = "✗",
              staged = "✓",
              unmerged = "",
              renamed = "➜",
              untracked = "★",
              deleted = "",
              ignored = "◌",
            },
          },
        },
      },

      -- 3. INTERACTION & FILE OPENING BEHAVIOR
      actions = {
        open_file = {
          quit_on_open = false,   -- Keep the tree open after selecting a file
          resize_window = true,    -- Automatically resize the tree when opening files
          window_picker = {
            enable = false,        -- Disable picker for a smoother experience when using splits
          },
        },
      },

      -- 4. FILTERS (HIDE/SHOW FILES)
      filters = {
        dotfiles = false,          -- Show hidden files (starting with a dot)
        custom = { "^.git$" },     -- Specifically hide the .git folder
      },

      -- 5. GIT INTEGRATION
      git = {
        enable = true,
        ignore = false,            -- Still show files that are in .gitignore
      },
    })

    -- KEYMAPS
    local keymap = vim.keymap 
    
    -- Open/Close the file explorer
    keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" }) 
    
    -- Open the explorer and focus on the file currently being edited
    keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle explorer on current file" }) 
    
    -- Collapse all open folders in the tree
    keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" }) 
    
    -- Manually refresh the file tree
    keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" }) 
   end,
}