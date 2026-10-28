return {
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      -- LazyVim enables the floating `command_palette` for `:`; disable it.
      opts.presets = vim.tbl_deep_extend("force", opts.presets or {}, { command_palette = false })
      -- Disable every cmdline format so the command line behaves like vanilla
      -- Neovim: the full text stays visible, with no icon (tofu) and no conceal.
      opts.cmdline = vim.tbl_deep_extend("force", opts.cmdline or {}, {
        format = {
          cmdline = false,
          search_down = false,
          search_up = false,
          filter = false,
          lua = false,
          help = false,
          calculator = false,
          input = false,
        },
      })
      -- Only surface ERROR notifications; skip info/warn/debug/trace.
      opts.routes = opts.routes or {}
      table.insert(opts.routes, 1, {
        filter = { event = "notify", kind = { "trace", "debug", "info", "warn" } },
        opts = { skip = true },
      })
    end,
  },
}
