return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui", -- VS Code–like debug UI
    "nvim-neotest/nvim-nio", -- Async helper required by dap-ui
    "williamboman/mason.nvim", -- Package manager
    "jay-babu/mason-nvim-dap.nvim", -- Mason ↔ nvim-dap bridge
  },
  keys = {
    -- Debug keymaps (VS Code–style, but avoid F5 which is used for Run Code)
    {
      "<F9>",
      function()
        require("dap").toggle_breakpoint()
      end,
      desc = "Toggle Breakpoint",
    },
    {
      "<F10>",
      function()
        require("dap").step_over()
      end,
      desc = "Step Over",
    },
    {
      "<F11>",
      function()
        require("dap").step_into()
      end,
      desc = "Step Into",
    },
    {
      "<F12>",
      function()
        require("dap").step_out()
      end,
      desc = "Step Out",
    },
    -- Use <Leader> + F5 to start debugging (F5 is reserved for fast Run Code)
    {
      "<Leader><F5>",
      function()
        require("dap").continue()
      end,
      desc = "Start / Continue Debug",
    },
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    -- 1. Setup DAP UI
    dapui.setup()

    -- Automatically open/close the debug UI
    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end

    -- 2. Automatically install debuggers for C++ and Python
    require("mason-nvim-dap").setup({
      automatic_installation = true,
      handlers = {}, -- Use default handlers
      ensure_installed = { "codelldb", "debugpy" },
    })

    -- 3. C++ debug configuration (using codelldb)
    dap.configurations.cpp = {
      {
        name = "Launch file",
        type = "codelldb",
        request = "launch",
        program = function()
          -- Auto-detect executable (same name as source file, no extension)
          -- Example: main.cpp → ./main
          return vim.fn.getcwd() .. "/" .. vim.fn.expand("%:r")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
      },
    }

    -- Use the same configuration for C
    dap.configurations.c = dap.configurations.cpp

    -- 4. Python configuration
    -- mason-nvim-dap sets this up automatically
    -- Add custom configs here if needed
  end,
}
