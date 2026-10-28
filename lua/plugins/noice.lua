return {
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      -- LazyVim enables presets.command_palette, which renders `:` as a floating
      -- "Cmdline" box at the top. Keep noice's cmdline but render the classic
      -- bottom command line instead (noice's default view is "cmdline_popup").
      opts.presets = vim.tbl_deep_extend("force", opts.presets or {}, { command_palette = false })
      opts.cmdline = vim.tbl_deep_extend("force", opts.cmdline or {}, {
        view = "cmdline",
        -- noice prefixes the prompt with a nerd-font icon that shows up as a
        -- tofu (diamond with "?"). Use ":" instead.
        format = { cmdline = { icon = ":" } },
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
