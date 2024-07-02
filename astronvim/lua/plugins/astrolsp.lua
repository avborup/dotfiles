---@type LazySpec
return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = {
    formatting = {
      format_on_save = {
        enabled = true,
        allow_filetypes = {
          "rust",
          "lua",
        },
      },
    },
    ---@diagnostic disable: missing-fields
    config = {
      clangd = { capabilities = { offsetEncoding = "utf-8" } },
    },
    features = {
      inlay_hints = true,
    },
    mappings = {
      n = {
        ["<Leader>lR"] = { function() require("telescope.builtin").lsp_references() end, desc = "Find LSP references" },
      },
    },
  },
}
