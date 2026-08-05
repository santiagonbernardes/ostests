local specs = require('custom.specs')
vim.pack.add({
  specs.nvim_web_devicons,
  specs.mini_icons,
  {
    src = 'https://github.com/ibhagwan/fzf-lua',
    version = 'main',
  },
})
local fzf_lua = require('fzf-lua')
local fzf_defaults = require('fzf-lua.defaults')
local fzf_actions = require('fzf-lua.actions')

fzf_lua.setup({
  color_icons = true,
  file_icons = true,
  git_icons = true,
  header = true,
  helptags = {
    actions = vim.tbl_extend(
      'force',
      fzf_defaults.defaults.helptags.actions,
      { ['enter'] = fzf_actions.help_vert }
    ),
  },
})

fzf_lua.register_ui_select()
