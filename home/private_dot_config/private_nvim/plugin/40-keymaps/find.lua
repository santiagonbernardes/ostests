require('which-key').add({
  { mode = { 'n', 'x' }, lhs = '<leader>f', group = '[f]ind', icon = '' },
})

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
