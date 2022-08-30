local M = {}

M.setup = function()
  local formatters = require "lvim.lsp.null-ls.formatters"
  formatters.setup {
    {
      command = "rustfmt",
      args = { "--config", "tab_spaces=2" },
    },
  }
end

return M
