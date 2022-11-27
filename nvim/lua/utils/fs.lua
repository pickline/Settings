local M = {}

-- 基于~/.vim/lua 为base路径的path遍历
-- 配置文件必须是init.lua
function M.scandir(path) 
    local config_path = string.sub(vim.env.MYVIMRC, 0, -10)
    path = vim.fs.normalize(string.format('%s/lua/%s', config_path, path))
    local dir = vim.loop.fs_scandir(path)
    if not dir then
        return function() 
            return
        end
    end
    return function()
        local name, type = vim.loop.fs_scandir_next(dir)
        return name, type
    end
end

return M
