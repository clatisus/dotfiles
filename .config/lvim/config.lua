-- general
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "tokyonight"

vim.g.tokyonight_style = "night"
vim.opt.wrap = true
vim.opt.foldmethod = "indent"
vim.opt.foldlevel = 99

lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.alpha.active = true
------------------------------------------- Keymappings ------------------------------------------------
require("user.keybindings").setup()
require("user.which_key").setup()

--------------------------------------------- Builtin --------------------------------------------------
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
require("user.alpha").setup()
require("user.telescope").setup()
require("user.bufferline").setup()
require("user.lualine").setup()
require("user.terminal").setup()
require("user.nvimtree").setup()
require("user.treesitter").setup()
require("user.cmp").setup()

----------------------------------------------- LSP ----------------------------------------------------
require("user.lsp").setup()
require("user.formatters").setup()

--------------------------------------------- Plugins --------------------------------------------------
require("user.plugins").setup()
