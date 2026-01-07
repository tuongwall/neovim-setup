return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
  config = function()
    local bufferline = require("bufferline")

    bufferline.setup({
      options = {
        -- Switched to "tabs" mode as per your request (treats each UI tab as a separate workspace)
        mode = "tabs", 
        separator_style = "slant",
        
        -- Integration with LSP to show error/warning counts on the tabs
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
          local icon = level:match("error") and " " or " "
          return " " .. icon .. count
        end,

        -- Ensure the tab bar doesn't overlap with NvimTree
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            text_align = "left",
            separator = true,
          }
        },
        
        always_show_bufferline = true,
      },
    })

    -- KEYMAPS - UPDATED FOR TAB NAVIGATION
    local keymap = vim.keymap

    -- 1. Quickly switch between Tabs (using Shift + h/l)
    keymap.set("n", "<S-h>", "<cmd>tabprevious<CR>", { desc = "Go to previous tab" })
    keymap.set("n", "<S-l>", "<cmd>tabnext<CR>", { desc = "Go to next tab" })

    -- 2. General Tab Management
    keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) 
    keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) 
    keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) 
    keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
    
    -- Open the current file in a new tab (useful for focusing on one file)
    keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) 
  end,
}