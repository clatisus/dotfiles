local M = {}

M.setup = function()
  lvim.keys.normal_mode["<ESC>"] = "<cmd> noh <CR>"
  lvim.keys.normal_mode["<C-c>"] = "<cmd> %y+ <CR>"
  lvim.keys.normal_mode["<A-a>"] = "ggVG"
  -- Tab switch buffer
  lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
  lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"

  lvim.keys.term_mode["<A-x>"] = "<C-\\><C-n>"
end

return M
