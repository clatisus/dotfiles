-- overriding default plugin configs!

local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "rust",
    "json",
    "toml",
    "markdown",
    "c",
    "cpp",
    "bash",
    "lua",
    "java",
    "javascript",
    "haskell",
    "python",
    "scala",
    "sql",
  },
}

M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

M.telescope = {
  defaults = {
    prompt_prefix = "   ",
  },
}

M.mason = {
  ensure_installed = {
    -- lua
    "lua-language-server",
    "stylua",

    -- haskell
    "haskell-language-server",

    -- c & cpp
    "clangd",
    "clang-format",
  }, -- not an option from mason.nvim
}

M.gitsigns = {
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map("n", "]c", function()
      if vim.wo.diff then
        return "]c"
      end
      vim.schedule(function()
        gs.next_hunk()
      end)
      return "<Ignore>"
    end, { expr = true, desc = "next hunk" })

    map("n", "[c", function()
      if vim.wo.diff then
        return "[c"
      end
      vim.schedule(function()
        gs.prev_hunk()
      end)
      return "<Ignore>"
    end, { expr = true, desc = "prev hunk" })

    -- Actions
    -- stage
    map({ "n", "v" }, "<leader>hs", ":Gitsigns stage_hunk<CR>")
    map("n", "<leader>hS", gs.stage_buffer, { desc = "Gitsigns stage_buffer" })

    -- reset
    map({ "n", "v" }, "<leader>hr", ":Gitsigns reset_hunk<CR>")
    map("n", "<leader>hR", gs.reset_buffer, { desc = "Gitsigns reset_buffer" })

    -- diff
    map("n", "<leader>hd", gs.diffthis, { desc = "Gitsigns diffthis" })

    map("n", "<leader>hu", gs.undo_stage_hunk, { desc = "Gitsigns undo_stage_hunk" })
    map("n", "<leader>hp", gs.preview_hunk, { desc = "Gitsigns preview_hunk" })
    map("n", "<leader>hb", function()
      gs.blame_line({ full = true })
    end, { desc = "Gitsigns blame_line" })

    map("n", "<leader>tb", gs.toggle_current_line_blame, { desc = "Gitsigns toggle_current_line_blame" })
    map("n", "<leader>td", gs.toggle_deleted, { desc = "Gitsigns toggle_deleted" })
  end,
}

M.cmp = function()
  local cmp = require("cmp")

  return {
    mapping = {
      ["<Tab>"] = cmp.mapping(function(fallback)
        cmp.mapping.abort()
        local copilot_keys = vim.fn["copilot#Accept"]()
        if copilot_keys ~= "" then
          vim.api.nvim_feedkeys(copilot_keys, "i", true)
        else
          fallback()
        end
      end, {
        "i",
        "s",
      }),
    },
  }
end

return M
