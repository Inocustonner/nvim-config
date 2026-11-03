return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- server configs live in lsp/<name>.lua; mason = false: installed via uv, so enable directly
      servers = {
        basedpyright = { mason = false },
        ruff = { mason = false },
      },
    },
  },
}
