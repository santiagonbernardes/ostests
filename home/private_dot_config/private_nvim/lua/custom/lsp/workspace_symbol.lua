--- @type LspConfig
return {
  method = 'workspace/symbol',
  keymaps = {
    {
      modes = 'n',
      lhs = 'gW',
      rhs = function(_, _) return FzfLua.lsp_live_workspace_symbols end,
      opts = function(_, bufnr)
        return { desc = 'go to [W]orkspace symbols', buf = bufnr }
      end,
    },
  },
}
