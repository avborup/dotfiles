return function()
  -- Run autoformatter on save for JS
  vim.api.nvim_create_autocmd("BufWritePre", {
    desc = "Format code with Prettier",
    pattern = "*.js,*.jsx,*.ts,*.tsx",
    command = "silent Neoformat prettier",
  })

  -- Remove background color
  vim.cmd([[
    hi Normal guibg=none ctermbg=none
    hi LineNr guibg=none ctermbg=none
    hi Folded guibg=none ctermbg=none
    hi NonText guibg=none ctermbg=none
    hi SpecialKey guibg=none ctermbg=none
    hi VertSplit guibg=none ctermbg=none
    hi SignColumn guibg=none ctermbg=none
    hi EndOfBuffer guibg=none ctermbg=none
  ]])
end
