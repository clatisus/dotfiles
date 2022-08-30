local M = {}

M.setup = function()
  lvim.builtin.terminal.direction = "horizontal"
  lvim.builtin.terminal.open_mapping = [[<A-t>]]
end

return M
