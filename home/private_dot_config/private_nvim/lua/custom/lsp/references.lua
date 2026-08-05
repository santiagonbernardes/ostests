--- @type LspConfig
return {
  method = 'textDocument/references',
  keymaps = {
    {
      modes = 'n',
      lhs = 'grr',
      rhs = function(_, _) return FzfLua.lsp_references end,
      opts = function(_, bufnr)
        return { desc = 'go to [r]references', buf = bufnr }
      end,
    },
  },
}
