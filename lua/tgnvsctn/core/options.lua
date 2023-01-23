local opt = vim.opt

-- line numbers
opt.number = true
opt.relativenumber = true

-- tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- line wrapping
opt.wrap = false

-- search settings
-- opt.hlsearch = false
-- opt.incsearch = true
-- opt.ignorecase = true
-- opt.smartcase = true

-- cursor line
opt.cursorline = true

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.scrolloff = 8
opt.signcolumn = "yes"
vim.opt.updatetime = 50

-- backspace
opt.backspace = "indent,eol,start"

-- split windows
opt.splitright = true
opt.splitbelow = true

-- opt.isfname:append("@-@")
-- opt.iskeyword:append("-")
