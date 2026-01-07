vim.cmd("let g:netrw_liststyle = 3")


local opt = vim.opt

opt.relativenumber = true
opt.number = true

-----------------------------------------------------------
-- 1. CẤU HÌNH THỤT ĐẦU DÒNG (INDENTATION)
-----------------------------------------------------------

-- === NHÓM 1: MẶC ĐỊNH LÀ 4 SPACES ===
-- Tự động áp dụng cho:
-- 1. Dockerfile
-- 2. Shell Script (Bash, Zsh, Sh)
-- 3. Git (gitconfig, gitcommit)
-- 4. Các ngôn ngữ Backend/System: Python, C, C++, Java, Go, Rust, PHP...
opt.tabstop = 4       -- 1 tab = 4 spaces
opt.shiftwidth = 4    -- Thụt lề 4 spaces
opt.expandtab = true  -- Chuyển tab thành spaces
opt.autoindent = true -- Copy thụt lề từ dòng trên

-- === NHÓM 2: NGOẠI LỆ 2 SPACES ===
-- Tự động chuyển về 2 spaces khi mở các loại file này
vim.api.nvim_create_autocmd("FileType", {
  pattern = { 
    -- Web Front-end
    "html", "css", "scss", 
    "javascript", "typescript", 
    "javascriptreact", "typescriptreact", -- React (JSX/TSX)
    "vue", "svelte", 
    
    -- Config Data & Script nhẹ
    "json", 
    "yaml", -- Quan trọng: docker-compose.yml dùng cái này (2 spaces)
    "xml", 
    "toml",
    "lua",  -- File config Neovim dùng 2 spaces
    "ruby"
  },
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
  end,
})

-----------------------------------------------------------
-- 2. CÁC CẤU HÌNH KHÁC (GIỮ NGUYÊN)
-----------------------------------------------------------

-- Hiển thị số dòng
opt.relativenumber = true
opt.number = true

-- Không ngắt dòng
opt.wrap = false

-- Tìm kiếm
opt.ignorecase = true
opt.smartcase = true

-- Giao diện
opt.cursorline = true
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- Hệ thống
opt.clipboard:append("unnamedplus") -- Clipboard
opt.splitright = true    -- Chia màn hình
opt.splitbelow = true
opt.swapfile = false     -- Tắt swap
opt.backspace = "indent,eol,start"
