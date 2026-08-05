--- @type LspConfig
return {
  method = 'textDocument/signatureHelp',
  keymaps = {
    {
      modes = { 'i', 's' },
      lhs = '<C-S>',
      rhs = function(_, _)
        return function() vim.lsp.buf.signature_help() end
      end,
      opts = function(_, bufnr)
        return { desc = 'Show function signature', buf = bufnr }
      end,
    },
  },
}
