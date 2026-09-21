-- hide-by-callout-title.lua
local stringify = (require "pandoc.utils").stringify

return {
  -- Quarto custom callout node (Quarto 1.3+)
  Callout = function(callout)
    if callout.title then
      local t = stringify(callout.title):lower()
      if t == "answer" or t == "code example" then
        return {}   -- drop the callout
      end
    end
    return callout
  end,

  -- Fallback for older/plain Pandoc Div-based callouts
  Div = function(el)
    -- 1) check title attribute (e.g. title="Code example")
    if el.attributes and el.attributes.title then
      local t = tostring(el.attributes.title):lower()
      if t == "answer" or t == "code example" then
        return {}
      end
    end

    -- 2) check whether first child is a Header used as the callout title
    if el.content and #el.content > 0 and el.content[1].t == "Header" then
      local t = stringify(el.content[1]):lower()
      if t == "answer" or t == "code example" then
        return {}
      end
    end

    return el
  end
}
