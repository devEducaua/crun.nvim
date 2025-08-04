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
&o -> is the output name

### defaults

```lua
require("crun").setup({
    show_command = false, -- show what command is used
    commands = { -- what the compilation/run command
        c = "gcc &f -o &o", -- &f for the file and &o for the output
        python = "python3 &f",
        lua = "lua &f",
        rust = "rustc &f",
        elixir = "elixir &f",
        markdown = "glow &f",
        javascript =  "node &f",
        -- More on :help Crun
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
