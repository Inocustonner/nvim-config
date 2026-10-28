function _G.dump_cmd_output(cmd)
  local lines
  if cmd:sub(1, 1) == '!' then
    lines = vim.fn.systemlist(cmd:sub(2))
  else
    lines = vim.split(vim.fn.execute(cmd), '\n', { plain = true })
  end

  vim.cmd('new')
  vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
  vim.bo.buftype = 'nofile'
  vim.bo.bufhidden = 'wipe'
end

vim.api.nvim_create_user_command('Dump', function(opts)
  _G.dump_cmd_output(opts.args)
end, { nargs = '+', desc = 'Show output of an Ex command in a new buffer' })
