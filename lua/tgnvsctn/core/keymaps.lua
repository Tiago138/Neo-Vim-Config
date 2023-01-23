vim.g.mapleader = " "

local keymap = vim.keymap

---------------------------
-- normal mode keymaps --
---------------------------

keymap.set("n", "<leader>nh", ":nohl<CR>") -- clear search highlights

keymap.set("n", "x", '"_x') -- delete a single character and don't add to the register

keymap.set("n", "<leader>sv", "<C-w>v") -- split window horizontally
keymap.set("n", "<leader>sh", "<C-w>s") -- split window vertically
keymap.set("n", "<leader>se", "<C-w>=") -- make split window evenly
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") -- go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") -- to to previous tab

keymap.set("n", "J", "mzJ`z") -- takes the line below and appends with a space and keeps the cursor at the beginning of the line
keymap.set("n", "<C-d>", "<C-d>zz") -- move half page down and center cursor
keymap.set("n", "<C-u>", "<C-u>zz") -- move half page up and center cursor
keymap.set("n", "n", "nzzzv") -- keeps the search terms in the middle of the screen
keymap.set("n", "N", "Nzzzv") -- keeps the search terms in the middle of the screen

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

---------------------------
-- visual mode keymaps --
---------------------------

keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- move selection down
keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- move selection up
keymap.set("v", "<leader>y", '"+y') -- copy to the system clipboard

----------------------
-- Plugin Keymaps --
----------------------

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- maximize tab
