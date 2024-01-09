-- vim.api.nvim_create_autocmd({ "bufnewfile", "bufread", "bufwinenter" }, {
--     pattern = { "*/*ansible*/*.yml" },
--     callback = function()
--         vim.opt.filetype = "yaml.ansible"
--         vim.lsp.start {
--             name = 'ansiblels',
--             cmd = { 'ansible-language-server', '--stdio'},
--             autostart = true,
--             capabilities = require('user.lsp').make_client_capabilities(),
--         }
--     end,
-- })

local yamlls_cmd = 'yaml-language-server'

-- Check if yaml-language-server is available
if vim.fn.executable(yamlls_cmd) ~= 1 then
  return
end

vim.lsp.start {
  name = 'yamlls',
  cmd = { yamlls_cmd, "--stdio"},
  root_dir = vim.fn.getcwd(),
  autostart = true,
  capabilities = require('user.lsp').make_client_capabilities(),
}
