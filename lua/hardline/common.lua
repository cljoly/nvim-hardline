local fmt = string.format
local M = {}

M.modes = {
  [''] = {text = 'S-B', state = 'visual'},
  [''] = {text = 'V-B', state = 'visual'},
  ['?'] = {text = '???', state = 'inactive'},
  ['R'] = {text = 'REP', state = 'replace'},
  ['S'] = {text = 'S-L', state = 'visual'},
  ['V'] = {text = 'V-L', state = 'visual'},
  ['c'] = {text = 'CMD', state = 'command'},
  ['i'] = {text = 'INS', state = 'insert'},
  ['n'] = {text = 'NOR', state = 'normal'},
  ['r'] = {text = 'PRT', state = 'replace'},
  ['s'] = {text = 'SEL', state = 'visual'},
  ['t'] = {text = 'TER', state = 'command'},
  ['v'] = {text = 'VIS', state = 'visual'},
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
