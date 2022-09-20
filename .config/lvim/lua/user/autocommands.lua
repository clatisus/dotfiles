local M = {}

local create_aucmd = vim.api.nvim_create_autocmd

M.setup = function()
  vim.api.nvim_create_augroup("_lvim_user", {})
  create_aucmd("FileType", {
    group = "_lvim_user",
    pattern = "rust",
    callback = function()
      vim.keymap.set("n", "<leader>lm", "<Cmd>RustExpandMacro<CR>", {})
      vim.keymap.set("n", "<leader>lc", "<Cmd>RustOpenCargo<CR>", {})
    end,
  })
end

return M
