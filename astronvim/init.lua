local config = {
  colorscheme = "catppuccin",

  options = {
    g = {
      mapleader = " ",
    },
  },

  default_theme = {
    diagnostics_style = {
      italic = true
    },
  },

  plugins = require("user.plugins"),
  lsp = require("user.lsp"),
  polish = require("user.polish"),
}

return config
