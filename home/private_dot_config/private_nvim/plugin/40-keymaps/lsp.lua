require('which-key').add({
  { mode = { 'n', 'x' }, lhs = 'gr', group = 'LSP Actions', icon = '' },
})

vim.keymap.set(
  'n',
  'grx',
  vim.lsp.codelens.run,
  { desc = 'e[x]ecute codelens' }
)

vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'Hover' })

vim.keymap.set(
  'n',
  'grn',
  vim.lsp.buf.rename,
  { desc = 're[n]ame under the cursor' }
)

vim.keymap.set(
  { 'n', 'v' },
  '<C-]>',
  FzfLua.lsp_definitions,
  { desc = 'definitions' }
)

vim.keymap.set(
  { 'n', 'v' },
  '<gd>',
  FzfLua.lsp_definitions,
  { desc = '[g]o to [d]efinition' }
)

vim.keymap.set('n', 'grr', FzfLua.lsp_references, { desc = '[r]efe[r]ences' })

vim.keymap.set(
  { 'n', 'v' },
  'gra',
  FzfLua.lsp_code_actions,
  { desc = 'code [a]ctions' }
)

vim.keymap.set('n', 'grt', FzfLua.lsp_typedefs, { desc = '[t]ype definitions' })

vim.keymap.set(
  'n',
  'gri',
  FzfLua.lsp_implementations,
  { desc = '[i]mplementations' }
)

vim.keymap.set(
  { 'i', 's' },
  '<C-S>',
  vim.lsp.buf.signature_help,
  { desc = 'Show function signature' }
)

vim.keymap.set(
  'n',
  'gO',
  FzfLua.lsp_document_symbols,
  { desc = '[g]o to d[O]cument symbols' }
)

vim.keymap.set(
  'n',
  'gW',
  FzfLua.lsp_live_workspace_symbols,
  { desc = 'go to [W]orkspace symbols' }
)

vim.keymap.set(
  { 'n', 'v' },
  'grd',
  FzfLua.diagnostics_document,
  { desc = 'go to [d]iagnostic' }
)

vim.keymap.set(
  { 'n', 'v' },
  'grD',
  FzfLua.diagnostics_workspace,
  { desc = 'go to workspace [D]iagnostic' }
)
