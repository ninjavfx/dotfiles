return {
  -- Add the Catppuccin theme
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000, -- Make sure it loads first
    opts = {
      --flavour = "mocha", -- Choose flavor: latte, frappe, macchiato, mocha
      flavour = "macchiato", -- Choose flavor: latte, frappe, macchiato, mocha
      -- You can add more configuration options here
      mason = true,
      neotree = true,
      telescope = true,
      treesitter = true,
      which_key = true,
    },
  },

  -- Set it as the default colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
