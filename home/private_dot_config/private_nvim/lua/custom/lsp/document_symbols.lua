--- @type LspConfig
return {
  method = 'textDocument/documentSymbol',
  keymaps = {
    {
      modes = 'n',
      lhs = 'gO',
      rhs = function(_, _) return FzfLua.lsp_document_symbols end,
      opts = function(_, bufnr)
        return { desc = '[g]o to d[O]cument symbols', buf = bufnr }
      end,
    },
  },
}
