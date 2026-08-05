local notify_helper = require('custom.helpers.notify')
local lsp = require('custom.lsp')

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight copied text',
  group = vim.api.nvim_create_augroup(
    'custom-highlight-yank',
    { clear = true }
  ),
  callback = function() vim.hl.on_yank() end,
})

for _, config in ipairs(lsp.get_lsp_configs()) do
  local method = config.method
  vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup(
      ('lsp-on-attach-%s'):format(method),
      { clear = true }
    ),
    callback = function(event)
      local bufnr = event.data.buf
      local client = vim.lsp.get_client_by_id(event.data.client_id)

      if not client then
        notify_helper.schedule_notify(
          ("Client probably not initiated. Can't configure LSP: [%s]"):format(
            method
          ),
          vim.log.levels.WARN
        )

        return
      end

      if not client:supports_method(method, bufnr) then
        notify_helper.schedule_notify(
          ('[%s] No support for: [%s]'):format(client.name, method),
          vim.log.levels.DEBUG
        )
        return
      end

      notify_helper.schedule_notify(
        ('[%s] Starting configuration of %s'):format(client.name, method),
        vim.log.levels.DEBUG
      )

      if not client:supports_method(method, bufnr) then
        notify_helper.schedule_notify(
          ('[%s] No support for: [%s]'):format(client.name, method),
          vim.log.levels.DEBUG
        )
        return
      end

      notify_helper.schedule_notify(
        ('[%s] Starting configuration of %s'):format(client.name, method),
        vim.log.levels.DEBUG
      )

      if config.enable then config.enable(client, bufnr) end

      for _, keymap in ipairs(config.keymaps) do
        vim.keymap.set(
          keymap.modes,
          keymap.lhs,
          keymap.rhs(client, bufnr),
          keymap.opts(client, bufnr)
        )
      end

      notify_helper.schedule_notify(
        ('[%s] Finished configuration of %s'):format(client.name, method),
        vim.log.levels.DEBUG
      )

      notify_helper.schedule_notify(
        ('[%s] Finished configuration of %s'):format(client.name, method),
        vim.log.levels.DEBUG
      )
    end,
  })
end
