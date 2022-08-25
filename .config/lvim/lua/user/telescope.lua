local M = {}

M.config = function()
  lvim.builtin.telescope.defaults.file_ignore_patterns = { ".git", "node_modules" }
end

return M
