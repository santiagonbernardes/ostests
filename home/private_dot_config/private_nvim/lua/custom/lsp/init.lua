---@class Keymap
---@field modes string|string[]
---@field lhs string
---@field rhs fun(client: vim.lsp.Client, bufnr?: integer): string|function
---@field opts fun(client: vim.lsp.Client, bufnr?: integer): vim.keymap.set.Opts

--- @class LspConfig
--- @field keymaps Keymap[]
--- @field method vim.lsp.protocol.Method.ClientToServer | vim.lsp.protocol.Method.Registration
--- @field enable? fun(client: vim.lsp.Client, bufnr?: integer)

---@return LspConfig[]
local function load_modules()
  local modules_dir =
    vim.fs.joinpath(vim.fn.stdpath('config'), 'lua', 'custom', 'lsp')

  local modules = vim
    .iter(vim.fs.dir(modules_dir, { follow = true }))
    :filter(
      function(file_name, type)
        return (type == 'file' or type == 'link')
          and file_name:match('%.lua$')
          and file_name ~= 'init.lua'
      end
    )
    :map(function(file_name, _)
      local module_name = file_name:gsub('%.lua$', '')
      local module = require('custom.lsp.' .. module_name)
      if vim.isarray(module) then return module end
      return { module }
    end)
    :totable()

  return vim.iter(modules):flatten():totable()
end

local M = {}
---@return LspConfig[]
M.get_lsp_configs = function() return load_modules() end

M.disable_lsp_keymaps = function()
  vim
    .iter(load_modules())
    :map(function(module) return module.keymaps end)
    :each(function(keymaps)
      for _, keymap in ipairs(keymaps) do
        local lhs = keymap.lhs
        local modes = keymap.modes
        if not vim.isarray(modes) then modes = { modes } end

        for _, mode in ipairs(modes) do
          if vim.fn.maparg(lhs, mode) ~= '' then
            require('custom.helpers.notify').schedule_notify(
              ('Disabling LSP keymap: %s + %s'):format(mode, lhs),
              vim.log.levels.DEBUG
            )
            vim.keymap.del(mode, lhs)
          end
        end
      end
    end)
end
return M
