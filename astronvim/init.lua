local config = {

  -- Set colorscheme
  colorscheme = "default_theme",

  -- set vim options here (vim.<first_key>.<second_key> =  value)
  options = {
    -- opt = {
    --   relativenumber = true, -- sets vim.opt.relativenumber
    -- },
    g = {
      mapleader = " ", -- sets vim.g.mapleader
    },
  },

  -- Default theme configuration
  default_theme = {
    diagnostics_style = { italic = true },
    -- Modify the color table
    colors = {
      fg = "#abb2bf",
    },
    -- Modify the highlight groups
    highlights = function(highlights)
      local C = require "default_theme.colors"

      highlights.Normal = { fg = C.fg, bg = C.bg }
      return highlights
    end,
    plugins = { -- enable or disable extra plugin highlighting
      aerial = true,
      beacon = false,
      bufferline = true,
      dashboard = true,
      highlighturl = true,
      hop = false,
      indent_blankline = true,
      lightspeed = false,
      ["neo-tree"] = true,
      notify = true,
      ["nvim-tree"] = false,
      ["nvim-web-devicons"] = true,
      rainbow = true,
      symbols_outline = false,
      telescope = true,
      vimwiki = false,
      ["which-key"] = true,
    },
  },

  -- Disable AstroNvim ui features
  ui = {
    nui_input = true,
    telescope_select = true,
  },

  -- Configure plugins
  plugins = {
    -- Add plugins, the packer syntax without the "use"
    init = {
      { "tpope/vim-surround" },
      { "sbdchd/neoformat" },
      {
        "simrat39/rust-tools.nvim",
        after = "nvim-lsp-installer",
        -- requires = { "nvim-lspconfig", "nvim-lsp-installer", "mfussenegger/nvim-dap", "Comment.nvim" },
        config = function()
          require("rust-tools").setup {
            server = astronvim.lsp.server_settings "rust_analyzer",
          }
        end,
      },
      -- TODO: Look into the below plugin. Seems kinda cool.
      -- {
      --   "ray-x/lsp_signature.nvim",
      --   event = "BufRead",
      --   config = function()
      --     require("lsp_signature").setup()
      --   end,
      -- },
    },
    -- All other entries override the setup() call for default plugins
    ["null-ls"] = function(config)
      local null_ls = require "null-ls"
      -- Check supported formatters and linters
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
      config.sources = {
        -- Set a formatter
        null_ls.builtins.formatting.rufo,
        -- Set a linter
        null_ls.builtins.diagnostics.rubocop,
      }
      -- set up null-ls's on_attach function
      config.on_attach = function(client)
        -- NOTE: You can remove this on attach function to disable format on save
        if client.resolved_capabilities.document_formatting then
          vim.api.nvim_create_autocmd("BufWritePre", {
            desc = "Auto format before save",
            pattern = "<buffer>",
            callback = vim.lsp.buf.formatting_sync,
          })
        end
      end
      return config -- return final config table
    end,
    treesitter = {
      ensure_installed = {
        "lua",
        "rust",
        "typescript",
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
    packer = {
      compile_path = vim.fn.stdpath "config" .. "/lua/packer_compiled.lua",
    },
  },

  -- LuaSnip Options
  luasnip = {
    -- Add paths for including more VS Code style snippets in luasnip
    vscode_snippet_paths = {},
    -- Extend filetypes
    filetype_extend = {
      javascript = { "javascriptreact" },
    },
  },

  -- CMP Source Priorities
  -- modify here the priorities of default cmp sources
  -- higher value == higher priority
  -- The value can also be set to a boolean for disabling default sources:
  -- false == disabled
  -- true == 1000
  cmp = {
    source_priority = {
      nvim_lsp = 1000,
      luasnip = 750,
      buffer = 500,
      path = 250,
    },
  },

  -- Extend LSP configuration
  lsp = {
    -- enable servers that you already have installed without lsp-installer
    servers = {
      -- "pyright"
    },
    -- add to the server on_attach function
    -- on_attach = function(client, bufnr)
    -- end,

    -- override the lsp installer server-registration function
    -- server_registration = function(server, opts)
    --   require("lspconfig")["rust_analyzer"].setup(opts)
    -- end,
    -- server_registration = function(server, server_opts)
    --   -- Special code for rust.tools.nvim!
    --   if server.name == "rust_analyzer" then
    --     -- local extension_path = vim.fn.stdpath "data" .. "/dapinstall/codelldb/extension/"
    --     -- local codelldb_path = extension_path .. "adapter/codelldb"
    --     -- local liblldb_path = extension_path .. "lldb/lib/liblldb.so"
    --
    --     require("rust-tools").setup {
    --       server = server_opts,
    --       -- dap = {
    --       --   adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
    --       -- },
    --     }
    --   else
    --     server:setup(server_opts)
    --   end
    -- end,
    --
    skip_setup = { "rust_analyzer" },
  },

  -- Diagnostics configuration (for vim.diagnostics.config({}))
  diagnostics = {
    virtual_text = true,
    underline = true,
  },

  -- This function is run last
  -- good place to configure mappings and vim options
  polish = function()
    -- Keybinds to copy to and paste from clipboard (Windows only has one clipboard)
    vim.keymap.set("n", "<leader>y", "\"*y")
    vim.keymap.set("n", "<leader>p", "\"*p")

    -- On Danish keyboards, Æ is where the : is on US keyboards
    vim.keymap.set("n", "æ", ":")

    -- Run autoformatter on save
    vim.api.nvim_create_autocmd("BufWritePre", {
      desc = "Format code with Prettier",
      pattern = "*.js,*.jsx,*.ts,*.tsx",
      command = "Neoformat prettier",
    })
  end,
}

return config
