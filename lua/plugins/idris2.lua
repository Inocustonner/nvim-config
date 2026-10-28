return {
  {
    "idris-community/idris2-nvim",
    dependencies = { "neovim/nvim-lspconfig", "MunifTanjim/nui.nvim" },
    -- idris2-nvim has its own semantic-token highlighter (separate from
    -- vim.lsp.semantic_tokens) that re-colors the buffer with bolder/darker
    -- idris* groups as soon as the server attaches. Keep the normal syntax
    -- highlights instead.
    opts = { autostart_semantic = false },
  },
}
