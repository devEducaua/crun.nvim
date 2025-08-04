# Crun.nvim
Compile and run everything with a simple keybinding.

## Install
```lua
{
    "devEducaua/crun.nvim",
    config = function()
        require("crun").setup()
    end
}
```

## Options
&f -> is the file name
%o -> is the output name

### defaults

```lua
require("crun").setup({
    show_command = false, -- show what command is used
    commands = { -- what the compilation/run command
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
        javascript =  "node &f",
        typescript =  "bun &f",
        html = "bun %f",
        sass = "sass &f"
    }
})
```

## integretion
Simple integretion with other plugins.
example with Oil.nvim

```lua
["<space>b"] = {  -- B for Build
    desc = "compile",
    callback = function ()
        local name = require("oil").get_cursor_entry().name
        vim.cmd(":Crun " .. name)
    end
},
```
