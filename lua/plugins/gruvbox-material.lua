return {
  {
    "sainnhe/gruvbox-material",
    lazy = false, -- load at startup so the colorscheme file is on the runtimepath
    priority = 1000, -- before other UI plugins read the colors
    init = function()
      vim.g.gruvbox_material_background = "soft"
    end,
    config = function()
      vim.cmd.colorscheme("gruvbox-material")
    end,
  },
}
