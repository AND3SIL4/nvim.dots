return {
  "monkoose/neocodeium",
  event = "VeryLazy",
  config = function()
    local neocodeium = require("neocodeium")
    neocodeium.setup({
      enabled = true, -- Enable by default
      debounce = false, -- Suggestions appear while typing
    })
    vim.keymap.set("i", "<A-f>", neocodeium.accept, { desc = "Accept Neocodeium suggestion" }) -- Accept suggestions with Alt-f
    vim.keymap.set("i", "<A-;>", neocodeium.cycle_or_complete, { desc = "Cycle through suggestions" }) -- Accept suggestions with Alt-f
  end,
}
