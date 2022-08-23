local M = {}

M.disabled = {
  n = {
    ["<leader>n"] = "", -- toggle line number
    ["<leader>rn"] = "", -- toggle relative number
    ["<leader>tt"] = "", -- toggle theme
    ["<leader>e"] = "", -- focus nvimtree
    ["<leader>wK"] = "", -- which-key all keymaps
    ["<leader>wk"] = "", -- which-key query lookup
    ["<leader>h"] = "", -- new terminal
    ["<leader>v"] = "", -- ner terminal

    -- telescope
    ["<leader>tk"] = "",
    ["<leader>th"] = "",
    ["<leader>cm"] = "",
    ["<leader>gt"] = "",
    ["<leader>pt"] = "",

    -- lsp
    ["<leader>f"] = "",
    ["<leader>fm"] = "",
    ["<leader>ra"] = "",
    ["<leader>ca"] = "",
    ["<leader>q"] = "",
  },
}

M.misc = {
  n = {
    ["<leader>do"] = { "<cmd> BufOnly <CR>", "delete all other buffers" },
  },
}

M.telescope = {
  n = {
    ["<leader>fk"] = { "<cmd> Telescope keymaps <CR>", "show keys" },
    ["<leader>ft"] = { "<cmd> Telescope terms <CR>", "pick hidden term" },
    ["<leader>fm"] = { "<cmd> Telescope marks <CR>", "book marks" },
    ["<leader>fc"] = { "<cmd> Telescope git_commits <CR>", "git commits" },
    ["<leader>fs"] = { "<cmd> Telescope git_status <CR>", "git status" },
  },
}

M.lsp = {
  n = {
    ["<leader>ld"] = {
      function()
        vim.diagnostic.open_float()
      end,
      "floating diagnostic",
    },
    ["<leader>lf"] = {
      function()
        vim.lsp.buf.formatting({})
      end,
      "lsp formatting",
    },
    ["<leader>lr"] = {
      function()
        require("nvchad_ui.renamer").open()
      end,
      "lsp rename",
    },
    ["<leader>lc"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      "lsp code_action",
    },
    ["<leader>lq"] = {
      function()
        vim.diagnostic.setloclist()
      end,
      "diagnostic setloclist",
    },
  },
}

return M
