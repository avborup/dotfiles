return {
  n = {
    -----------------------
    -- Buffer navigation --
    -----------------------
    L = {
      function() require("astrocore.buffer").nav(vim.v.count1) end,
      desc = "Next buffer",
    },
    H = {
      function() require("astrocore.buffer").nav(-vim.v.count1) end,
      desc = "Previous buffer",
    },
    ["<Leader>q"] = { function() require("astrocore.buffer").close() end, desc = "Close buffer" },

    --------------------------
    -- In-buffer navigation --
    --------------------------
    ["]g"] = false, -- disable astronvim default next git hunk mapping
    ["[g"] = false, -- disable astronvim default previous git hunk mapping
    ["<Leader>gj"] = { function() require("gitsigns").next_hunk() end, desc = "Next Git hunk" },
    ["<Leader>gk"] = { function() require("gitsigns").prev_hunk() end, desc = "Previous Git hunk" },
    ["<Leader>s"] = { "<Plug>(leap-forward-to)", desc = "Leap search forward" },
    ["<Leader><Leader>s"] = { "<Plug>(leap-backward-to)", desc = "Leap search backward" },

    --------------
    -- Terminal --
    --------------
    ["<C-t>"] = { "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },

    -----------
    -- Alias --
    -----------
    ["æ"] = ":",
  },

  t = {
    ["<C-j>"] = { "<C-\\><C-n>", desc = "Terminal normal mode" },
  },

  i = {
    ["<C-L>"] = { "<Plug>(copilot-accept-word)", desc = "Accept Copilot word" },
  },
}
