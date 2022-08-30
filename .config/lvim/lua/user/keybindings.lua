local M = {}

M.setup = function()
  lvim.keys.normal_mode["<ESC>"] = "<cmd> noh <CR>"
  lvim.keys.normal_mode["<C-c>"] = "<cmd> %y+ <CR>"
  lvim.keys.normal_mode["<A-a>"] = "ggVG"
  lvim.keys.normal_mode["<A-l>"] = "<cmd> BufferLineCycleNext <cr>"
  lvim.keys.normal_mode["<A-h>"] = "<cmd> BufferLineCyclePrev <cr>"

  lvim.keys.term_mode["<A-x>"] = "<C-\\><C-n>"
end

return M
