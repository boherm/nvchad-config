local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },
  {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        filetypes = {
         markdown = true,
        },
        suggestion = {
          auto_trigger = true,
          keymap = {
            accept = "<D-L>"
          }
        }
      })
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    event = "BufRead",
    dependencies = "mfussenegger/nvim-dap",
    enabled = vim.fn.has "win32" == 0,
    config = function()
      require "custom.configs.dapui"
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "BufRead",
    dependencies = { "williamboman/mason.nvim", "mfussenegger/nvim-dap" },
    enabled = vim.fn.has "win32" == 0,
    config = function()
      require "custom.configs.mason_dap"
    end,
  },
  {
    "folke/which-key.nvim",
    event = "BufRead",
    config = function()
      dofile(vim.g.base46_cache .. "whichkey")
      require "custom.configs.whichkey"
    end,
  },
  {
    "akinsho/toggleterm.nvim",
    cmd = "ToggleTerm",
    event = "BufRead",
    config = function()
      require "custom.configs.toggleterm"
    end,
  },
  {
    "mg979/vim-visual-multi",
    lazy = false,
  },
  {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup({})
      require('telescope').load_extension('projects')
    end,
  }
}

return plugins
