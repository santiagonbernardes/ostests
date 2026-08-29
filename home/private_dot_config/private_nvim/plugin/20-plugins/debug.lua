vim.pack.add({
  {
    src = 'https://github.com/mfussenegger/nvim-dap',
    version = 'master',
  },
  {
    src = 'https://github.com/nvim-neotest/nvim-nio',
    version = 'master',
  },
  {
    {
      src = 'https://github.com/rcarriga/nvim-dap-ui',
      version = 'master',
    },
    src = 'https://codeberg.org/mfussenegger/nvim-dap-python',
    version = 'master',
  },
})

local dapui = require('dapui')
local dap = require('dap')
require('dap-python').setup('debugpy-adapter')
dapui.setup()

dap.listeners.before.attach.dapui_config = function() dapui.open() end
dap.listeners.before.launch.dapui_config = function() dapui.open() end
dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
dap.listeners.before.event_exited.dapui_config = function() dapui.close() end
