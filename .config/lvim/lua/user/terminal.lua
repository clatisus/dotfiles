local M = {}

M.setup = function()
  lvim.builtin.terminal.direction = "horizontal"
  lvim.builtin.terminal.open_mapping = [[<A-z>]]
end

return M
