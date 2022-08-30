local M = {}

M.setup = function()
  lvim.keys.normal_mode["<ESC>"] = "<cmd> noh <CR>"
  lvim.keys.normal_mode["<C-c>"] = "<cmd> %y+ <CR>"
  lvim.keys.normal_mode["<A-a>"] = "ggVG"

  lvim.keys.term_mode["jj"] = "<C-\\><C-n>"
end

return M
