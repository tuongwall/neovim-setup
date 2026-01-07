return {
  "HiPhish/rainbow-delimiters.nvim",
  -- Load the plugin only after a file is read into a buffer
  event = "BufReadPost", 
  config = function()
    local rainbow_delimiters = require("rainbow-delimiters")

    -- Global configuration for rainbow brackets/delimiters
    vim.g.rainbow_delimiters = {
      strategy = {
        -- Default strategy: Global (handles standard files efficiently)
        [""] = rainbow_delimiters.strategy["global"],
        -- Use Local strategy for Vim files (better performance for complex Vim scripts)
        vim = rainbow_delimiters.strategy["local"],
      },
      query = {
        -- Default Treesitter query for identifying delimiters
        [""] = "rainbow-delimiters",
        -- Use a specific query for Lua to handle code blocks correctly
        lua = "rainbow-blocks",
      },
      -- Highlight groups used for cycling colors
      -- These names must match the highlight groups defined in your colorscheme (e.g., onedarkpro)
      highlight = {
        "RainbowDelimiterRed",
        "RainbowDelimiterYellow",
        "RainbowDelimiterBlue",
        "RainbowDelimiterOrange",
        "RainbowDelimiterGreen",
        "RainbowDelimiterViolet",
        "RainbowDelimiterCyan",
      },
    }
  end,
}