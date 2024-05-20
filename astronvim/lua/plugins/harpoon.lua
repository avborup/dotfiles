return {
  "ThePrimeagen/harpoon",
  after = "telescope.nvim",
  config = function()
    require("harpoon").setup()
    require("telescope").load_extension "harpoon"
  end,
  keys = {
    { "<Leader>hh", function() require("harpoon.ui").toggle_quick_menu() end, desc = "Harpoon quick menu" },
    { "<Leader>hn", function() require("harpoon.ui").nav_next() end, desc = "Harpoon go to next mark" },
    { "<Leader>hp", function() require("harpoon.ui").nav_prev() end, desc = "Harpoon go to previous mark" },
    {
      "<Leader>ha",
      function()
        require("harpoon.mark").add_file()
        vim.cmd "redraw"
      end,
      desc = "Harpoon add file",
    },
    { "<Leader>hs", "<cmd>Telescope harpoon marks<cr>", desc = "Harpoon marks in telescope" },
  },
}
