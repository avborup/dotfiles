return {
  skip_setup = { "rust_analyzer" },

  ["server-settings"] = {
    clangd = {
      capabilities = {
        offsetEncoding = "utf-16",
      },
    },
  },

  formatting = {
    format_on_save = false,
  },
}
