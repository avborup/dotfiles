return {
  "johmsalas/text-case.nvim",
  keys = {
    {
      "<Leader>rc",
      function() require("textcase").open_telescope "quick_change" end,
      desc = "Convert case of current word",
      mode = "n",
    },
    {
      "<Leader>rC",
      function() require("textcase").open_telescope "lsp_change" end,
      desc = "Convert case via LSP rename",
      mode = "n",
    },
    {
      "<Leader>rc",
      function() require("textcase").open_telescope() end,
      desc = "Convert case of selection",
      mode = "v",
    },
  },
  config = function()
    require("textcase").setup {}
    require("telescope").load_extension "textcase"
  end,
}
