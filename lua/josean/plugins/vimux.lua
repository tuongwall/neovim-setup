return {
  "preservim/vimux",
  event = "VeryLazy", -- Load after startup
  config = function()
    -- Vimux settings
    vim.g.VimuxOrientation = "h"
    vim.g.VimuxHeight = "30"
    vim.g.VimuxCloseOnExit = 0

    -- Run current file with F5
    local function run_code_f5()
      vim.cmd("write") -- Save file

      local ft = vim.bo.filetype
      local file = vim.fn.expand("%")
      local file_no_ext = vim.fn.expand("%:r")

      -- Commands by filetype
      local commands = {
        c = "gcc " .. file .. " -o " .. file_no_ext .. " && ./" .. file_no_ext,
        cpp = "g++ " .. file .. " -o " .. file_no_ext .. " && ./" .. file_no_ext,
        rust = "cargo run",
        python = "python " .. file,
        javascript = "node " .. file,
        typescript = "ts-node " .. file,
        lua = "lua " .. file,
        sh = "bash " .. file,
      }

      local cmd = commands[ft]

      if not cmd then
        print("F5: Unsupported filetype: " .. ft)
        return
      end

      if not vim.env.TMUX then
        print("ERROR: Vimux requires tmux!")
        return
      end

      vim.fn.VimuxRunCommand("clear; " .. cmd)
    end

    -- F5 keymap
    vim.keymap.set("n", "<F5>", run_code_f5, {
      noremap = true,
      silent = true,
      desc = "Run file in tmux (Vimux)",
    })
  end,
}
