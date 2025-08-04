local M = {}

local api = vim.api

M.config = {
    show_command = false,
    commands = {
        c = "gcc &f -o &o",
        cpp = "g++ &f -o &o",
        haskell = "ghc &f -o &o",
        kotlin = "kotlinc &f -include-runtime -d &o.jar",
        python = "python3 &f",
        lua = "lua &f",
        php = "php &f",
        rust = "rustc &f",
        go = "go run &f",
        elixir = "elixir &f",
        java = "javac &f",
        markdown = "glow &f",
        executable = "./&f",
        bash = "bash &f",
        fish = "fish &f",
        javascript = "node &f",
        typescript = "bun &f",
        html = "bun &f",
        sass = "sass &f"
    }
}

M.setup = function (opts)
    api.nvim_create_user_command("Comprun", M.run, { nargs = "*" })

    M.config = vim.tbl_deep_extend("force", M.config, opts or {})
end

M.run = function (d)
    local args = d.fargs

    local file = args[1]

    local ext = file:match("%.[^%.]+$")

    file = M.get_path(file)

    local cmd = M.get_command(ext, file)

    if M.config.show_command then
        print(cmd)
    end

    if (cmd == "") then
        print("Unknown Format of ", file)
        return
    else
        M.exec(cmd)
    end
end

M.get_command = function (ext, file)
    local cmd = ""

    if (ext == nil and file == nil) then
        print("please pass the file")
    end

    -- Executable
    if (ext == '.o' or ext == nil) then
        local wfile = string.gsub(M.config.commands.executable, "&f", file)
        cmd = wfile

    -- Bash
    elseif (ext == ".sh") then
        local wfile = string.gsub(M.config.commands.bash, "&f", file)
        cmd = wfile

    -- Fish
    elseif (ext == ".fish") then
        local wfile = string.gsub(M.config.commands.fish, "&f", file)
        cmd = wfile

    -- C
    elseif (ext == '.c') then
        local wfile = string.gsub(M.config.commands.c, "&f", file)
        local out = string.gsub(wfile, "&o", string.gsub(file, ext, ""))

        cmd = out

    -- C++
    elseif (ext == '.cpp') then
        local wfile = string.gsub(M.config.commands.cpp, "&f", file)
        local out = string.gsub(wfile, "&o", string.gsub(file, ext, ""))

        cmd = out

    -- Haskell
    elseif (ext == '.hs') then
        local wfile = string.gsub(M.config.commands.haskell, "&f", file)
        local out = string.gsub(wfile, "&o", string.gsub(file, ext, ""))

        cmd = out

    -- Kotlin
    elseif (ext == '.kt') then
        local wfile = string.gsub(M.config.commands.kotlin, "&f", file)
        local out = string.gsub(wfile, "&o", string.gsub(file, ext, ""))

        cmd = out

    -- Python
    elseif (ext == '.py') then
        local getf = string.gsub(M.config.commands.python, "&f", file)
        cmd = getf

    -- Lua
    elseif (ext == '.lua') then
        local wfile = string.gsub(M.config.commands.lua, "&f", file)
        cmd = wfile

    -- Php
    elseif (ext == '.php') then
        local wfile = string.gsub(M.config.commands.php, "&f", file)
        cmd = wfile

    -- Rust
    elseif (ext == '.rs') then
        local wfile = string.gsub(M.config.commands.rust, "&f", file)
        cmd = wfile

    -- Go
    elseif (ext == '.go') then
        local wfile = string.gsub(M.config.commands.go, "&f", file)
        cmd = wfile

    -- Elixir
    elseif (ext == ".exs") then
        local wfile = string.gsub(M.config.commands.elixir, "&f", file)
        cmd = wfile

    -- Java
    elseif (ext == '.java') then
        local wfile = string.gsub(M.config.commands.java, "&f", file)
        cmd = wfile
        --
    -- Javascript
    elseif (ext == '.js') then
        local wfile = string.gsub(M.config.commands.javascript, "&f", file)
        cmd = wfile
        --
    -- Typescript
    elseif (ext == '.ts') then
        local wfile = string.gsub(M.config.commands.typescript, "&f", file)
        cmd = wfile

    elseif (ext == '.md') then
        local wfile = string.gsub(M.config.commands.markdown, "&f", file)
        cmd = wfile

    elseif (ext == '.html') then
        local wfile = string.gsub(M.config.commands.html, "&f", file)
        cmd = wfile

    elseif (ext == ".scss" or ext == ".sass") then
        local wfile = string.gsub(M.config.commands.html, "&f", file)
        cmd = wfile

    else
        cmd = ""
    end

    return cmd
end

M.get_path = function (file)
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
