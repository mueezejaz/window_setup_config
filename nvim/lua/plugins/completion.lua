return {
  {
    "saghen/blink.cmp",
    dependencies = {
      { "L3MON4D3/LuaSnip", version = "v2.*", build = "make install_jsregexp" },
    },
    version = "v1.*",
    opts = {
      keymap = {
        preset = "default",
        ["<CR>"] = { "select_and_accept", "fallback" },
        ["<C-y>"] = { "fallback" },
        ["<C-p>"] = { "select_prev", "fallback" },
        ["<C-n>"] = { "select_next", "fallback" },
      },
      sources = {
        default = { "lsp", "snippets" },
      },
      completion = {
        menu = {
          draw = {
            columns = {
              { "kind_icon" },
              { "label", "label_description", gap = 1 },
            },
          },
        },
      },
      signature = { enabled = true },
      snippets = { preset = "luasnip" },
    },
    opts_extend = { "sources.default" },
  },
}
