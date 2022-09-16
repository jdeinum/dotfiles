local prettier = require("prettier")

prettier.setup({
  bin = 'prettier', -- or `prettierd`
  filetypes = {
    "c",
    "html",
    "javascript",
    "rust",
    "elixir",
    "c#",
    "scss",
    "typescript",
    "yaml",
    "toml"
  },
})
