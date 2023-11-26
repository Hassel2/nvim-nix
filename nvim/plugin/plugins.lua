-- many plugins annoyingly require a call to a 'setup' function to be loaded,
-- even with default configs
require("ibl").setup {
    scope = { enabled = false },
}
require("gruvbox").setup()
vim.cmd("colorscheme gruvbox")
require('Navigator').setup()
require('which-key').setup()
require('fidget').setup()
