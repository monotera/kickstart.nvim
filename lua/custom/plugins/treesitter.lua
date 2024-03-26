return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      local config = require 'nvim-treesitter.configs'
      config.setup {
        auto_install = true,
        highlight = { enable = true },
        ident = { enable = true },
        sync_install = false,
        ensure_installed = { 'c', 'lua', 'vim', 'vimdoc', 'query' },
      }
    end,
  },
}
