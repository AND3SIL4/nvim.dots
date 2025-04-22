return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  opts = {
    check_ts = true, -- Usa Treesitter para Python
    disable_filetype = { "lazy", "snacks" },
  },
  config = function(_, opts)
    require("nvim-autopairs").setup(opts)
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
  end,
}
