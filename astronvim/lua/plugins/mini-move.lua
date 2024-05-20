return {
  "echasnovski/mini.move",
  version = "*",
  keys = {
    {
      "<S-down>",
      function() require("mini.move").move_selection "down" end,
      desc = "Move selection down one line",
      mode = "v",
    },
    {
      "<S-up>",
      function() require("mini.move").move_selection "up" end,
      desc = "Move selection up one line",
      mode = "v",
    },
    {
      "<S-left>",
      function() require("mini.move").move_selection "left" end,
      desc = "Move selection left",
      mode = "v",
    },
    {
      "<S-right>",
      function() require("mini.move").move_selection "right" end,
      desc = "Move selection right",
      mode = "v",
    },
    {
      "<S-down>",
      function() require("mini.move").move_line "down" end,
      desc = "Move current line down one line",
      mode = "n",
    },
    {
      "<S-up>",
      function() require("mini.move").move_line "up" end,
      desc = "Move current line up one line",
      mode = "n",
    },
    {
      "<S-left>",
      function() require("mini.move").move_line "left" end,
      desc = "Move current line left",
      mode = "n",
    },
    {
      "<S-right>",
      function() require("mini.move").move_line "right" end,
      desc = "Move current line right",
      mode = "n",
    },
  },
}
