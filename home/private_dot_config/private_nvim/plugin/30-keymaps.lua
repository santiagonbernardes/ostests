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
vim.keymap.set('n', '[b', '<cmd>bprevious<cr>', { desc = 'Prev Buffer' })
vim.keymap.set('n', ']b', '<cmd>bnext<cr>', { desc = 'Next Buffer' })
vim.keymap.set(
  'n',
  '<leader>bb',
  '<cmd>e #<cr>',
  { desc = 'Switch to Other Buffer' }
)
vim.keymap.set(
  'n',
  '<leader>bd',
  '<cmd>bdelete<cr>',
  { desc = 'Delete Buffer' }
)
vim.keymap.set('n', '<leader>bo', function()
  local current_buffer = vim.api.nvim_get_current_buf()
  local every_buffer = vim.api.nvim_list_bufs()
  local buffers_might_be_deleted = vim.tbl_filter(
    function(buffer) return buffer ~= current_buffer end,
    every_buffer
  )

  if vim.fn.empty(buffers_might_be_deleted) == 1 then return end

  -- User Options
  -- local yes = 1
  local no = 2
  local cancel = 3
  local control_c_or_esc = 0
  local ignore = {}

  for _, buffer_might_be_deleted in ipairs(buffers_might_be_deleted) do
    if vim.bo[buffer_might_be_deleted].modified then
      vim.cmd(':b ' .. buffer_might_be_deleted)

      local ok, choice = pcall(
        vim.fn.confirm,
        ('Save changes to %q?'):format(vim.fn.bufname(buffer_might_be_deleted)),
        '&Yes\n&No\n&Cancel'
      )

      if not ok or choice == control_c_or_esc or choice == cancel then
        vim.cmd(':b ' .. current_buffer)
        return
      elseif choice == no then
        table.insert(ignore, buffer_might_be_deleted)
      else
        vim.api.nvim_buf_call(buffer_might_be_deleted, vim.cmd.write)
      end

      vim.cmd(':b ' .. current_buffer)
    end
  end

  local buffers_to_delete = buffers_might_be_deleted
  if not vim.tbl_isempty(ignore) then
    buffers_to_delete = vim.tbl_filter(
      function(buffer_might_be_deleted)
        return not vim.tbl_contains(ignore, buffer_might_be_deleted)
      end,
      buffers_might_be_deleted
    )
  end

  vim.cmd('bdelete ' .. table.concat(buffers_to_delete, ' '))
end, { desc = 'Delete Other Buffers' })
vim.keymap.set(
  'n',
  '<leader>bD',
  '<cmd>:bd<cr>',
  { desc = 'Delete Buffer and Window' }
)

-- vim.keymap.set(
--   { 'n', 'v' },
--   '<leader>nh',
--   function() MiniNotify.show_history() end,
--   { desc = 'Show [n]otification [h]istory' }
-- )
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

-- vim.keymap.set(
--   'n',
--   '<leader>ff',
--   MiniPick.builtin.files,
--   { desc = '[F]ind [F]iles' }
-- )
-- vim.keymap.set(
--   'n',
--   '<leader>fg',
--   MiniPick.builtin.grep_live,
--   { desc = '[F]ind with [G]rep' }
-- )
-- vim.keymap.set(
--   'n',
--   '<leader>fb',
--   MiniPick.builtin.buffers,
--   { desc = '[F]ind in [B]uffers' }
-- )
-- vim.keymap.set(
--   'n',
--   '<leader>fh',
--   function() return MiniPick.builtin.help({ default_split = 'vertical' }) end,
--   { desc = '[F]ind in [H]elp' }
-- )
--
-- vim.keymap.set(
--   'n',
--   '<leader>fk',
--   MiniExtra.pickers.keymaps,
--   { desc = '[f]ind in [k]eymaps' }
-- )
