local M = {}

M.setup = function()
  lvim.leader = "space"

  lvim.builtin.which_key.mappings["h"] = nil
  lvim.builtin.which_key.mappings["w"] = nil
  lvim.builtin.which_key.mappings["q"][2] = " Quit"
  lvim.builtin.which_key.mappings[";"][2] = " Dashboard"
  lvim.builtin.which_key.mappings["c"][2] = " Close Buffer"
  lvim.builtin.which_key.mappings["/"][2] = " Comment"

  lvim.builtin.which_key.mappings["b"].name = "﬘ Buffers"
  lvim.builtin.which_key.mappings["b"]["o"] = {
    "<cmd>BufferLineCloseLeft<cr><cmd>BufferLineCloseRight<cr>",
    "Close others"
  }

  lvim.builtin.which_key.mappings["g"].name = " Git"
  lvim.builtin.which_key.mappings["L"].name = " LunarVim"
  lvim.builtin.which_key.mappings["s"].name = " Search"
  lvim.builtin.which_key.mappings["?"] = { "<cmd>Cheat<CR>", " Cheat.sh" }

  lvim.builtin.which_key.mappings["t"] = {
    name = " Tabs",
    c = { "<cmd>tabclose<cr>", "Close tab" },
    z = { "<cmd>tab split<cr>", "Zoom current window to tab" },
    ["1"] = { "1gt", "Switch to tab 1" },
    ["2"] = { "2gt", "Switch to tab 2" },
    ["3"] = { "3gt", "Switch to tab 3" },
    ["4"] = { "4gt", "Switch to tab 4" },
    ["5"] = { "5gt", "Switch to tab 5" },
  }

  lvim.builtin.which_key.mappings["T"] = {
    name = " Trouble",
    d = { "<cmd>Trouble document_diagnostics<cr>", "Document Diagnosticss" },
    f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
    l = { "<cmd>Trouble loclist<cr>", "LocationList" },
    q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
    r = { "<cmd>Trouble lsp_references<cr>", "References" },
    t = { "<cmd>TodoLocList <cr>", "Todo" },
    w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnosticss" },
  }

  lvim.builtin.which_key.mappings["sF"] = {
    "<cmd>Telescope file_browser<cr>", "File Browser"
  }
end

return M
