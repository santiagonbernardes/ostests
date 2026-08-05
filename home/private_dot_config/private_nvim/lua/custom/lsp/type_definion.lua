--- @type LspConfig
return {
  method = 'textDocument/typeDefinition',
  keymaps = {
    {
      modes = 'n',
      lhs = 'grt',
      rhs = function(_, _) return FzfLua.lsp_typedefs end,
      opts = function(_, bufnr)
        return { desc = 'go to [t]ype definitions', buf = bufnr }
      end,
    },
  },
}
