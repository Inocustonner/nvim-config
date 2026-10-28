vim.lsp.enable({ 'lua_ls' })

vim.opt.completeopt = { 'menuone', 'noselect', 'popup' }

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if not client then
      return
    end

    if client.name == 'idris2_lsp' then
      local idris2 = require('idris2')
      local code_action = require('idris2.code_action')
      local hover = require('idris2.hover')
      local repl = require('idris2.repl')

      local function save_then(fn)
        return function()
          if vim.bo[ev.buf].modified then
            vim.cmd('silent update')
          end
          fn()
        end
      end

      vim.keymap.set('n', '<localleader>cs', save_then(code_action.case_split), {
        buffer = ev.buf,
        desc = 'Idris: Case split',
      })
      vim.keymap.set('n', '<localleader>mc', save_then(code_action.make_case), {
        buffer = ev.buf,
        desc = 'Idris: Make case',
      })
      vim.keymap.set('n', '<localleader>ml', save_then(code_action.make_lemma), {
        buffer = ev.buf,
        desc = 'Idris: Make lemma',
      })
      vim.keymap.set('n', '<localleader>ac', save_then(code_action.add_clause), {
        buffer = ev.buf,
        desc = 'Idris: Add clause',
      })
      vim.keymap.set('n', '<localleader>gd', save_then(code_action.generate_def), {
        buffer = ev.buf,
        desc = 'Idris: Generate definition',
      })
      vim.keymap.set('n', '<localleader>rh', save_then(code_action.refine_hole), {
        buffer = ev.buf,
        desc = 'Idris: Refine hole',
      })
      vim.keymap.set('n', '<localleader>fh', save_then(code_action.intro), {
        buffer = ev.buf,
        desc = 'Idris: Fill hole with intro',
      })
      vim.keymap.set('n', '<localleader>t', hover.hover, {
        buffer = ev.buf,
        desc = 'Idris: Hover',
      })
      vim.keymap.set('n', '<localleader>e', repl.evaluate, {
        buffer = ev.buf,
        desc = 'Idris: Evaluate expression',
      })

      -- idris2.show_implicits()
      idris2.show_machine_names()

      local chars = {}
      for char in ('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'):gmatch('.') do
        table.insert(chars, char)
      end
      table.insert(chars, '_')
      client.server_capabilities.completionProvider.triggerCharacters = chars
    end

  end,
})
