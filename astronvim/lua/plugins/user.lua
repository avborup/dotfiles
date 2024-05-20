---@type LazySpec
return {
  -- Editing
  { "tpope/vim-surround", event = "User AstroFile" },
  { "tpope/vim-repeat", event = "User AstroFile" },

  -- Formatting
  { "sbdchd/neoformat", cmd = "Neoformat" },

  -- Copilot
  { "github/copilot.vim", event = "User AstroFile" },

  -- Memes and fun
  {
    "eandrju/cellular-automaton.nvim",
    keys = {
      { "<Leader>F", "<cmd>CellularAutomaton make_it_rain<CR>", desc = "Cellular automaton" },
    },
  },

  -- Disable plugins
  {
    "rmax397574/better-escape.nvim",
    enabled = false,
  },
}
