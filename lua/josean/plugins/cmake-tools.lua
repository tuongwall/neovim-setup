return {
  "Civitasv/cmake-tools.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("cmake-tools").setup({
      -- Whether to automatically regenerate the build system when saving CMakeLists.txt
      cmake_regenerate_on_save = false,
      
      -- Critical for Clangd: Exports compile_commands.json so LSP can understand your project
      cmake_generate_options = { "-DCMAKE_EXPORT_COMPILE_COMMANDS=1" }, 
      
      -- Default build directory (typically ./build)
      cmake_build_directory = "build", 

      -- Terminal configuration for running code
      cmake_runner = {
        name = "terminal", -- Use Neovim's built-in terminal
        opts = {
          split_direction = "horizontal", -- Open the run window at the bottom
          split_size = 15,                -- Height of the terminal window
        },
      },

      -- Notification settings for build and execution status
      cmake_notifications = {
        runner = { enabled = true },
        executor = { enabled = true },
        spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
      },
    })

    -- KEYMAPS
    local keymap = vim.keymap

    -- 1. Generate (Creates the build system)
    -- Equivalent to: cmake -S . -B build
    keymap.set("n", "<leader>cg", "<cmd>CMakeGenerate<CR>", { desc = "CMake Generate" })

    -- 2. Build (Compiles the source code)
    -- Equivalent to: cmake --build build
    keymap.set("n", "<leader>cb", "<cmd>CMakeBuild<CR>", { desc = "CMake Build" })

    -- 3. Run (Executes the compiled binary)
    -- Equivalent to: ./build/your_executable
    keymap.set("n", "<leader>cr", "<cmd>CMakeRun<CR>", { desc = "CMake Run" })

    -- 4. Select Target (Useful for projects with multiple executables/mains)
    keymap.set("n", "<leader>ct", "<cmd>CMakeSelectLaunchTarget<CR>", { desc = "CMake Select Launch Target" })
  end,
}