local config = {
  colorscheme = "default_theme",

  options = {
    g = {
      mapleader = " ",
    },
  },

  default_theme = {
    diagnostics_style = {
      italic = true
    },
  },

  plugins = {
    init = {
      { "tpope/vim-surround" },
      { "sbdchd/neoformat" },
      {
        "simrat39/rust-tools.nvim",
        after = "nvim-lsp-installer",
        config = function()
          require("rust-tools").setup {
            server = astronvim.lsp.server_settings "rust_analyzer",
          }
        end,
      },
    },

    treesitter = {
      ensure_installed = {
        "lua",
        "rust",
        "typescript",
        "javascript",
        "tsx",
      },
    },

    ["nvim-lsp-installer"] = {
      ensure_installed = {
        "sumneko_lua",
        "tsserver",
        "rust_analyzer",
      },
    },
  },

  lsp = {
    skip_setup = { "rust_analyzer" },
  },

  polish = function()
    local map = vim.keymap.set

    -- Keybinds to copy to and paste from clipboard
    map("n", "<leader>y", "\"*y", { desc = "Copy to clipboard" })
    map("n", "<leader><leader>p", "\"*p", { desc = "Paste from clipboard" })

    -- On Danish keyboards, Æ is where the : is on US keyboards
    map("n", "æ", ":")

    -- Run autoformatter on save
    vim.api.nvim_create_autocmd("BufWritePre", {
      desc = "Format code with Prettier",
      pattern = "*.js,*.jsx,*.ts,*.tsx",
      command = "Neoformat prettier",
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
      command = "Neoformat rustfmt",
    })
  end,
}

return config
