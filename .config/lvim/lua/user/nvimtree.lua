local M = {}

M.setup = function()
  lvim.builtin.nvimtree.setup.view.side = "left"
  lvim.builtin.nvimtree.setup.renderer.icons.show.git = true
  lvim.builtin.nvimtree.setup.filesystem_watchers = { enable = true }
end

return M
