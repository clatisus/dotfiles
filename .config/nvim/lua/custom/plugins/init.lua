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
    config = function()
      vim.g.copilot_no_tab_map = true
      vim.g.copilot_assume_mapped = true
      vim.g.copilot_tab_fallback = ""
    end,
  },

  ["vim-scripts/BufOnly.vim"] = {},

  ["p00f/cphelper.nvim"] = {
    config = function()
      vim.g.cphdir = (vim.loop.os_homedir() .. "/repos/coding-competition")
      vim.g.cpp_compile_command = "g++ -Wall -std=c++17 solution.cpp -o cpp.out"
    end,
  },
}
