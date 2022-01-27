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

function M.echo(msg, hlgroup)
  vim.api.nvim_echo({{fmt('[hardline] %s', msg), hlgroup}}, false, {})
end

function M.set_cache_autocmds(augroup)
  vim.cmd(fmt([[
  augroup %s
    autocmd!
    autocmd CursorHold,BufWritePost * unlet! b:%s
  augroup END
  ]], augroup, augroup))
end

return M
