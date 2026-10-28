-- User command (moved from lua/config/commands.lua)
function _G.dump_cmd_output(cmd)
  local lines
  if cmd:sub(1, 1) == "!" then
    lines = vim.fn.systemlist(cmd:sub(2))
  else
    lines = vim.split(vim.fn.execute(cmd), "\n", { plain = true })
  end

  vim.cmd("new")
  vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
  vim.bo.buftype = "nofile"
  vim.bo.bufhidden = "wipe"
end

vim.api.nvim_create_user_command("Dump", function(opts)
  _G.dump_cmd_output(opts.args)
end, { nargs = "+", desc = "Show output of an Ex command in a new buffer" })

-- idris2 LSP (moved from lua/config/lsp_settings.lua)
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if not client or client.name ~= "idris2_lsp" or not LazyVim.has("idris2-nvim") then
      return
    end

    local idris2 = require("idris2")
    local code_action = require("idris2.code_action")
    local hover = require("idris2.hover")
    local repl = require("idris2.repl")

    local function save_then(fn)
      return function()
        if vim.bo[ev.buf].modified then
          vim.cmd("silent update")
        end
        fn()
      end
    end

    vim.keymap.set("n", "<localleader>cs", save_then(code_action.case_split), { buffer = ev.buf, desc = "Idris: Case split" })
    vim.keymap.set("n", "<localleader>mc", save_then(code_action.make_case), { buffer = ev.buf, desc = "Idris: Make case" })
    vim.keymap.set("n", "<localleader>ml", save_then(code_action.make_lemma), { buffer = ev.buf, desc = "Idris: Make lemma" })
    vim.keymap.set("n", "<localleader>ac", save_then(code_action.add_clause), { buffer = ev.buf, desc = "Idris: Add clause" })
    vim.keymap.set("n", "<localleader>gd", save_then(code_action.generate_def), { buffer = ev.buf, desc = "Idris: Generate definition" })
    vim.keymap.set("n", "<localleader>rh", save_then(code_action.refine_hole), { buffer = ev.buf, desc = "Idris: Refine hole" })
    vim.keymap.set("n", "<localleader>fh", save_then(code_action.intro), { buffer = ev.buf, desc = "Idris: Fill hole with intro" })
    vim.keymap.set("n", "<localleader>t", hover.hover, { buffer = ev.buf, desc = "Idris: Hover" })
    vim.keymap.set("n", "<localleader>e", repl.evaluate, { buffer = ev.buf, desc = "Idris: Evaluate expression" })

    -- idris2.show_implicits()
    idris2.show_machine_names()

    local chars = {}
    for char in ("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"):gmatch(".") do
      table.insert(chars, char)
    end
    table.insert(chars, "_")
    client.server_capabilities.completionProvider.triggerCharacters = chars
  end,
})
