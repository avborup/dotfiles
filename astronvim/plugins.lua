return {
  init = {
    { "tpope/vim-surround" },
    { "sbdchd/neoformat" },
    -- {
    --   "ggandor/leap.nvim",
    --   config = function()
    --     require("leap").set_default_keymaps()
    --   end,
    -- },
    {
      "simrat39/rust-tools.nvim",
      after = "mason-lspconfig.nvim",
      config = function()
        require("rust-tools").setup {
          server = astronvim.lsp.server_settings "rust_analyzer",
        }
      end,
    },
    {
      "saecki/crates.nvim",
      event = { "BufRead Cargo.toml" },
      requires = { { "nvim-lua/plenary.nvim" } },
      config = function()
        require("crates").setup()
      end,
    },
    "github/copilot.vim",
    {
      "catppuccin/nvim",
      as = "catppuccin",
      config = function()
        require("catppuccin").setup {}
      end,
    },
    "adelarsq/neofsharp.vim",
    {
      "ThePrimeagen/harpoon",
      after = "telescope.nvim",
      config = function()
        require("harpoon").setup()
        require("telescope").load_extension("harpoon")
      end,
    }
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

  ["mason-lspconfig"] = {
    ensure_installed = {
      "sumneko_lua",
      "tsserver",
      "rust_analyzer",
    },
  },

  cmp = function(opts)
    local cmp = require "cmp"

    -- Map Github copilot accept
    opts.mapping["<C-Space>"] = function(fallback)
      cmp.mapping.abort()
      local copilot_keys = vim.fn["copilot#Accept"]()
      if copilot_keys ~= "" then
        vim.api.nvim_feedkeys(copilot_keys, "i", true)
      else
        fallback()
      end
    end

    return opts
  end,

  ["neo-tree"] = {
    filesystem = {
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_by_name = {
          ".git"
        },
      },
    },
    window = {
      position = "float",
    }
  },

  telescope = {
    defaults = {
      prompt_prefix = " ",
    }
  },

  notify = {
    -- To avoid warning when no background color is set
    background_colour = "#000000",
  },
}
