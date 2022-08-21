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
  },
}

M.misc = {
  n = {
    ["<leader>do"] = { "<cmd> BufOnly <CR>", "delete all other buffers" },
  },
}

return M
