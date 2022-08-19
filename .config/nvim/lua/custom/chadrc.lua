local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here
M.plugins = {
  user = require "custom.plugins",
}

M.ui = {
  theme = "chadracula",
}

M.mappings = require "custom.mappings"

return M
