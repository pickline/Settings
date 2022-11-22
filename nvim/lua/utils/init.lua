_G.dump = function(...)
  print(vim.inspect(...))
end

_G.prequire = function(...)
  local status, lib = pcall(prequire, ...)
  if status then
    return lib
  end
  return nil
end

