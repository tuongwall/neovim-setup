return {
  "numToStr/Comment.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    -- Required for context-aware commenting (e.g., commenting HTML inside JS)
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  config = function()
    local comment = require("Comment")

    -- Safely attempt to load the Treesitter context integration
    local ok, ts_comment = pcall(
      require,
      "ts_context_commentstring.integrations.comment_nvim"
    )

    comment.setup({
      padding = true,    -- Add a space between comment symbol and text
      sticky = true,     -- Keep cursor at its current position after commenting

      -- Toggle mappings for Normal mode
      toggler = {
        line = "gcc",    -- Toggle line comment
        block = "gbc",   -- Toggle block comment
      },

      -- Operator-pending mappings (used with motions like gcj, gck, gcap)
      opleader = {
        line = "gc",     -- Line-wise comment prefix
        block = "gb",    -- Block-wise comment prefix
      },

      -- Extra mappings for specific positions
      extra = {
        above = "gcO",   -- Add comment on the line above
        below = "gco",   -- Add comment on the line below
        eol = "gcA",     -- Add comment at the end of the line
      },

      -- Integration with Treesitter: Only enable if the plugin is successfully loaded
      -- This allows correct commenting in files with multiple languages (like JSX/Svelte)
      pre_hook = ok and ts_comment.create_pre_hook() or nil,
    })
  end,
}