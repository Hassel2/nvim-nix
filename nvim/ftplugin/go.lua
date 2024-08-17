if vim.fn.executable('gopls') ~= 1 then
  return
end

local root_files = {
  'go.mod',
  'main.go',
  '.git',
}

vim.lsp.start {
  name = 'go-lang',
  cmd = { 'gopls' },
  root_dir = vim.fs.dirname(vim.fs.find(root_files, { upward = true })[1]),
  autostart = true,
  capabilities = require('user.lsp').make_client_capabilities(),
}
