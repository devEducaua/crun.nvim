local M = {}

local api = vim.api
local utils = require("crun.utils")
local commands = require("crun.commands")
local config = require("crun.config").config

M.setup = function (opts)
    api.nvim_create_user_command("Crun", M.run, { nargs = "*" })

    M.config = vim.tbl_deep_extend("force", config, opts or {})
end

M.run = function (d)
    local args = d.fargs
    local file = args[1]

    local ext = file:match("%.[^%.]+$")

    file = utils.get_path(file)

    local cmd = commands.get_command(ext, file)

    if config.show_command then
        print(cmd)
    end

    if (cmd == "") then
        vim.notify("Unknown file format of " .. file, vim.log.levels.ERROR)
        return
    else
        utils.exec(cmd)
    end
end

return M
