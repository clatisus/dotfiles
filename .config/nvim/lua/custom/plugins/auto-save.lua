local present, autosave = pcall(require, "auto-save")

if present then
  autosave.setup({
    condition = function(buf)
      local fn = vim.fn
      local utils = require("auto-save.utils.data")

      if
        fn.getbufvar(buf, "&modifiable") == 1
        and utils.not_in(fn.getbufvar(buf, "&filetype"), {})
        and fn.bufname(buf) ~= "" -- exclude [No Name]
      then
        return true -- met condition(s), can save
      end
      return false -- can't save
    end,
  })
end
