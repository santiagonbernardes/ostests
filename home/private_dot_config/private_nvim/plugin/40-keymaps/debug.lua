local dap = require('dap')
vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint)
vim.keymap.set('n', '<leader>dg', dap.run_to_cursor)
