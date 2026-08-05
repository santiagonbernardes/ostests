--- @type LspConfig
return {
  method = 'workspace/diagnostic',
  enable = function(client, _)
    vim.lsp.buf.workspace_diagnostics({ client_id = client.id })
  end,
  keymaps = {
    {
      modes = { 'n', 'v' },
      lhs = 'grD',
      rhs = function(_, _) return FzfLua.diagnostics_workspace end,
      opts = function(_, bufnr)
        return { desc = 'go to workspace [D]iagnostic', buf = bufnr }
      end,
    },
  },
}
