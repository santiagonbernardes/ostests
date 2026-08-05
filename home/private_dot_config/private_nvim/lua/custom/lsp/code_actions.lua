---@type LspConfig
return {
  method = 'textDocument/codeAction',
  keymaps = {
    {
      modes = { 'n', 'v' },
      lhs = 'gra',
      rhs = function(_, _) return FzfLua.lsp_code_actions end,
      opts = function(_, bufnr)
        return { desc = 'show code [a]ctions', buf = bufnr }
      end,
    },
  },
}
