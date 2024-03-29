return {
  n = {
    -----------------------
    -- Buffer navigation --
    -----------------------
    L = {
      function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "Next buffer"
    },
    H = {
      function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
      desc = "Previous buffer"
    },
    ["<leader>q"] = { function() require("astronvim.utils.buffer").close() end, desc = "Close buffer" },
    --------------------------
    -- In-buffer navigation --
    --------------------------
    ["]g"] = false, -- disable astronvim default next git hunk mapping
    ["[g"] = false, -- disable astronvim default previous git hunk mapping
    ["<leader>gj"] = { function() require("gitsigns").next_hunk() end, desc = "Next Git hunk" },
    ["<leader>gk"] = { function() require("gitsigns").prev_hunk() end, desc = "Previous Git hunk" },
    ["<leader>s"] = { "<Plug>(leap-forward-to)", desc = "Leap search forward" },
    ["<leader><leader>s"] = { "<Plug>(leap-backward-to)", desc = "Leap search backward" },
    -------------
    -- Harpoon --
    -------------
    ["<leader>hh"] = { function() require('harpoon.ui').toggle_quick_menu() end, desc = "Harpoon quick menu" },
    ["<leader>hn"] = { function() require('harpoon.ui').nav_next() end, desc = "Harpoon go to next mark" },
    ["<leader>hp"] = { function() require('harpoon.ui').nav_prev() end, desc = "Harpoon go to previous mark" },
    ["<leader>ha"] = {
      function()
        require('harpoon.mark').add_file();
        vim.cmd('redraw')
      end,
      desc = "Harpoon add file"
    },
    ["<leader>hs"] = { "<cmd>Telescope harpoon marks<cr>", desc = "Harpoon marks in telescope" },
    --------------
    -- Terminal --
    --------------
    ["<C-t>"] = { "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },
    -----------
    -- Alias --
    -----------
    ["æ"] = ":",
    -------------
    -- Editing --
    -------------
    ["<S-down>"] = { "<cmd>MoveLine(1)<CR>", desc = "Move line down" },
    ["<S-up>"] = { "<cmd>MoveLine(-1)<CR>", desc = "Move line up" },
    ["<S-left>"] = { "<cmd>MoveHChar(-1)<CR>", desc = "Move character left" },
    ["<S-right>"] = { "<cmd>MoveHChar(1)<CR>", desc = "Move character right" },
    ["<leader>rc"] = {
      function() require("textcase").open_telescope('quick_change') end,
      desc = "Convert case of current word"
    },
    ["<leader>rC"] = {
      function() require("textcase").open_telescope('lsp_change') end,
      desc = "Convert case via LSP rename",
    },
  },
  v = {
    ["<S-down>"] = { ":MoveBlock(1)<CR>", desc = "Move block down" },
    ["<S-up>"] = { ":MoveBlock(-1)<CR>", desc = "Move block up" },
    ["<leader>rc"] = {
      function() require("textcase").open_telescope() end,
      desc = "Convert case of selection",
    },
  },
  t = {
    ["<C-j>"] = { "<C-\\><C-n>", desc = "Terminal normal mode" },
  }
}
