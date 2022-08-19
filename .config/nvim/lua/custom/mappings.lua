local M = {}

M.disabled = {
  n = {
    ["<leader>n"] = "", -- toggle line number
    ["<leader>rn"] = "", -- toggle relative number
    ["<leader>tt"] = "", -- toggle theme
    ["<leader>e"] = "", -- focus nvimtree
    ["<leader>th"] = "", -- nvchad themes
    ["<leader>wK"] = "", -- which-key all keymaps
    ["<leader>wk"] = "", -- which-key query lookup

    ["<A-i>"] = "", -- toggle floating term
    ["<A-h>"] = "", -- toggle horizontal term
    ["<A-v>"] = "", -- toggle vertical term
  },
  t = {
    ["<A-i>"] = "", -- toggle floating term
    ["<A-h>"] = "", -- toggle horizontal term
    ["<A-v>"] = "", -- toggle vertical term
  }
}

M.nvterm = {
  t = {
    -- toggle in terminal mode
    ["<leader>ti"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "toggle floating term",
    },

    ["<leader>th"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "toggle horizontal term",
    },

    ["<leader>tv"] = {
      function()
        require("nvterm.terminal").toggle "vertical"
      end,
      "toggle vertical term",
    },
  },

  n = {
    -- toggle in normal mode
    ["<leader>ti"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "toggle floating term",
    },

    ["<leader>th"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "toggle horizontal term",
    },

    ["<leader>tv"] = {
      function()
        require("nvterm.terminal").toggle "vertical"
      end,
      "toggle vertical term",
    },
  }
}

return M
