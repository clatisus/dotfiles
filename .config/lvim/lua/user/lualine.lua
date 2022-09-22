local M = {}

M.setup = function()
  lvim.builtin.lualine.sections.lualine_a = { "mode" }
end

return M
