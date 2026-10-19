return {
    "mikesmithgh/kitty-scrollback.nvim",
    version = "v9.3.1",
    lazy = true,
    cmd = {
        "KittyScrollbackGenerateKittens",
        "KittyScrollbackCheckHealth",
        "KittyScrollbackGenerateCommandLineEditing",
    },
    event = "User KittyScrollbackLaunch",
    opts = {},
}
