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
  },
}
