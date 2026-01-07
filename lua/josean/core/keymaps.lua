vim.g.mapleader = " "

local keymap = vim.keymap -- Alias for conciseness

-----------------------------------------------------------
-- 1. GENERAL KEYMAPS
-----------------------------------------------------------

-- [IMPORTANT] Press "jk" to exit Insert Mode (Easier than reaching for ESC)
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- Clear search highlights (Press Space + n + h)
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- Increment/Decrement numbers (Space + / Space -)
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

-- Save file using Ctrl + s
keymap.set("n", "<C-s>", ":w<CR>", { desc = "Save file" })

-- Delete character 'x' without copying it to the clipboard
keymap.set("n", "x", '"_x')

-----------------------------------------------------------
-- 2. WINDOW MANAGEMENT
-----------------------------------------------------------

-- Split windows
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })     -- Vertical split
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })   -- Horizontal split
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })      -- Equalize size
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- Close window

-- [IMPORTANT] Navigate between split windows
-- (Essential for controlling cursor movement after splitting)
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to lower window" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to upper window" })

-- Resize windows using arrow keys
keymap.set("n", "<Up>", ":resize +2<CR>")
keymap.set("n", "<Down>", ":resize -2<CR>")
keymap.set("n", "<Left>", ":vertical resize -2<CR>")
keymap.set("n", "<Right>", ":vertical resize +2<CR>")

-----------------------------------------------------------
-- 3. TAB MANAGEMENT
-----------------------------------------------------------
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) 
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) 
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) 
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) 
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) 

-----------------------------------------------------------
-- 4. CODE MOVEMENT & UX IMPROVEMENTS
-----------------------------------------------------------

-- Move selected code block up/down in Visual Mode
-- Similar to VS Code behavior (Alt + Arrows)
keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Keep cursor centered when scrolling (Ctrl+d / Ctrl+u)
-- Helps reduce eye strain
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

-----------------------------------------------------------
-- 5. USEFUL TRICKS (QUALITY OF LIFE)
-----------------------------------------------------------

-- 1. Paste over text without losing the copied content from clipboard
-- (Select text to replace, then press <leader>p)
keymap.set("x", "<leader>p", [["_dP]])

-- 2. Stay in Visual Mode after indenting
-- (Allows you to press < or > multiple times continuously)
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

-- 3. Navigate between BUFFERS (Open files)
-- Use Shift + h / Shift + l to switch between file buffers quickly
keymap.set("n", "<S-h>", ":bprevious<CR>", { desc = "Previous buffer" })
keymap.set("n", "<S-l>", ":bnext<CR>", { desc = "Next buffer" })

-- Close current Buffer (without closing the split window)
keymap.set("n", "<leader>bd", ":bdelete<CR>", { desc = "Close buffer" })

-----------------------------------------------------------
-- 6. PLUGIN KEYMAPS
-----------------------------------------------------------
-- Open file explorer (Netrw)
keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Open Netrw Explorer" })

-- Placeholders for Telescope (Find files) - To be enabled later:
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>")
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<CR>")

-- CMake Plugin Keymaps
keymap.set("n", "<leader>cg", "<cmd>CMakeGenerate<cr>", { desc = "CMake Generate" })
keymap.set("n", "<leader>cb", "<cmd>CMakeBuild<cr>", { desc = "CMake Build" })
keymap.set("n", "<leader>cr", "<cmd>CMakeRun<cr>", { desc = "CMake Run" })
keymap.set("n", "<leader>cs", "<cmd>CMakeSelectBuildType<cr>", { desc = "CMake Select Build Type" })