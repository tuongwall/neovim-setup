return {
  "windwp/nvim-autopairs",
  event = { "InsertEnter" },
  dependencies = {
    "hrsh7th/nvim-cmp",
  },
  config = function()
    -- Import nvim-autopairs
    local autopairs = require("nvim-autopairs")

    -- Configure autopairs
    autopairs.setup({
      check_ts = true, -- Enable Treesitter integration for smarter context awareness
      ts_config = {
        lua = { "string" }, -- Don't add pairs inside Lua string nodes
        javascript = { "template_string" }, -- Don't add pairs inside JS template strings
        java = false, -- Disable Treesitter check for Java
      },
    })

    -- INTEGRATION WITH NVIM-CMP
    -- This setup automatically adds parentheses '()' after selecting a function or method from the completion menu
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    local cmp = require("cmp")

    -- Trigger the 'confirm_done' event: When a completion item is selected, autopairs handles the brackets
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
  end,
}