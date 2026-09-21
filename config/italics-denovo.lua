return {
  Inlines = function (inlines)
    local out = {}
    local i = 1
    while i <= #inlines do
      local el = inlines[i]
      if el.t == "Str" and el.text:lower() == "de" then
        -- check: next is Space, then "novo"
        if i+2 <= #inlines
           and inlines[i+1].t == "Space"
           and inlines[i+2].t == "Str"
           and inlines[i+2].text:lower() == "novo" then
          -- replace with emphasized "de novo"
          table.insert(out, pandoc.Emph{
            pandoc.Str("de"), pandoc.Space(), pandoc.Str("novo")
          })
          i = i + 3 -- skip the next two
        else
          table.insert(out, el)
          i = i + 1
        end
      else
        table.insert(out, el)
        i = i + 1
      end
    end
    return out
  end
}