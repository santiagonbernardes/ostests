vim.pack.add({
  require('custom.specs').nvim_dap,
  {
    src = 'https://codeberg.org/mfussenegger/nvim-dap-python',
    version = 'master',
  },
})

local dap = require('dap')
require('dap-python').setup('debugpy-adapter')

vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint)
vim.keymap.set('n', '<leader>dg', dap.run_to_cursor)
