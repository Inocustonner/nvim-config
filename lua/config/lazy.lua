local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable",
    "https://github.com/folke/lazy.nvim.git", lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    {
      "LazyVim/LazyVim",
      opts = {
        colorscheme = "gruvbox-material",
        -- The terminal font lacks Nerd Font glyphs, so use plain ASCII icons
        -- everywhere instead of tofu boxes.
        icons = {
          misc = { dots = "..." },
          ft = { octo = "O", gh = "G", ["markdown.gh"] = "G" },
          dap = {
            Stopped = ">",
            Breakpoint = "B",
            BreakpointCondition = "?",
            BreakpointRejected = "!",
            LogPoint = ".>",
          },
          diagnostics = { Error = "E", Warn = "W", Hint = "H", Info = "I" },
          git = { added = "+", modified = "~", removed = "-" },
          kinds = {
            Array = "A",
            Boolean = "B",
            Class = "C",
            Codeium = "c",
            Color = "c",
            Control = "K",
            Collapsed = ">",
            Constant = "C",
            Constructor = "C",
            Copilot = "p",
            Enum = "E",
            EnumMember = "E",
            Event = "e",
            Field = "F",
            File = "F",
            Folder = "D",
            Function = "f",
            Interface = "I",
            Key = "K",
            Keyword = "k",
            Method = "m",
            Module = "M",
            Namespace = "N",
            Null = "0",
            Number = "n",
            Object = "O",
            Operator = "o",
            Package = "P",
            Property = "p",
            Reference = "R",
            Snippet = "S",
            String = "s",
            Struct = "S",
            Supermaven = "m",
            TabNine = "9",
            Text = "T",
            TypeParameter = "T",
            Unit = "U",
            Value = "v",
            Variable = "v",
          },
        },
      },
      import = "lazyvim.plugins",
    },
    { import = "plugins" },
  },
  defaults = { lazy = false, version = false },
  checker = { enabled = true, notify = false },
  performance = {
    rtp = {
      disabled_plugins = { "gzip", "tarPlugin", "tohtml", "tutor", "zipPlugin" },
    },
  },
})
