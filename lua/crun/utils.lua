local M = {}

M.get_oil_path = function (file)
    local dir = require("oil").get_current_dir(vim.api.nvim_get_current_buf())
    local temp_path = dir .. "/" .. file
    local full_path = string.gsub(temp_path, "//", "/")

    local pwd = vim.fn.getcwd()
    local local_path = string.gsub(full_path, pwd .. "/", "")

    return local_path
end

M.exec = function (args)
    local c = 'term'

    vim.cmd("new")
    vim.cmd("wincmd J")

    if args then
        c = c .. ' ' .. args
    end

    vim.cmd(c)
end

return M
