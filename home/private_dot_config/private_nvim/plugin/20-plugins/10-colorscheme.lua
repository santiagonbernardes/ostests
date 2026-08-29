vim.pack.add({
  { src = 'https://github.com/ray-x/starry.nvim', version = 'master' },
})

require('starry').setup({
  disable = {
    background = true, -- transparent background
  },
})

vim.cmd('colorscheme dracula')
