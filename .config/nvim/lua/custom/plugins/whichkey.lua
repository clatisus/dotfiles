local present, wk = pcall(require, "which-key")

if not present then
  return
end

wk.register({
  ["<leader>f"] = { name = "+Find in Telescope" },
  ["<leader>l"] = { name = "+Lsp" },
  ["<leader>w"] = { name = "+Workspace" },
  ["<leader>d"] = { name = "+Delete" },
  ["<leader>h"] = { name = "+Gitsigns" },
  ["<leader>t"] = { name = "+Toggle" },
  ["<leader>u"] = { name = "+Update" },
})
