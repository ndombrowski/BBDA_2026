-- rename-when-hiding.lua
local path = require("pandoc.path")
local utils = require("pandoc.utils")

function Meta(meta)
  -- 1. Determine a safe base filename
  local base = "document" -- default fallback

  -- Prefer the input filename
  if PANDOC_STATE.input_files and #PANDOC_STATE.input_files > 0 then
    base = PANDOC_STATE.input_files[1] or base
  end

  -- If output_file exists, prefer that
  if PANDOC_STATE.output_file and type(PANDOC_STATE.output_file) == "string" then
    base = PANDOC_STATE.output_file
  end

  -- Split directory and filename safely
  local dir, fname = path.split(base or "document")
  local name, ext = path.split_extension(fname or "document.html")
  name = name .. "-noanswers"
  ext = ext or ".html"

  -- Recombine
  meta["output-file"] = path.join(dir, name .. ext)

  return meta
end
