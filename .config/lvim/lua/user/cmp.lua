local M = {}

M.setup = function()
  -- Can not be placed into the config method of the plugins.
  table.insert(lvim.builtin.cmp.sources, 1, { name = "copilot" })
  lvim.builtin.cmp.formatting.source_names["copilot"] = "(Copilot)"
end

return M
