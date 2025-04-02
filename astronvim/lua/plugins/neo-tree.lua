return {
  "nvim-neo-tree/neo-tree.nvim",
  enabled = false,
  opts = {
    filesystem = {
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_by_name = {
          ".git",
        },
      },
    },
    window = {
      position = "float",
    },
  },
}
