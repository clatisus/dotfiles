-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {
  base46 = {
    theme = "vscode_dark",
    theme_toggle = { "vscode_dark", "one_light" },
  },
  ui = {
    nvdash = {
      load_on_startup = true,
    },
  },
}

return M
