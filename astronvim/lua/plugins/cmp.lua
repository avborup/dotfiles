return {
  "hrsh7th/nvim-cmp",
  opts = function(_, opts)
    local cmp = require "cmp"

    return require("astrocore").extend_tbl(opts, {
      -- Map Github copilot accept
      mapping = {
        ["<C-Space>"] = function(fallback)
          cmp.mapping.abort()
          local copilot_keys = vim.fn["copilot#Accept"]()
          if copilot_keys ~= "" then
            vim.api.nvim_feedkeys(copilot_keys, "i", true)
          else
            fallback()
          end
        end,
      },
    })
  end,
}
