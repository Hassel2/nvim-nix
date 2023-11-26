local jdtls_cmd = 'jdt-language-server'

-- Check if jdt-language-server is available
if vim.fn.executable(jdtls_cmd) ~= 1 then
  return
end

vim.lsp.start {
  name = 'jdtls',
  cmd = { jdtls_cmd, "-data", "./.jdtls" },
  root_dir = function()
    return vim.fs.dirname(vim.fs.find({ "gradlew" }, { upward = true })[1]);
  end,
  autostart = true,
  capabilities = require('user.lsp').make_client_capabilities(),
}
