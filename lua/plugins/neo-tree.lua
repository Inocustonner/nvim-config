return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      { "<leader>eo", "<cmd>Neotree document_symbols toggle<cr>", desc = "Explorer: symbols outline (current file)" },
    },
    opts = {
      sources = { "filesystem", "buffers", "git_status", "document_symbols" },
      window = { position = "right" },
    },
  },
}
