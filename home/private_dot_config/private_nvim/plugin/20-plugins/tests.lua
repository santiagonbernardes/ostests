local specs = require('custom.specs')

vim.pack.add({
  {
    src = 'https://github.com/nvim-neotest/nvim-nio',
    version = 'master',
  },
  {
    src = 'https://github.com/antoinemadec/FixCursorHold.nvim',
    version = 'master',
  },
  {
    src = 'https://github.com/nvim-neotest/neotest',
    version = vim.version.range('5'),
  },
  {
    src = 'https://github.com/nvim-neotest/neotest-python',
    version = 'master',
  },
  {
    src = 'https://github.com/mrcjkb/rustaceanvim',
    -- To avoid being surprised by breaking changes,
    -- I recommend you set a version range
    version = vim.version.range('^9'),
  },
})

require('neotest').setup({
  adapters = {
    require('neotest-python'),
    require('rustaceanvim.neotest'),
  },
})
