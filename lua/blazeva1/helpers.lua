-- ~/.config/nvim/lua/luasnip-helper-funcs.lua
local M = {}

local ls = require("luasnip")
local sn = ls.snippet_node
local f = ls.function_node
local i = ls.insert_node
function M.get_visual(args, parent)
    if (#parent.snippet.env.SELECT_RAW > 0) then
        return sn(nil, i(1, parent.snippet.env.SELECT_RAW))
    else
        return sn(nil, i(1, ''))
    end
end

return M
