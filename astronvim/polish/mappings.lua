return function()
  local map = vim.keymap.set

  -- Keybinds to copy to and paste from clipboard
  map("n", "<leader>y", "\"*y", { desc = "Copy to clipboard" })
  map("n", "<leader><leader>p", "\"*p", { desc = "Paste from clipboard" })

  -- On Danish keyboards, Æ is where the : is on US keyboards
  map("n", "æ", ":")

  map("t", "<C-t>", "<cmd>ToggleTerm<cr>", { desc = "Toggle terminal" })
  map("n", "<C-t>", "<cmd>ToggleTerm<cr>", { desc = "Toggle terminal" })

  -- Close buffer
  map("n", "<leader>q", "<cmd>Bdelete<cr>", { desc = "Close buffer" })
  map("n", "<leader>Q", "<cmd>%bd|e#|bd#<cr>", { desc = "Close all other buffers" })

  map("t", "<C-j>", "<C-\\><C-n>", { desc = "Terminal normal mode" })
end
