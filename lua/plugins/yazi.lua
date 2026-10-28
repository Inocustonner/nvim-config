return {
  {
    "mikavilpas/yazi.nvim",
    cmd = "Yazi",
    keys = {
      { "<leader>fy", "<cmd>Yazi<cr>", mode = { "n", "v" }, desc = "Open yazi at the current file" },
      { "<leader>cw", "<cmd>Yazi cwd<cr>", desc = "Open yazi in nvim working directory" },
    },
    opts = { open_for_directories = false },
  },
}
