return {
    "saghen/blink.cmp",
    -- version 不设置会报错，并且设置 version 后他还需要额外下载一些东西
    version = "*",
    dependencies = {
        -- 代码模板，例如 IDEA 中输入 main 并回车，就会自动生成 `public static void main ...`
        "rafamadriz/friendly-snippets",
    },
    event = "VeryLazy",
    opts = {
        -- 代码补全时，对当前选择的补全项，右侧会自动显示帮助文档
        completion = {
            documentation = {
                auto_show = true
            }
        },
        -- 设置补全时使用的快捷键，这里配置为按下回车补全完整
        keymap = {
            preset = "enter"
        },
        -- 设置补全内容的来源
        -- path: 输入路径时进行补全
        -- snippets: 片段补全
        -- buffer: 根据 buffer 中的文字内容补全
        -- lsp: 基于语言服务器返回的内容进行补全
        sources = {
            default = { "path", "snippets", "buffer", "lsp" }
        },
        -- 命令模式的补全
        cmdline = {
            sources = function ()
                -- 获取命令类型是 ":xxx" 还是 "/xxx"
                local cmd_type = vim.fn.getcmdtype()
                -- 针对于 "/xxx" 情况，对当前 buffer 中的文本内容进行补全
                if cmd_type == "/" then
                    return { "buffer" }
                end
                -- 针对于 ":xxx" 情况，对命令进行补全
                if cmd_type == ":" then
                    return { "cmdline" }
                end
                return {}
            end,
            keymap = {
                -- 按 tab 实现补全
                preset = "super-tab"
            },
            -- 命令模式补全和写代码的补全不一样，默认不会显示补全菜单，因此许哟手动设置
            completion = {
                menu = {
                    auto_show = true
                }
            }
        }
    },
}



