return {
  -- Editing
  { "tpope/vim-surround", event = "User AstroFile" },
  { "tpope/vim-repeat",   event = "User AstroFile" },
  {
    "fedepujol/move.nvim",
    cmd = { "MoveLine", "MoveHChar", "MoveWord", "MoveBlock", "MoveHBlock" },
  },
  {
    "johmsalas/text-case.nvim",
    config = function()
      require('textcase').setup {}
      require('telescope').load_extension('textcase')
    end
  },
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
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("crates").setup()
    end,
  },
  {
    "AstroNvim/astrocommunity",
    { import = "astrocommunity.pack.scala" },
  },
  "adelarsq/neofsharp.vim",
  "delphinus/vim-firestore",
  -- Send HTTP requests and view responses
  {
    "rest-nvim/rest.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    ft = { "http" },
    config = function()
      require("rest-nvim").setup({
        result_split_horizontal = true,
      })
    end,
    keys = {
      { "<leader>rs", "<Plug>RestNvim", desc = "Send HTTP request under cursor" },
    }
  },
  -- Memes and fun
  {
    "eandrju/cellular-automaton.nvim",
    keys = {
      -- lazily load on keybind
      { "<leader>fml", "<cmd>CellularAutomaton make_it_rain<CR>", desc = "Cellular automaton" },
    },
  },
}
