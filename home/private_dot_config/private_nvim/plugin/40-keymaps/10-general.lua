require('which-key').add({
  { mode = { 'n', 'x' }, lhs = '<leader>t', group = '[t]oggle', icon = '' },
  { mode = { 'n', 'x' }, lhs = '<leader>g', group = '[g]it', icon = '󰊢' },
})

vim.keymap.set(
  'n',
  '<Esc>',
  '<cmd>nohlsearch<CR>',
  { desc = 'Remove search highlight' }
)

vim.keymap.set(
  'n',
  '<A-j>',
  "<cmd>execute 'move .+' . v:count1<cr>==",
  { desc = 'Move Down (selected lines)' }
)
vim.keymap.set(
  'n',
  '<A-k>',
  "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==",
  { desc = 'Move Up (selected lines)' }
)
vim.keymap.set(
  'i',
  '<A-j>',
  '<esc><cmd>m .+1<cr>==gi',
  { desc = 'Move Down (selected lines)' }
)
vim.keymap.set(
  'i',
  '<A-k>',
  '<esc><cmd>m .-2<cr>==gi',
  { desc = 'Move Up (selected lines)' }
)
vim.keymap.set(
  'v',
  '<A-j>',
  ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv",
  { desc = 'Move Down (selected lines)' }
)
vim.keymap.set(
  'v',
  '<A-k>',
  ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv",
  { desc = 'Move Up (selected lines)' }
)
-- Keep cursor in the middle while navigating and searching
-- TODO: These keymaps don't play well with which-key
-- vim.keymap.set('n', '<C-d>', '<C-d>zz')
-- vim.keymap.set('n', '<C-u>', '<C-u>zz')
-- vim.keymap.set('n', 'n', 'nzzzv')
-- vim.keymap.set('n', 'N', 'Nzzzv')
vim.keymap.set(
  'n',
  '<leader>e',
  function() require('oil').open_float() end,
  { desc = 'Open File [E]xplorer' }
)
