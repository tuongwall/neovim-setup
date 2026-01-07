return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local gitsigns = require("gitsigns")

    gitsigns.setup({
      -- Configure markers in the sign column (gutter) to indicate Git status
      signs = {
        add          = { text = "│" }, -- New line added
        change       = { text = "│" }, -- Existing line modified
        delete       = { text = "_" }, -- Line deleted
        topdelete    = { text = "‾" }, -- Line deleted at the top of a file
        changedelete = { text = "~" }, -- Line modified and then partially deleted
        untracked    = { text = "┆" }, -- File is not yet tracked by Git
      },
      
      -- KEYBINDING CONFIGURATION (Attached per buffer)
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        -- Helper function to set keymaps with descriptions
        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
        end

        -- 1. NAVIGATION BETWEEN CHANGES
        -- Jump to the next change block (hunk)
        map("n", "]h", gs.next_hunk, "Next Hunk")
        -- Jump to the previous change block (hunk)
        map("n", "[h", gs.prev_hunk, "Prev Hunk")

        -- 2. GIT ACTIONS
        -- Stage the current hunk (prepare for commit)
        map("n", "<leader>hs", gs.stage_hunk, "Stage hunk")
        -- Reset the current hunk (undo changes to the last commit state)
        map("n", "<leader>hr", gs.reset_hunk, "Reset hunk")
        
        -- Stage all changes in the current file
        map("n", "<leader>hS", gs.stage_buffer, "Stage buffer")
        -- Undo the last staging action for a hunk
        map("n", "<leader>hu", gs.undo_stage_hunk, "Undo stage hunk")
        -- Reset the entire file to its last committed state
        map("n", "<leader>hR", gs.reset_buffer, "Reset buffer")

        -- Preview the original code for the current hunk in a floating window
        map("n", "<leader>hp", gs.preview_hunk, "Preview hunk")

        -- Show full Git blame information for the current line
        map("n", "<leader>hb", function()
          gs.blame_line({ full = true })
        end, "Blame line")
        
        -- Toggle inline blame (shows who edited the line at the end of the line)
        map("n", "<leader>tb", gs.toggle_current_line_blame, "Toggle line blame")

        -- Show a side-by-side diff comparison
        map("n", "<leader>hd", gs.diffthis, "Diff this")
        map("n", "<leader>hD", function()
          gs.diffthis("~") -- Diff against the last commit
        end, "Diff this ~")

        -- 3. TEXT OBJECTS
        -- Allows selecting a hunk using 'ih' (e.g., 'vih' to select, 'dih' to delete)
        map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "Gitsigns select hunk")
      end,
    })
  end,
}