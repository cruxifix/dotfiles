local keymap = vim.keymap

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Modes
--  normal mode = "n"
--  insert mode = "i"
--  visual mode = "v"
--  visual block mode = "x"
--  term mode = "t"
--  command mode = "c"

-- Do not yank with x
keymap.set('n', 'x', '"_x')

-- Paste replace visual selection without copying it
keymap.set('v', 'p', '"_dP')

-- Do not copy to clipboard upon delete
keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- Save to system clipboard
keymap.set({"n", "v"}, "<leader>y", [["+y]])
keymap.set("n", "<leader>Y", [["+Y]])

-- Better window navigation
keymap.set('', '<C-h>', '<C-w><C-h>')
keymap.set('', '<C-j>', '<C-w><C-j>')
keymap.set('', '<C-k>', '<C-w><C-k>')
keymap.set('', '<C-l>', '<C-w><C-l>')

-- Reslect visual selection after indenting
keymap.set('v', '<', '<gv')
keymap.set('v', '>', '>gv')
