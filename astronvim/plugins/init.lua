return {
  -- Editing
  { "tpope/vim-surround", event = "User AstroFile" },
  { "tpope/vim-repeat",   event = "User AstroFile" },
  -- Within-buffer navigation
  {
    "ggandor/leap.nvim",
    event = "User AstroFile",
    -- config = function()
    --   require("leap").add_default_mappings()
    -- end
  },
  -- Theme
  {
    "catppuccin/nvim",
    as = "catppuccin",
    config = function()
      require("catppuccin").setup {}
    end,
  },
  -- Buffer navigation
  {
    "ThePrimeagen/harpoon",
    after = "telescope.nvim",
    config = function()
      require("harpoon").setup()
      require("telescope").load_extension("harpoon")
    end,
  },
  -- Autoformatting
  { "sbdchd/neoformat",   event = "User AstroFile" },
  -- Copilot
  { "github/copilot.vim", event = "User AstroFile" },
  -- Language tools
  "simrat39/rust-tools.nvim",
  {
    "saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    requires = { { "nvim-lua/plenary.nvim" } },
    config = function()
      require("crates").setup()
    end,
  },
  "adelarsq/neofsharp.vim",
  "delphinus/vim-firestore",
  -- Memes and fun
  {
    "eandrju/cellular-automaton.nvim",
    keys = {
      -- lazily load on keybind
      { "<leader>fml", "<cmd>CellularAutomaton make_it_rain<CR>", desc = "Cellular automaton" },
    },
  },
}
