return {

  ["folke/which-key.nvim"] = {
    disable = false,
  },

  ["neovim/nvim-lspconfig"] = {
    config = function()
      require("plugins.configs.lspconfig")
      require("custom.plugins.lspconfig")
    end,
  },

  -- format & linting
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require("custom.plugins.null-ls")
    end,
  },

  ["Pocco81/auto-save.nvim"] = {
    config = function()
      require("custom.plugins.auto-save")
    end,
  },

  ["github/copilot.vim"] = {
    branch = "release",
  },

  ["vim-scripts/BufOnly.vim"] = {},

  ["p00f/cphelper.nvim"] = {},
}
