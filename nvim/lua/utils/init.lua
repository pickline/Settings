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

local function _copy(t)
    local result = {}
    
    for k, v in pairs(t) do
        if type(v) == "table" then
            result[k] = _copy(v)
        else
            result[k] = v
        end
    end
    return result
end
table.copy = _copy

-- 返回新的table
-- src 的同名key 会覆盖dsk的同名key
local function _merge(dst, src)
    dst = dst or {}
    src = src or {}
    local result = table.copy(dst)

    for k, v in pairs(src) do
        local dstValue = result[k]
        if dstValue and type(dstValue) == "table" and type(v) == "table" then
            result[k] = _merge(dstValue, v)
        else
            result[k] = v
        end
    end
    return result
end
table.merge = _merge
