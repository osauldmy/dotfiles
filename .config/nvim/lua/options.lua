local set = vim.opt

-- left sidebar (numbers, diagnostics, etc)
set.relativenumber = true
set.number = true
set.cursorline = true
set.cursorlineopt = "number"
set.signcolumn = "yes"

-- indentation
set.autoindent = true
set.smartindent = true

-- extra files
set.backup = false
set.swapfile = false
set.undofile = true
set.undodir = vim.fn.stdpath("cache") .. "/undodir"

-- folding (for UFO)
set.foldenable = true
set.foldcolumn = "1"
set.foldlevel = 1
set.foldlevelstart = 99
set.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

-- searching
set.hlsearch = false
set.incsearch = true

-- tab and expanding
set.tabstop = 2
set.shiftwidth = 2
set.expandtab = true

-- spelling
set.spell = true

-- misc
set.completeopt = { "menu", "menuone", "noselect" }
set.wrap = false
set.scrolloff = 15
set.splitbelow = true
set.splitright = true
set.termguicolors = true
set.mouse = "a"
