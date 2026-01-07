return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    -- Native C implementation of fzf for significantly faster sorting and filtering
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
    "folke/todo-comments.nvim",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        -- 'smart' optimizes the path display by hiding redundant parent directories
        path_display = { "smart" },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- Navigate to the previous result
            ["<C-j>"] = actions.move_selection_next,     -- Navigate to the next result
            -- Send selected items to the Quickfix list for bulk editing
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
      },
      -- Extension configuration: Performance-focused fzf settings
      extensions = {
        fzf = {
          fuzzy = true,                   -- Enable fuzzy matching logic
          override_generic_sorter = true, -- Use fzf for the generic sorter
          override_file_sorter = true,    -- Use fzf for the file sorter
          case_mode = "smart_case",       -- Case-insensitive unless uppercase is used
        },
      },
    })

    -- Load the fzf extension to activate the high-performance sorting
    telescope.load_extension("fzf")

    -- KEYMAPS
    local keymap = vim.keymap -- Alias for conciseness

    -- File Finding
    keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in current directory" })
    keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recently opened files" })
    keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "List and search active buffers" })

    -- Text Searching (requires ripgrep)
    keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Search for a string in current directory" })
    keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find word under cursor in current directory" })

    -- Specialized Search
    keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "List all TODO/FIXME comments" })
  end,
}