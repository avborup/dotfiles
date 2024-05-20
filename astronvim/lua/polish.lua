-- Run autoformatter on save for JS
vim.api.nvim_create_autocmd("BufWritePre", {
  desc = "Format code with Prettier",
  pattern = "*.js,*.jsx,*.ts,*.tsx",
  command = "silent Neoformat prettier",
})
