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
    ---------------------
    -- Closing buffers --
    ---------------------
    ["<leader>q"] = { "<cmd>Bdelete<cr>", desc = "Close buffer" },
    ["<leader>Q"] = { "<cmd>%bd|e#|bd#<cr>", desc = "Close all other buffers" },
    --------------
    -- Terminal --
    --------------
    ["<C-t>"] = { "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },
    -----------
    -- Alias --
    -----------
    ["æ"] = ":"
  },
  t = {
    ["<C-j>"] = { "<C-\\><C-n>", desc = "Terminal normal mode" },
  }
}
