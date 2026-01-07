return {
  "olimorris/onedarkpro.nvim",
  priority = 1000, -- Ensure colorscheme loads before other plugins
  config = function()
    -- COLOR PALETTE DEFINITION
    local c = {
      bg      = "#000000", -- Pure black (AMOLED/True Black)
      red     = "#e06c75",
      green   = "#98c379",
      yellow  = "#e5c07b",
      blue    = "#61afef",
      purple  = "#c678dd",
      cyan    = "#56b6c2",
      orange  = "#d19a66",
      grey    = "#5c6370",
      white   = "#abb2bf",
    }

    require("onedarkpro").setup({
      colors = { dark = { bg = c.bg } },
      
      options = {
        cursorline = true,            -- Highlight the current line
        transparency = false,         -- Use solid background
        terminal_colors = true,       -- Use theme colors in built-in terminal
        highlight_inactive_windows = true, -- Dim inactive split windows
        lsp_semantic_tokens = true,   -- Enable high-fidelity LSP syntax highlighting
      },

      highlights = {
        -- === 1. FLAT & SEAMLESS UI OPTIMIZATION ===
        
        -- Global Backgrounds (Code area and File Explorer)
        ["Normal"] = { bg = c.bg },
        ["NormalNC"] = { bg = c.bg },
        ["NvimTreeNormal"] = { bg = c.bg },
        ["NvimTreeNormalNC"] = { bg = c.bg },
        
        -- Remove visual clutter: Hide window separators and end-of-buffer tildes (~)
        ["WinSeparator"] = { fg = c.bg, bg = c.bg },         -- Hide split borders
        ["NvimTreeWinSeparator"] = { fg = c.bg, bg = c.bg }, -- Hide tree borders
        ["EndOfBuffer"] = { fg = c.bg, bg = c.bg },          -- Hide code ~ signs
        ["NvimTreeEndOfBuffer"] = { fg = c.bg, bg = c.bg },    -- Hide tree ~ signs

        -- === 2. CURSOR & LINE HIGHLIGHTING ===
        
        -- Current Line: Subtle dark grey (#121212) to keep text/comments readable
        ["CursorLine"] = { bg = "#121212" },
        ["CursorColumn"] = { bg = "#121212" },
        
        -- [IMPORTANT] Sync line number background with CursorLine to prevent color gaps
        ["CursorLineNr"] = { fg = c.yellow, bg = "#121212" }, 

        -- Cursor appearance: Soft light grey for better visibility
        ["Cursor"] = { bg = "#a0a0a0", fg = c.bg },
        ["TermCursor"] = { bg = "#a0a0a0", fg = c.bg },

        -- === 3. CODE SYNTAX HIGHLIGHTING (TREESITTER) ===
        ["@variable"] = { fg = c.red },
        ["@variable.builtin"] = { fg = c.yellow },
        ["@parameter"] = { fg = c.red },
        ["@field"] = { fg = c.red },
        ["@property"] = { fg = c.red },
        
        ["@function"] = { fg = c.blue, style = "bold" },
        ["@function.builtin"] = { fg = c.cyan },
        ["@function.macro"] = { fg = c.blue },
        
        ["@keyword"] = { fg = c.purple, style = "italic" },
        ["@keyword.function"] = { fg = c.purple, style = "italic" },
        ["@keyword.operator"] = { fg = c.purple },
        
        ["@operator"] = { fg = c.cyan },
        ["@string"] = { fg = c.green },
        ["@comment"] = { fg = c.grey, style = "italic" },
        
        ["@number"] = { fg = c.orange },
        ["@float"] = { fg = c.orange },
        ["@boolean"] = { fg = c.orange },
        ["@constant"] = { fg = c.orange },
        ["@constant.builtin"] = { fg = c.orange },
        
        ["@type"] = { fg = c.yellow },
        ["@type.builtin"] = { fg = c.yellow },
        ["@constructor"] = { fg = c.yellow },
        ["@class"] = { fg = c.yellow },
        
        ["@tag"] = { fg = c.red },
        ["@tag.attribute"] = { fg = c.orange },
        ["@tag.delimiter"] = { fg = c.white },
        
        ["@punctuation.bracket"] = { fg = c.white },
        ["@punctuation.delimiter"] = { fg = c.white },
        
        -- Legacy Fallbacks
        ["Identifier"] = { fg = c.red },
        ["Function"] = { fg = c.blue },
        ["Statement"] = { fg = c.purple },
        ["Constant"] = { fg = c.orange },
        ["Type"] = { fg = c.yellow },
        ["String"] = { fg = c.green },

        -- Git Support
        ["NvimTreeGitIgnored"] = { fg = "#abb2bf" }, -- Restore visibility for ignored files

        -- Rainbow Brackets (Rainbow Delimiters Integration)
        ["RainbowDelimiterRed"]    = { fg = c.red },
        ["RainbowDelimiterYellow"] = { fg = c.yellow },
        ["RainbowDelimiterBlue"]   = { fg = c.blue },
        ["RainbowDelimiterOrange"] = { fg = c.orange },
        ["RainbowDelimiterGreen"]  = { fg = c.green },
        ["RainbowDelimiterViolet"] = { fg = c.purple },
        ["RainbowDelimiterCyan"]   = { fg = c.cyan },
      }      
    })
    
    vim.cmd("colorscheme onedark")
  end,
}