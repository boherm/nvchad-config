require("mason").setup()
require("mason-nvim-dap").setup {
  automatic_setup = true,
  ensure_installed = { "php" },
  automatic_installation = true,
  handlers = {
    function(config)
      -- all sources with no handler get passed here
      -- Keep original functionality
      require("mason-nvim-dap").default_setup(config)
    end,
  },
}

local dap = require 'dap'

-- PHP config
dap.adapters.php = {
  type = "executable",
  command = "node",
  args = { os.getenv("HOME") .. "/.local/share/nvim/mason/packages/php-debug-adapter/extension/out/phpDebug.js" }
}
dap.configurations.php = {
  {
    type = "php",
    request = "launch",
    name = "Listen for Xdebug",
    port = 9003,
  }
}

