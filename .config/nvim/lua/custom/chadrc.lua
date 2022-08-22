local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here
local override = require("custom.override")
M.plugins = {
  override = {
    ["nvim-treesitter/nvim-treesitter"] = override.treesitter,
    ["kyazdani42/nvim-tree.lua"] = override.nvimtree,
    ["nvim-telescope/telescope.nvim"] = override.telescope,
    ["williamboman/mason.nvim"] = override.mason,
    ["lewis6991/gitsigns.nvim"] = override.gitsigns,
    ["hrsh7th/nvim-cmp"] = override.cmp,
    ["NvChad/ui"] = override.ui,
  },

  user = require("custom.plugins"),
}

M.ui = {
  theme = "tokyodark",
}

M.mappings = require("custom.mappings")

return M
