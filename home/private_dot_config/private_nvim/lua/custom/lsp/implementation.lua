--- @type LspConfig
return {
  method = 'textDocument/implementation',
  keymaps = {
    {
      modes = 'n',
      lhs = 'gri',
      rhs = function(_, _) return FzfLua.lsp_implementations end,
      opts = function(_, bufnr)
        return { desc = 'go to [i]mplementation', buf = bufnr }
      end,
    },
  },
}
