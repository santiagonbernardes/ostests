---@type LspConfig
return {
  method = 'textDocument/hover',
  keymaps = {
    {
      modes = 'n',
      lhs = 'K',
      rhs = function(_, _)
        return function() vim.lsp.buf.hover() end
      end,
      opts = function(_, bufnr) return { desc = 'Hover', buf = bufnr } end,
    },
  },
}
