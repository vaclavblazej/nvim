function subst(a, b, c)
end

local ls = require("luasnip")
local f = ls.function_node
local i = ls.insert_node
function subst(args, parent)
    -- if (#parent.snippet.env.SELECT_RAW > 0) then
    return string.gsub(args[1], args[2], args[2])
       -- return sn(nil, i(1, parent.snippet.env.SELECT_RAW))
    -- else
        -- return sn(nil, i(1, ''))
    -- end
end



return {
    s({trig="in"},
      fmta("ll <>; cin >>>> <>;", { i(1), f(1, subst) })
    ),
}
