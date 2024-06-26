---@type LazySpec
return {
  "sainnhe/everforest",
  config = function()
    -- vim.g.everforest_better_performance = 1,
    vim.g.everforest_background = "hard"
    vim.g.everforest_transparent_background = 1
    vim.g.everforest_enable_italic = 0
    vim.g.everforest_disable_italic_comment = 1
    vim.g.everforest_spell_foreground = "colored"
    vim.g.everforest_diagnostic_text_highlight = 1 -- If errors/info/warning looks strange, this highlights background
    vim.g.everforest_diagnostic_line_highlight = 1 -- If errors/info/warning looks strange, this highlights the line
    vim.g.everforest_diagnostic_virtual_text = "colored"
  end,
}
