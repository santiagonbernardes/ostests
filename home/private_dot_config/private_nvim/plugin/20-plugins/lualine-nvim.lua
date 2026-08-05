vim.pack.add({
  {
    src = 'https://github.com/nvim-lualine/lualine.nvim',
    version = 'master',
  },
  require('custom.specs').nvim_web_devicons,
})

require('lualine').setup({
  options = {
    theme = 'dracula',
  },
})
