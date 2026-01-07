return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate", -- Automatically update parsers when the plugin is updated
  dependencies = {
    "windwp/nvim-ts-autotag", -- Integration for automatic HTML/JSX tag closing
  },
  config = function()
    -- Safely load the treesitter configuration module
    local status, treesitter = pcall(require, "nvim-treesitter.configs")
    if not status then
      return
    end

    treesitter.setup({
      -- 1. SYNTAX HIGHLIGHTING
      highlight = {
        enable = true,
        -- Disable standard Vim regex highlighting for better performance and accuracy
        additional_vim_regex_highlighting = false,
      },
      
      -- 2. INTELLIGENT INDENTATION
      indent = { enable = true },
      
      -- 3. HTML/JSX AUTOTAG
      -- Automatically closes tags (e.g., typing <div> creates </div>)
      autotag = {
        enable = true,
      },

      -- 4. AUTOMATIC PARSER INSTALLATION
      -- Automatically downloads and installs parsers when opening a new file type
      auto_install = true, 

      -- 5. LANGUAGE PARSERS
      -- List of languages to ensure are always installed and ready
      ensure_installed = {
        "json",
        "javascript",
        "typescript",
        "tsx",
        "yaml",
        "html",
        "css",
        "prisma",
        "markdown",
        "markdown_inline",
        "svelte",
        "graphql",
        "bash",
        "lua",
        "vim",
        "dockerfile",
        "gitignore",
        "query",
        "vimdoc",
        "c",
        "cpp",
        "python",
        -- Added languages based on your requirements
        "rust",
        "java",
      },

      -- 6. INCREMENTAL SELECTION
      -- Allows you to expand or shrink text selection based on code structure
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",    -- Start selection
          node_incremental = "<C-space>",  -- Expand selection to the next logical block
          scope_incremental = false,
          node_decremental = "<bs>",       -- Shrink selection (Backspace)
        },
      },
    })
  end,
}
