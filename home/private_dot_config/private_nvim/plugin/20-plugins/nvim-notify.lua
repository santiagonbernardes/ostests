vim.pack.add({
  {
    src = 'https://github.com/rcarriga/nvim-notify',
    version = vim.version.range('3'),
  },
})
local notify = require('notify')
notify.setup({
  background_colour = '#000000',
})
vim.notify = notify
