return {
  {
    "folke/noice.nvim",
    opts = {
      -- LazyVim enables presets.command_palette, which renders `:` as a floating
      -- "Cmdline" box at the top. Keep noice's cmdline but render the classic
      -- bottom command line instead (noice's default view is "cmdline_popup").
      presets = { command_palette = false },
      cmdline = {
        view = "cmdline",
        -- noice prefixes the prompt with a nerd-font icon that shows up as a
        -- tofu (diamond with "?") when the glyph is missing. Use ":" instead.
        format = { cmdline = { icon = ":" } },
      },
    },
  },
}
