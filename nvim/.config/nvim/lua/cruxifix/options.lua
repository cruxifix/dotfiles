-- Disable netrw at start, recommended by nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Prefer relative numbers
vim.wo.number = true
vim.wo.relativenumber = true

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

-- No backup
vim.opt.backup = false

-- Highlight search
vim.opt.hlsearch = true
vim.opt.laststatus = 2

vim.opt.hidden = true

-- 2 space tab
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2

-- autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2
-- autocmd FileType javascriptreact setlocal shiftwidth=2 tabstop=2 softtabstop=2
-- autocmd FileType typescript setlocal shiftwidth=2 tabstop=2 softtabstop=2
-- autocmd FileType typescriptreact setlocal shiftwidth=2 tabstop=2 softtabstop=2
-- autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
-- autocmd FileType vue setlocal shiftwidth=2 tabstop=2 softtabstop=2

vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.wrap = false -- No wrap lines

vim.opt.termguicolors = true
vim.opt.cursorline = true

-- Default split position
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.showcmd = true
vim.opt.cmdheight = 1
-- vim.opt.scrolloff = 10
vim.opt.shell = 'zsh'
-- vim.opt.backupskip = '/tmp/*,/private/tmp/*'
-- vim.opt.inccommand = 'split'
-- vim.opt.ignorecase = true
-- vim.opt.backspace = 'start,eol,indent'
-- vim.opt.path:append { '**' } -- Finding files - Search down into subfolders
-- vim.opt.wildignore:append { '*/node_modules/*' }

-- " Set blade files to html for better indenting
-- autocmd BufNewFile,BufRead *.blade.php set syntax=html
-- autocmd BufNewFile,BufRead *.blade.php set filetype=html
-- autocmd BufNewFile,BufRead *.jsx set filetype=html
-- " autocmd BufNewFile,BufRead *.vue set filetype=html
