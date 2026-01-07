return {
  "kylechui/nvim-surround",
  -- Load on "VeryLazy" to keep startup fast while ensuring it's ready when you begin editing
  event = "VeryLazy", 
  config = function()
    require("nvim-surround").setup({
      -- Default keymaps follow the 'vim-surround' convention for muscle memory
      keymaps = {
        insert          = "<C-g>s",
        insert_line     = "<C-g>S",

        normal          = "ys",   -- Add surround (e.g., ysw" to surround word with quotes)
        normal_cur      = "yss",  -- Add surround to current line
        normal_line     = "yS",
        normal_cur_line = "ySS",

        visual          = "S",    -- Add surround to visual selection
        visual_line     = "gS",

        delete          = "ds",   -- Delete surround (e.g., ds" to remove quotes)
        change          = "cs",   -- Change surround (e.g., cs"' to change " to ')
        change_line     = "cS",
      },

      -- Visual feedback: Brief highlight during the surround operation
      highlight = {
        duration = 200,
      },

      -- Cursor behavior: 'sticky' keeps the cursor in a logical position after the operation
      move_cursor = "sticky",

      -- Aliases: Shortcuts for specific delimiters (Excellent for HTML/JSX tags)
      aliases = {
        ["a"] = ">",            -- Angle brackets / Tags
        ["b"] = ")",            -- Parentheses
        ["B"] = "}",            -- Curly braces
        ["r"] = "]",            -- Square brackets
        ["q"] = { '"', "'", "`" }, -- Smart quote detection
      },
    })
  end,
}