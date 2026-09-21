function Link(el)
  if string.match(el.target, '^https?://') then
    el.attributes["target"] = "_blank"
    el.attributes["rel"] = "noopener noreferrer"
  end
  return el
end
