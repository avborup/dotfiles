return function()
  -- Run autoformatter on save
  vim.api.nvim_create_autocmd("BufWritePre", {
    desc = "Format code with Prettier",
    pattern = "*.js,*.jsx,*.ts,*.tsx",
    command = "silent Neoformat prettier",
  })

  vim.cmd([[
    let g:neoformat_rust_rustfmt = {
      \ 'exe': 'rustfmt',
      \ 'args': ['--emit', 'stdout', '--edition', '2021', '--quiet'],
      \ 'stdin': 1
      \ }
  ]])

  vim.api.nvim_create_autocmd("BufWritePre", {
    desc = "Format code with rustfmt",
    pattern = "*.rs",
    command = "silent Neoformat rustfmt",
  })

  vim.api.nvim_create_autocmd("BufWritePre", {
    desc = "Format Elixir code with mix",
    pattern = "*.ex,*.exs",
    -- I use this instead of Neoformat because it feels much snappier
    command = "lua vim.lsp.buf.formatting_sync()",
  })
end
