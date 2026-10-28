require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'neovim/nvim-lspconfig'
  use {
    'idris-community/idris2-nvim',
    requires = {
      'neovim/nvim-lspconfig',
      'MunifTanjim/nui.nvim',
    },
  }
  use 'nvim-tree/nvim-web-devicons'
  use {
    'saghen/blink.cmp',
    tag = 'v1.10.2',
    requires = { 'rafamadriz/friendly-snippets' },
  }
  use 'folke/flash.nvim'
  use 'tpope/vim-surround'
  use 'windwp/nvim-autopairs'
  use 'yaocccc/visual-multi.nvim'
  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
  }
  use {
    'mikavilpas/yazi.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
  }
end)

local ok_autopairs, autopairs = pcall(require, 'nvim-autopairs')
if ok_autopairs then
  autopairs.setup({})
end

local ok_visual_multi, visual_multi = pcall(require, 'visual-multi')
if ok_visual_multi then
  visual_multi.setup({
    mappings = {
      add_cursor_word = false,
      select_all = false,
    },
  })
end

local ok_flash, flash = pcall(require, 'flash')
if ok_flash then
  flash.setup({
    modes = {
      char = { keys = { 'f', 'F', 't', 'T' } },
    },
  })
end

local ok_yazi, yazi = pcall(require, 'yazi')
if ok_yazi then
  yazi.setup({
    open_for_directories = false,
  })
end

local ok_idris2, idris2 = pcall(require, 'idris2')
if ok_idris2 then
  idris2.setup({})
end

local ok_blink, blink = pcall(require, 'blink.cmp')
if ok_blink then
  blink.setup({
    keymap = { preset = 'default' },
    appearance = { nerd_font_variant = 'mono' },
    completion = { documentation = { auto_show = true, auto_show_delay_ms = 300 } },
    sources = { default = { 'lsp', 'path', 'snippets', 'buffer' } },
    fuzzy = { implementation = 'lua' },
  })
end
