vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

-- tabs & indentations
opt.tabstop = 2
opt.shiftwidth = 2
opt.relativenumber = true
opt.number = true
opt.expandtab = true
opt.autoindent = true

opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

opt.cursorline = true

-- termguicolors
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default

-- split window
opt.splitright = true
opt.splitbelow = true

-- folding from treesitter
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldlevel = 10
vim.o.foldlevelstart = 5
vim.o.foldminlines = 1
-- Custom fold text to show only method declarations
vim.cmd([[
function! CustomFoldText()
  let line = getline(v:foldstart)
  let folded = ' ... '
  let lines_count = v:foldend - v:foldstart + 1
  let suffix = ' ' . lines_count . ' lines '
  return line . folded . suffix
endfunction

set foldtext=CustomFoldText()
]])
