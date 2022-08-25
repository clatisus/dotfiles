local M = {}

M.merge_tb = function(old, new)
  return vim.tbl_deep_extend("force", old, new)
end

return M
