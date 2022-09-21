local M = {}

M.setup = function()
  lvim.builtin.telescope.defaults.file_ignore_patterns = { ".git/", "node_modules/" }
  lvim.builtin.telescope.defaults.path_display = { shorten = 10 }
end

return M
