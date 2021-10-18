local fn = vim.fn
local g = vim.g

local function conflict_position()
  local current_line = vim.api.nvim_win_get_cursor(0)[1]

  local conflict_end = fn.search(g.conflict_marker_end, 'cn', current_line+1)
  if current_line == conflict_end then -- end of conflict
    return "t"
  end

  local conflict_start = fn.search(g.conflict_marker_begin, 'cn')
  if current_line == conflict_start then -- start of conflict
    return "o"
  end

  if current_line < conflict_start then
    return "↓"..conflict_start
  end
  local wrapped = fn.search(g.conflict_marker_begin, 'nw')
  if wrapped > 0 and current_line > conflict_start then -- first conflict in the file
    return "↻"..wrapped
  end

  -- No conflict in the file
  return ""
end

local function check_conflict()
  local code = ""
  local conflicted = fn['gina#component#status#conflicted']()
  if #conflicted == 0 then -- No conflict in the repo
    return nil
  else
    return table.concat{
      "C:",
      conflicted,
      conflict_position(),
    }
  end
end

local function get_error()
  return table.concat({
    check_conflict(),
  })
end

return {
  get_error = get_error,
}
