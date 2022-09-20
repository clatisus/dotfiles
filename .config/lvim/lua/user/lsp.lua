local M = {}

M.setup = function()
  -- -- make sure server will always be installed even if the server is in skipped_servers list
  lvim.lsp.installer.setup.ensure_installed = {
    "sumeko_lua",
    "clangd",
    "hls",
    "jsonls",
    "tsserver",
    "pyright",
    "taplo",
    "rust_analyzer",
    "yamlls",
  }

  -- ---@usage disable automatic installation of servers
  lvim.lsp.installer.setup.automatic_installation = false

  -- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
  -- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
  -- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
  -- local opts = {} -- check the lspconfig documentation for a list of all possible options
  -- require("lvim.lsp.manager").setup("pyright", opts)

  -- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
  -- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
  -- vim.tbl_map(function(server)
  --   return server ~= "emmet_ls"
  -- end, lvim.lsp.automatic_configuration.skipped_servers)

  -- -- you can set a custom on_attach function that will be used for all the language servers
  -- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
  -- lvim.lsp.on_attach_callback = function(client, bufnr)
  --   local function buf_set_option(...)
  --     vim.api.nvim_buf_set_option(bufnr, ...)
  --   end
  --   --Enable completion triggered by <c-x><c-o>
  --   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
  -- end
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.offsetEncoding = { "utf-16" }
  require('lspconfig').clangd.setup({ capabilities = capabilities })
end

return M
