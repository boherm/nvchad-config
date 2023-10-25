---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "github_dark",

  hl_override = highlights.override,
  hl_add = highlights.add,

  nvdash = {
    load_on_startup = true,
    header = {
      "    __   __        ___  __           ",
      "   |__) /  \\ |__| |__  |__)  |\\/|    ",
      "   |__) \\__/ |  | |___ |  \\  |  |    ",
      "                                 1.0 "
    },
    buttons = {
      { "  Find File", "Spc f f", "Telescope find_files" },
      { "󰈚  Recent Files", "Spc f o", "Telescope oldfiles" },
      { "  Bookmarks", "Spc m a", "Telescope marks" },
      { "  Mappings", "Spc c h", "NvCheatsheet" },
    }
  },

  statusline = {
    theme = 'vscode_colored',
    overriden_modules = function(modules)
      table.insert(
        modules,
        14,
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

-- Neovim config
vim.opt.colorcolumn = "121"
vim.g.toggle_theme_icon = ""

-- Neovide config
vim.g.neovide_cursor_antialiasing = true
vim.g.neovide_cursor_trail_size = 0.5
vim.g.neovide_cursor_animation_length = 0.05

return M
