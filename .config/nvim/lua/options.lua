require "nvchad.options"

local neovide_config = {
  neovide_remember_window_size = true,
  neovide_hide_mouse_when_typing = true,
  neovide_confirm_quit = true,
  neovide_input_macos_option_key_is_meta = 'only_left'
}

if vim.g.neovide then
  for k, v in pairs(neovide_config) do
    vim.g[k] = v
  end
end

-- setup default path
local default_path = vim.fn.expand("~/")
if vim.fn.getcwd() == '/' then
  vim.api.nvim_set_current_dir(default_path)
end
