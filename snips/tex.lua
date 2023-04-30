-- For tutorial, see: https://www.ejmastnak.com/tutorials/vim-latex/luasnip/

local helpers = require('blazeva1.helpers')
local get_visual = helpers.get_visual

-- substitute line_begin with arbitrary function
local tex = {}
tex.in_math = function()  -- math context detection
  return vim.fn['vimtex#syntax#in_mathzone']() == 1
end
tex.in_text = function()
  return not tex.in_math()
end
tex.in_comment = function()  -- comment detection
  return vim.fn['vimtex#syntax#in_comment']() == 1
end
tex.in_env = function(name)  -- generic environment detection
    local is_inside = vim.fn['vimtex#env#is_inside'](name)
    return (is_inside[1] > 0 and is_inside[2] > 0)
end
-- A few concrete environments---adapt as needed
tex.in_equation = function()  -- equation environment detection
    return tex.in_env('equation')
end
tex.in_itemize = function()  -- itemize environment detection
    return tex.in_env('itemize')
end
tex.in_tikz = function()  -- TikZ picture environment detection
    return tex.in_env('tikzpicture')
end

return {
    s({trig="b", dscr="Create an environment"},
      fmta(
        [[
          \begin{<>}
              <>
          \end{<>}
        ]],
        { i(1, "proof"), i(0), rep(1), }
      )
    ),
    s({trig = "it"}, fmta("\\textit{<>}", { d(1, get_visual) })),
    s({trig = "bf"}, fmta("\\textbf{<>}", { d(1, get_visual) })),
    s({trig = "rm"}, fmta("\\textrm{<>}", { d(1, get_visual) })),
    s({trig = "sc"}, fmta("\\textsc{<>}", { d(1, get_visual) })),
    s({trig = "cal"}, fmta("\\textcal{<>}", { d(1, get_visual) })),
    s({trig = '([^%d])([%d]+)([^%d])', regTrig = true, wordTrig = false, snippetType="autosnippet"},
      fmta("<>$<>$<>", { -- automatic $4$ around numbers when writing text
          f( function(_, snip) return snip.captures[1] end ),
          f( function(_, snip) return snip.captures[2] end ),
          f( function(_, snip) return snip.captures[3] end )
      }), { condition = tex.in_text }
    ),
    -- s({trig = "...", snippetType="autosnippet"}, fmta("<>_<>,\\dots,<>_<>", {i(1),i(2),rep(1),i(3)}), { condition = tex.in_math } ),
    s({trig = ". ", snippetType="autosnippet"}, fmta("\\cdot ", {}), { condition = tex.in_math } ),
    s({trig = "l", snippetType="autosnippet"}, fmta("\\ell", {}), { condition = tex.in_math } ),
    s({trig = "->", snippetType="autosnippet"}, fmta("\\to", {}), { condition = tex.in_math }),
    s({trig="ff", snippetType="autosnippet"},
      fmta("\\frac{<>}{<>}", { i(1), i(2) }), { condition = tex.in_math }
    ),
    s({trig="fig"},
      fmta(
        [[
        \begin{figure}[ht]
            \centering
            \includegraphics{<>}
            \caption{todo}%
            \label{fig:<>}
        \end{figure}
        ]], { i(1), rep(1) })
    ),
    -- s({trig="cc", snippetType="autosnippet"},
      -- fmta(
        -- [[
            -- \begin{cases}
                -- <>
            -- \end{cases}
        -- ]], { i(0) }), { condition = tex.in_math }
    -- ),
    s({trig="tab"},
      fmta(
        [[
        \begin{table}[ht]
            \centering
            \caption{todo}%
            \label{tab:<>}
            \begin{tabular}{|c|c|c|c|}
                \hline
                <>
                \hline
                1 & 2 & 3 & 4
                \hline
            \end{tabular}
        \end{table}
        ]], { i(1), i(0) })
    ),
}
-- s({trig = "h1", dscr="Top-level section"},
  -- fmta(
    -- [[\section{<>}]],
    -- { i(1) }
  -- ), 
  -- {condition = line_begin}  -- set condition in the `opts` table
-- ),
-- s({trig = '([%a%)%]%}])00', regTrig = true, wordTrig = false, snippetType="autosnippet"},
  -- fmta(
    -- "<>_{<>}",
    -- {
      -- f( function(_, snip) return snip.captures[1] end ),
      -- t("0")
    -- }
  -- )
-- ),
-- s({trig = "tii", dscr = "Expands 'tii' into LaTeX's textit{} command."},
  -- fmta("\\textit{<>}",
    -- {
      -- d(1, get_visual), -- dynamic node
    -- }
  -- )
-- ),
-- s({trig="hw", snippetType="autosnippet"}, {
    -- t("hello world"),
-- }),
-- s({trig = "([^%a])ff", regTrig = true, wordTrig = false, snippetType="autosnippet", dscr="Expands 'ff' into '\frac{}{}'"}, {
    -- t("\\frac{"),
    -- i(1),  -- insert node 1
    -- t("}{"),
    -- i(2),  -- insert node 2
    -- t("}")
-- }),
-- s({trig="eq", dscr="A LaTeX equation environment"},
    -- fmt( -- The snippet code actually looks like the equation environment it produces.
        -- [[
            -- \begin{equation}
                -- <>
            -- \end{equation}
        -- ]],
        -- { i(1) }, -- The insert node is placed in the <> angle brackets
        -- { delimiters = "<>" } -- This is where I specify that angle brackets are used as node positions.
    -- )
-- ),
-- s({trig="tt", dscr="Expands 'tt' into '\texttt{}'"},
  -- fmta(
    -- "\\texttt{<>}",
    -- { i(1) }
  -- )
-- ),
-- -- \frac
-- s({trig="ff", dscr="Expands 'ff' into '\frac{}{}'"},
  -- fmt(
    -- "\\frac{<>}{<>}",
    -- {
      -- i(1),
      -- i(2)
    -- },
    -- {delimiters = "<>"} -- manually specifying angle bracket delimiters
  -- )
-- ),
-- -- Equation
-- s({trig="eq", dscr="Expands 'eq' into an equation environment"},
  -- fmta(
     -- [[
       -- \begin{equation*}
           -- <>
       -- \end{equation*}
     -- ]],
     -- { i(1) }
  -- )
-- ),
-- s({trig="env", snippetType="autosnippet"},
  -- fmta(
    -- [[
      -- \begin{<>}
          -- <>
      -- \end{<>}
    -- ]],
    -- {
      -- i(1, "url"), -- placeholder
      -- i(0), -- exit node
      -- rep(1),  -- this node repeats insert node i(1)
    -- }
  -- )
-- ),
