return {
  -- Editing
  { "tpope/vim-surround", event = "User AstroFile" },
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
  --
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
}
