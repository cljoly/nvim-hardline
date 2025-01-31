local fn = vim.fn
local fmt = string.format

local function pad(c, m)
  local padch = '·'
  return string.rep(padch, string.len(tostring(m)) - string.len(tostring(c)))
end

local function get_line()
  local nbline = fn.line('$')
  local line = fn.line('.')
  return fmt('%s%d/%d', pad(line, nbline), line, nbline)
end

local function get_column()
  local nbcol = fn.col('$') - 1
  local col = fn.col('.')
  return fmt('%s%d', pad(col, 10), col)
end

local function get_percent()
  local nb_lines = fn.line('$')
  local line = fn.line('.')
  local percent = math.floor(line * 100 / nb_lines)
  return fmt('%s%d%%%%', pad(percent, 100), percent)
end

local function get_item()
  return get_column()
end

return {
  get_item = get_item,
}
