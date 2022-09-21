local M = {}

M.setup = function()
  lvim.builtin.telescope.defaults.file_ignore_patterns = { ".git/", "node_modules/" }
  lvim.builtin.telescope.defaults.path_display = { shorten = { len = 8, exclude = { -1 } } }
end

return M
