---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "github_dark",
  theme_toggle = { "github_dark", "github_light" },

  hl_override = highlights.override,
  hl_add = highlights.add,

  nvdash = {
    load_on_startup = true,
    header = {
      "    __   __        ___  __           ",
      "   |__) /  \\ |__| |__  |__)  |\\/|    ",
      "   |__) \\__/ |  | |___ |  \\  |  |    ",
      "                                      "
    }
  },

  statusline = {
    theme = 'default',
    overriden_modules = function(modules)
      table.insert(
        modules,
        11,
        (function()
          return "%#white# %{strftime('%H:%M')} "
        end)()
      )
    end,
  }
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

-- Neovide config
vim.g.neovide_cursor_antialiasing = true
vim.g.neovide_cursor_trail_size = 0.5
vim.g.neovide_cursor_animation_length = 0.05

return M
