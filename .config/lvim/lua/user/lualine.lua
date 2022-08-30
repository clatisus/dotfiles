local M = {}

M.setup = function()
  local components = require("lvim.core.lualine.components")
  lvim.builtin.lualine.sections.lualine_a = { "mode" }
  lvim.builtin.lualine.sections.lualine_y = {
    components.location
  }
end

return M
