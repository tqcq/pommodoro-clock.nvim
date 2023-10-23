local M = {}

local zero = [[
0
]]

local one = [[
1
]]

local two = [[
2
]]

local tree = [[
3
]]

local four = [[
4
]]

local five = [[
5
]]

local six = [[
6
]]

local seven = [[
7
]]

local eight = [[
8
]]

local nine = [[
9
]]

local separator = [[
:
]]

local clock = [[
  
]]

local chars = {
  ["0"] = zero,
  ["1"] = one,
  ["2"] = two,
  ["3"] = tree,
  ["4"] = four,
  ["5"] = five,
  ["6"] = six,
  ["7"] = seven,
  ["8"] = eight,
  ["9"] = nine,
  [":"] = separator,
  ["c"] = clock,
}

M.split_string_by_line = function(text)
  local lines = {}
  for line in text:gmatch("([^\n]*)\n?") do
    table.insert(lines, line)
  end
  return lines
end

M.str_to_ascii = function(str)
  local lines = {
    {},
    {},
    {},
    {},
  }
  for _, s in ipairs(str) do
    local char = chars[s]
    local char_lines = M.split_string_by_line(char)
    for i, line in ipairs(char_lines) do
      table.insert(lines[i], line)
    end
  end

  return {
    table.concat(lines[1], " "),
    table.concat(lines[2], " "),
    table.concat(lines[3], " "),
  }
end

return M
