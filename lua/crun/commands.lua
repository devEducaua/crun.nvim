local M = {}

local config = require("crun.config").config

M.get_command = function (ext, file)
    if not file then
        vim.notify("Please pass the file", vim.log.levels.ERROR)
        return
    end

    local dict = {
        ['.o'] = config.commands.executable,
        ['nil'] = config.commands.executable,
        ['.sh'] = config.commands.sh,
        ['.fish'] = config.commands.fish,
        ['.c'] = config.commands.c,
        ['.cpp'] = config.commands.cpp,
        ['.hs'] = config.commands.haskell,
        ['.rs'] = config.commands.rust,
        ['.py'] = config.commands.python,
        ['.kt'] = config.commands.kotlin,
        ['.rb'] = config.commands.ruby,
        ['.pl'] = config.commands.perl,
        ['.lua'] = config.commands.java,
        ['.java'] = config.commands.lua,
        ['.go'] = config.commands.go,
        ['.html'] = config.commands.html,
        ['.sass'] = config.commands.sass,
        ['.scss'] = config.commands.sass,
        ['.exs'] = config.commands.elixir,
        ['.md'] = config.commands.markdown,
        ['.js'] = config.commands.javascript,
        ['.ts'] = config.commands.typescript,
        ['.php'] = config.commands.php,
    }

    local cmd = dict[ext]
    if not cmd then
        return ""
    end

    -- cmd:gsub("&f", file)
    --    :gsub("&o", file:gsub(ext, ""))

    local wfile = string.gsub(cmd, "&f", file)
    local out = string.gsub(wfile, "&o", ext)

    cmd = out

    return cmd
end

return M
