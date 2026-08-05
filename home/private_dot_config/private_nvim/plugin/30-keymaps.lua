local bufferline = require('bufferline')

require('which-key').add({
  { mode = { 'n', 'x' }, lhs = '<leader>t', group = '[t]oggle', icon = '' },
  { mode = { 'n', 'x' }, lhs = 'gr', group = 'LSP Actions', icon = '' },
  { mode = { 'n', 'x' }, lhs = '<leader>f', group = '[f]ind', icon = '' },
  { mode = { 'n', 'x' }, lhs = '<leader>g', group = '[g]it', icon = '󰊢' },
  {
    mode = { 'n', 'x' },
    lhs = '<leader>n',
    group = '[n]otifications',
    icon = '󰂚',
  },
  {
    mode = { 'n', 'x' },
    lhs = '<leader>b',
    group = '[b]uffers',
    icon = '',
  },
})
vim.keymap.set(
  'n',
  '<leader>bn',
  function() bufferline.cycle(1) end,
  { desc = 'Cycle to [n]ext buffer' }
)
vim.keymap.set(
  'n',
  '<leader>bN',
  function() bufferline.cycle(-1) end,
  { desc = 'Cycle to previous buffer' }
)
vim.keymap.set(
  'n',
  '<leader>bd',
  function() vim.api.nvim_buf_delete(0, {}) end,
  { desc = 'Delete Buffer' }
)
vim.keymap.set(
  'n',
  '<leader>bo',
  bufferline.close_others,
  { desc = 'Delete Other Buffers' }
)
vim.keymap.set(
  'n',
  '<leader>bl',
  function() bufferline.close_in_direction('right') end,
  { desc = 'Delete buffers to the right' }
)
vim.keymap.set(
  'n',
  '<leader>bh',
  function() bufferline.close_in_direction('left') end,
  { desc = 'Delete buffers to the left' }
)
vim.keymap.set(
  'n',
  '<leader>bp',
  require('bufferline.groups').toggle_pin,
  { desc = 'Toggle [p]in' }
)
vim.keymap.set(
  'n',
  '<leader>bu',
  function() require('bufferline.groups').action('ungrouped', 'close') end,
  { desc = 'Delete [u]npinned' }
)
vim.keymap.set('n', '<leader>bg', bufferline.pick, { desc = '[g]o to buffer' })
vim.keymap.set(
  { 'n', 'v' },
  '<leader>nh',
  '<cmd>:Noice fzf<cr>',
  { desc = 'Show [n]otification [h]istory' }
)
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

vim.keymap.set('n', '<leader>ff', FzfLua.files, { desc = '[F]ind [F]iles' })
vim.keymap.set('n', '<leader><leader>', FzfLua.files, { desc = 'Find Files' })
vim.keymap.set(
  'n',
  '<leader>fg',
  FzfLua.live_grep_native,
  { desc = '[F]ind with [G]rep' }
)
vim.keymap.set(
  'n',
  '<leader>fb',
  FzfLua.buffers,
  { desc = '[F]ind in [B]uffers' }
)
vim.keymap.set(
  'n',
  '<leader>fh',
  FzfLua.helptags,
  { desc = '[F]ind in [H]elp' }
)

vim.keymap.set(
  'n',
  '<leader>fk',
  FzfLua.keymaps,
  { desc = '[f]ind in [k]eymaps' }
)
