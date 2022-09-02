local M = {}

M.setup = function()
  -- if you don't want all the parsers change this to a table of the ones you want
  lvim.builtin.treesitter.ensure_installed = {
    "bash",
    "c",
    "cpp",
    "haskell",
    "javascript",
    "json",
    "lua",
    "python",
    "typescript",
    "tsx",
    "css",
    "rust",
    "java",
    "kotlin",
    "yaml",
  }
  lvim.builtin.treesitter.highlight.enabled = true

end

return M
