local M = {}

local function today()
  local thingy = io.popen('echo "$(date +%a) $(date +%d) $(date +%b)" | tr -d "\n"')
  local date
  if (thingy ~= nil) then
    date = thingy:read("*a")
    thingy:close()
  end

  return {
    type = "text",
    val = "┌─   Today is " .. date .. " ─┐",
    opts = {
      position = "center",
      hl = "AlphaHeader",
    }
  }
end

local function plugin_count()
  local handle = io.popen('fd -d 2 . $HOME"/.local/share/lunarvim/site/pack/packer" | wc -l | tr -d "\n " ')
  local count
  if (handle ~= nil) then
    count = handle:read("*a")
    handle:close()
  end

  return {
    type = "text",
    val = "└─   " .. count .. " plugins in total ─┘",
    opts = {
      position = "center",
      hl = "AlphaHeader",
    }
  }

end

M.setup = function()
  lvim.builtin.alpha.mode = "dashboard"

  local merge_tb = require("utils").merge_tb
  local dashboard = lvim.builtin.alpha.dashboard

  local fortune = require("alpha.fortune")


  dashboard.section = merge_tb(dashboard.section, {
    header =
    {
      type = "group",
      val = {
        { type = "padding", val = 10 },
        merge_tb(dashboard.section.header, {
          val = {
            "                                                     ",
            "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
            "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
            "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
            "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
            "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
            "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
            "                                                     ",
          },
        }),
        { type = "padding", val = 1 },
        today(),
        plugin_count()
      },
    },
    footer = {
      val = fortune()
    }
  })
end

return M
