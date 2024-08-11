return {
  {
    "stevearc/conform.nvim",
    -- event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "ggandor/leap.nvim",
    lazy = false,
    config = function ()
      vim.keymap.set({"n", "x", "o"}, "s",  "<Plug>(leap)")
      vim.keymap.set({"n", "x", "o"}, "gs", "<Plug>(leap-from-window)")
      require("leap").opts.safe_labels = {}
    end
  },

  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
          -- Configuration here, or leave empty to use defaults
      })
    end
  },

  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
    }
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      on_attach = function (bufnr)
        local api = require "nvim-tree.api"
        api.config.mappings.default_on_attach(bufnr)
        -- disable_terminals
        vim.keymap.set("n", "<leader>th", "", { buffer = bufnr })
        vim.keymap.set("n", "<leader>tv", "", { buffer = bufnr })
        vim.keymap.set({ "n", "t" }, "<A-h>", "", { buffer = bufnr })
        vim.keymap.set({ "n", "t" }, "<A-v>", "", { buffer = bufnr })
      end,
      view = {
        relativenumber = true,
      },
      renderer = {
        root_folder_label = function(path)
          return " " .. vim.fn.fnamemodify(path, ":t")
        end,
      }
    }
  },
}
