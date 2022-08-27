-- general
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "tokyonight"

vim.g.tokyonight_style = "night"
vim.opt.wrap = true

------------------------------------------- Keymappings ------------------------------------------------
lvim.leader = "space"
lvim.keys.normal_mode["<Leader>bo"] = ':%bd!|e #|bd #|normal`"<CR>'
lvim.keys.normal_mode["<ESC>"] = "<cmd> noh <CR>"
lvim.keys.normal_mode["<C-c>"] = "<cmd> %y+ <CR>"
lvim.keys.term_mode["<A-x>"] = "<C-\\><C-n>"
lvim.builtin.which_key.mappings["h"] = nil
lvim.builtin.which_key.mappings["w"] = nil
lvim.builtin.which_key.mappings["q"][2] = " Quit"
lvim.builtin.which_key.mappings[";"][2] = " Dashboard"
lvim.builtin.which_key.mappings["c"][2] = " Close Buffer"
lvim.builtin.which_key.mappings["/"][2] = " Comment"
lvim.builtin.which_key.mappings["b"].name = "﬘ Buffers"
lvim.builtin.which_key.mappings["g"].name = " Git"
lvim.builtin.which_key.mappings["L"].name = " LunarVim"
lvim.builtin.which_key.mappings["s"].name = " Search"
lvim.builtin.which_key.mappings["?"] = { "<cmd>Cheat<CR>", " Cheat.sh" }
lvim.builtin.which_key.mappings["t"] = {
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

--------------------------------------------- Builtin --------------------------------------------------
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
require("user.alpha").config()
require("user.telescope").config()

local components = require("lvim.core.lualine.components")
lvim.builtin.lualine.sections.lualine_a = { "mode" }
lvim.builtin.lualine.sections.lualine_y = {
  components.location
}

lvim.builtin.notify.active = true

lvim.builtin.terminal.active = true
lvim.builtin.terminal.direction = "horizontal"
lvim.builtin.terminal.open_mapping = [[<A-t>]]

lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true
lvim.builtin.nvimtree.setup.filesystem_watchers = { enable = true }

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    command = "rustfmt",
    args = { "--config", "tab_spaces=2" },
  },
}

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
  "yaml",
}
lvim.builtin.treesitter.highlight.enabled = true

-- Copilot
-- Can not be placed into the config method of the plugins.
lvim.builtin.cmp.formatting.source_names["copilot"] = "(Copilot)"
table.insert(lvim.builtin.cmp.sources, 1, { name = "copilot" })
----------------------------------------------- LSP ----------------------------------------------------
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
}

-- ---@usage disable automatic installation of servers
lvim.lsp.automatic_servers_installation = false

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


--------------------------------------------- Plugins --------------------------------------------------
-- Additional Plugins
lvim.plugins = {
  {
    "RishabhRD/nvim-cheat.sh",
    requires = "RishabhRD/popfix",
    config = function()
      vim.g.cheat_default_window_layout = "float"
    end,
    opt = true,
    cmd = { "Cheat", "CheatWithoutComments", "CheatList", "CheatListWithoutComments" },
  },
  {
    "folke/trouble.nvim",
    config = function()
      require("trouble").setup {
        auto_open = false,
        auto_close = true,
        padding = false,
        height = 10,
        use_diagnostic_signs = true,
      }
    end,
    cmd = "Trouble",
  },
  {
    "ray-x/lsp_signature.nvim",
    config = function()
      require("user/lsp_signature").config()
    end,
    event = { "BufRead", "BufNew" },
  },
  { "lukas-reineke/indent-blankline.nvim" },
  { "zbirenbaum/copilot.lua",
    event = { "VimEnter" },
    config = function()
      vim.defer_fn(function()
        require("copilot").setup {
          plugin_manager_path = get_runtime_dir() .. "/site/pack/packer",
        }
      end, 100)
    end,
  },
  { "zbirenbaum/copilot-cmp",
    after = { "copilot.lua", "nvim-cmp" },
  },
  { "folke/tokyonight.nvim" },
  { "tpope/vim-surround" },
  { "p00f/cphelper.nvim",
    config = function()
      vim.g.cphdir = (vim.loop.os_homedir() .. "/repos/coding-competition")
      vim.g.cpp_compile_command = "clang -Wall -std=c++17 solution.cpp -o cpp.out -g"
    end,
  },
  {
    "ggandor/leap.nvim",
    config = function()
      require('leap').set_default_keymaps()
    end,
  },
  {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup({
        keywords = {
          FIX = {
            icon = " ", -- icon used for the sign, and in search results
            color = "error", -- can be a hex color, or a named color (see below)
            alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
            -- signs = false, -- configure signs for some keywords individually
          },
          TODO = { icon = " ", color = "info" },
          HACK = { icon = " ", color = "warning" },
          WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
          PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
          NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
        },
      })
    end,
    event = "BufRead",
  },
  {
    "andymass/vim-matchup",
    event = "BufReadPost",
    config = function()
      vim.g.matchup_enabled = 1
      vim.g.matchup_surround_enabled = 1
      vim.g.matchup_matchparen_deferred = 1
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
  },
  -- <C-u>, <C-d>, <C-b>, <C-f>, <C-y>, <C-e>, zt, zz, zb.
  {
    "karb94/neoscroll.nvim",
    config = function()
      require("neoscroll").setup {
        easing_function = "quadratic",
      }
    end,
    event = "BufRead",
  },
  {
    "AckslD/nvim-neoclip.lua",
    config = function()
      require("user.neoclip").config()
    end,
    requires = { "tami5/sqlite.lua", module = "sqlite" },
  },
  {
    "abecodes/tabout.nvim",
    wants = { "nvim-treesitter" },
    after = { "nvim-cmp" },
    config = function()
      require("user.tabout").config()
    end,
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    config = function()
      require("telescope").load_extension "file_browser"
    end
  },
  {
    "j-hui/fidget.nvim",
    config = function()
      require("user.fidget_spinner").config()
    end,
  },
  {
    "hrsh7th/cmp-cmdline",
    config = function()
      local cmp = require("cmp")
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'cmdline' }
        }, {
          { name = "path" }
        })
      })
      require("cmp").setup.cmdline('/', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "buffer" }
        })
      })
    end,
  }
}
