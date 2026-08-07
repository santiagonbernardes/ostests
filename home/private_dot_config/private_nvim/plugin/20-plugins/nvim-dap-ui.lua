local specs = require('custom.specs')

vim.pack.add({
  specs.nvim_dap,
  specs.nvim_nio,
  {
    src = 'https://github.com/rcarriga/nvim-dap-ui',
    version = 'master',
  },
})

local dapui = require('dapui')
local dap = require('dap')

dapui.setup()
dap.listeners.before.attach.dapui_config = function() dapui.open() end
dap.listeners.before.launch.dapui_config = function() dapui.open() end
dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
dap.listeners.before.event_exited.dapui_config = function() dapui.close() end
