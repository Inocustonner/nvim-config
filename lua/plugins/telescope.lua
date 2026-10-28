return {
  {
    "nvim-telescope/telescope.nvim",
    optional = true,
    keys = {
      { "<leader>fnc", function()
        require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("config") })
      end, desc = "Find Neovim config files" },
      { "<leader>fl", function()
        require("telescope.builtin").live_grep({ cwd = vim.fn.expand("%:p:h") })
      end, desc = "Find files here" },
    },
  },
}
