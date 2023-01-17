local config = {
  colorscheme = "catppuccin",

  options = {
    g = {
      mapleader = " ",
    },
  },

  default_theme = {
    highlights = function(hl)
      hl.DiagnosticError.italic = true
      hl.DiagnosticHint.italic = true
      hl.DiagnosticInfo.italic = true
      hl.DiagnosticWarn.italic = true
      return hl
    end,
  },

  plugins = require("user.plugins"),
  lsp = require("user.lsp"),
  polish = require("user.polish"),
}

return config
