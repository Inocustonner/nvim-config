return {
  {
    "folke/snacks.nvim",
    opts = {
      explorer = { enabled = false }, -- no sidebar explorer; yazi is the file manager
      notifier = { enabled = true, level = vim.log.levels.ERROR }, -- only error notifications
      indent = { animate = { enabled = false } }, -- instant indent scope (no animation)
    },
  },
}
