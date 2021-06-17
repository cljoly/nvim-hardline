local cmd, fn = vim.cmd, vim.fn
local g = vim.g
local fmt = string.format
local M = {}

M.modes = {
  ['?'] = {text = '???', state = 'inactive'},
  ['n'] = {text = 'NOR', state = 'normal'},
  ['i'] = {text = 'INS', state = 'insert'},
  ['R'] = {text = 'REP', state = 'replace'},
  ['v'] = {text = 'VIS', state = 'visual'},
  ['V'] = {text = 'V-L', state = 'visual'},
  [''] = {text = 'V-B', state = 'visual'},
  ['c'] = {text = 'COM', state = 'command'},
  ['s'] = {text = 'SEL', state = 'visual'},
  ['S'] = {text = 'S-L', state = 'visual'},
  [''] = {text = 'S-B', state = 'visual'},
  ['t'] = {text = 'TER', state = 'command'},
}

function M.echo(hlgroup, msg)
  cmd(fmt('echohl %s', hlgroup))
  cmd(fmt('echo "[hardline] %s"', msg))
  cmd('echohl None')
end

function M.is_active()
  return g.statusline_winid == fn.win_getid()
end

function M.set_cache_autocmds(augroup)
  cmd(fmt('augroup %s', augroup))
  cmd('autocmd!')
  cmd(fmt('autocmd CursorHold,BufWritePost * unlet! b:%s', augroup))
  cmd('augroup END')
end

return M
