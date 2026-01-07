vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

opt.relativenumber = true
opt.number = true

-----------------------------------------------------------
-- 1. INDENTATION CONFIGURATION
-----------------------------------------------------------

-- === GROUP 1: DEFAULT = 4 SPACES ===
-- Automatically applied for:
-- 1. Dockerfile
-- 2. Shell scripts (Bash, Zsh, Sh)
-- 3. Git-related files (gitconfig, gitcommit)
-- 4. Backend / System languages:
--    Python, C, C++, Java, Go, Rust, PHP, etc.
opt.tabstop = 4 -- One tab equals 4 spaces
opt.shiftwidth = 4 -- Indent using 4 spaces
opt.expandtab = true -- Convert tabs to spaces
opt.autoindent = true -- Copy indentation from previous line

-- === GROUP 2: EXCEPTIONS = 2 SPACES ===
-- Automatically switch to 2 spaces for these filetypes
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    -- Web Front-end
    "html",
    "css",
    "scss",
    "javascript",
    "typescript",
    "javascriptreact",
    "typescriptreact", -- React (JSX / TSX)
    "vue",
    "svelte",

    -- Lightweight config & data formats
    "json",
    "yaml", -- Important: docker-compose.yml uses 2 spaces
    "xml",
    "toml",
    "lua", -- Neovim config files use 2 spaces
    "ruby",
  },
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
  end,
})

-----------------------------------------------------------
-- 2. OTHER SETTINGS (UNCHANGED)
-----------------------------------------------------------

-- Line numbers
opt.relativenumber = true
opt.number = true

-- Disable line wrapping
opt.wrap = false

-- Search behavior
opt.ignorecase = true
opt.smartcase = true

-- UI / Appearance
opt.cursorline = true
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- System behavior
opt.clipboard:append("unnamedplus") -- Use system clipboard
opt.splitright = true -- Vertical split to the right
opt.splitbelow = true -- Horizontal split to the bottom
opt.swapfile = false -- Disable swap file
opt.backspace = "indent,eol,start" -- Backspace behavior
