vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup(
    'lsp-on-attach-configuration',
    { clear = true }
  ),
  callback = function(event)
    local bufnr = event.data.buf
    local client = vim.lsp.get_client_by_id(event.data.client_id)

    if not client then return end

    if client:supports_method('textDocument/codeLens') then
      vim.lsp.codelens.enable(true, { client_id = client.id, bufnr = bufnr })

      vim.keymap.set(
        { 'n', 'v' },
        '<leader>tx',

        function()
          vim.lsp.codelens.enable(
            not vim.lsp.codelens.is_enabled(),
            { client_id = client.id, bufnr = bufnr }
          )
        end,
        { desc = 'toggle codelens', buf = bufnr }
      )
    end

    if client:supports_method('textDocument/completion') then
      client.server_capabilities.completionProvider.triggerCharacters = vim
        .iter(vim.fn.range(32, 126))
        :map(function(char_byte) return string.char(char_byte) end)
        :totable()

      vim.lsp.completion.enable(true, client.id, bufnr, { autotrigger = true })
    end

    if client:supports_method('textDocument/inlayHint') then
      vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })

      vim.keymap.set(
        { 'n', 'v' },
        '<leader>tih',
        function()
          vim.lsp.inlay_hint.enable(
            not vim.lsp.inlay_hint.is_enabled(),
            { bufnr = bufnr }
          )
        end,
        { desc = '[t]oggle [i]nlay [h]ints', buf = bufnr }
      )
    end

    if client:supports_method('textDocument/documentColor') then
      vim.lsp.document_color.enable(
        true,
        { client_id = client.id, bufnr = bufnr }
      )

      vim.keymap.set(
        { 'n', 'v' },
        '<leader>tdc',
        function()
          vim.lsp.document_color.enable(
            not vim.lsp.document_color.is_enabled(),
            { client_id = client.id, bufnr = bufnr }
          )
        end,
        { desc = '[t]oggle [d]ocument [c]olor', buf = bufnr }
      )
    end

    if client:supports_method('textDocument/semanticTokens') then
      vim.lsp.semantic_tokens.enable(
        true,
        { bufnr = bufnr, client_id = client.id }
      )

      vim.keymap.set(
        'n',
        '<leader>tlk',
        function()
          vim.lsp.semantic_tokens.enable(
            vim.lsp.semantic_tokens.is_enabled(),
            { bufnr = bufnr, client_id = client.id }
          )
        end,
        {
          desc = '[t]oggle semantic to[k]ens',
          buf = bufnr,
        }
      )
    end

    if client:supports_method('textDocument/inlineCompletion') then
      vim.lsp.inline_completion.enable(
        true,
        { bufnr = bufnr, client_id = client.id }
      )

      vim.keymap.set(
        { 'n', 'v' },
        '<leader>tic',
        function()
          vim.lsp.inline_completion.enable(
            not vim.lsp.inline_completion.is_enabled(),
            { bufnr = bufnr, client_id = client.id }
          )
        end,
        { desc = '[t]oggle [i]nline [c]ompletion', buf = bufnr }
      )
    end

    if client:supports_method('textDocument/onTypeFormatting') then
      vim.lsp.on_type_formatting.enable(true, {
        client_id = client.id,
      })
    end

    if client:supports_method('textDocument/linkedEditingRange') then
      vim.lsp.linked_editing_range.enable(true, {
        client_id = client.id,
      })

      vim.keymap.set(
        { 'n', 'v' },
        '<leader>tle',
        function()
          vim.lsp.linked_editing_range.enable(
            not vim.lsp.linked_editing_range.is_enabled(),
            {
              client_id = client.id,
            }
          )
        end,
        { desc = '[t]oggle [l]inked [e]diting range', buf = bufnr }
      )
    end

    if client:supports_method('workspace/diagnostic') then
      vim.lsp.buf.workspace_diagnostics({ client_id = client.id })
    end
  end,
})
