vim.pack.add({
  {
    src = 'https://github.com/stevearc/conform.nvim',
    version = 'master',
  },
  require('custom.specs').mason_nvim,
})

---@type conform.setupOpts
require('conform').setup({
  formatters_by_ft = {
    lua = { 'stylua' },
    python = { 'ruff' },
    rust = { 'rustfmt' },
    ruby = { 'rubocop' },
    html = { 'prettier' },
    javascript = { 'prettier' },
    json = { 'prettier' },
    markdown = { 'prettier' },
  },
  lsp_format = 'fallback',
  default_format_opts = {
    lsp_format = 'fallback',
  },
  format_on_save = {
    lsp_format = 'fallback',
    timeout_ms = 500,
  },
})
