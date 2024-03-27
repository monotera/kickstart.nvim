return {
  -- add gruvbox
  --{ 'ellisonleao/gruvbox.nvim' },

  -- Configure LazyVim to load gruvbox
  {
    'folke/tokyonight.nvim',
    --priority = 1000, -- Make sure to load this before all the other start plugins.,
    opts = {
      transparent = true,
      styles = {
        sidebars = 'transparent',
        floats = 'transparent',
      },
    },
  },
}
