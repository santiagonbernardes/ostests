local bufferline = require('bufferline')
require('which-key').add({
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
