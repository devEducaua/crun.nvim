return {
    c = "gcc &f -o &o",
    cpp = "g++ &f -o &o",
    haskell = "ghc &f -o &o",
    rust = "rustc &f",

    kotlin = "kotlinc &f -include-runtime -d &o.jar",
    java = "javac &f",

    python = "python3 &f",
    lua = "lua &f",
    php = "php &f",
    go = "go run &f",
    elixir = "elixir &f",
    bash = "bash &f",
    fish = "fish &f",
    javascript = "node &f",
    typescript = "tsc &f",
    sass = "sass &f",
    ruby = "ruby &f",
    perl = "perl &f",

    executable = "./&f",
    html = "bun &f",
    markdown = "glow &f",
}
