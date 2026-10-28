return {
  {
    "yaocccc/visual-multi.nvim",
    opts = {
      mappings = { add_cursor_word = false, select_all = false },
    },
    keys = {
      { "<C-d>d", function()
        require("visual-multi").from_visual(true)
      end, mode = "x", desc = "Visual Multi: select all" },
    },
  },
}
