# 本机 Neovim 配置

适配 Neovim 0.11.3，保留 Tokyo Night Moon 主题、四空格缩进、`jk` 退出插入模式和原有主要快捷键。

## 日常操作

`Leader` 是空格。按下空格并稍等会出现快捷键提示。

| 按键 | 功能 |
| --- | --- |
| 空格 空格 | 查找文件（含隐藏文件，排除 .git，遵守 gitignore） |
| 空格 f | 项目全文搜索 |
| 空格 sb / sr | 缓冲区 / 最近文件 |
| 空格 sw / ss | 搜索当前单词 / 当前文件 |
| 空格 sR | 项目搜索替换，使用 GrugFar 预览后执行 |
| 空格 t / e | 切换文件树 / 定位当前文件 |
| 空格 w / q | 保存 / 关闭当前缓冲区 |
| 空格 bn / bp / bo / bh | 下一缓冲区 / 上一缓冲区 / 关闭其他 / 选择 |
| Ctrl-h/j/k/l | 切换窗口 |
| 空格 sv / sh | 左右 / 上下分屏 |
| gd / gr / K | 定义 / 引用 / 文档（LSP 连接后） |
| 空格 lr / lc | 重命名 / 代码操作 |
| 空格 ln / lp / le / lq | 下一诊断 / 上一诊断 / 诊断详情 / 诊断列表 |
| 空格 lF | 手动 LSP 格式化，要求语言服务器支持 |
| ]h / [h | 下一个 / 上一个 Git 修改块 |
| 空格 gp / gb / gd | 预览修改 / 当前行来源 / Git 对比 |
| 空格 gD / gs | Diffview 项目差异 / 已暂存差异 |
| 空格 gh / gH / gq | 当前文件历史 / 项目历史 / 关闭 Diffview |
| 空格 ? / sk | 查看快捷键 / 搜索快捷键 |

启用持久撤销、恢复上次光标位置、复制高亮和窗口重获焦点时检查外部文件修改。诊断在退出插入模式后更新。格式化由快捷键手动触发。

## 查看 Git 差异

在 Git 项目中按 `空格 gD` 打开 Diffview，左侧列出修改文件，右侧并排显示差异；`D` 为大写（Shift-d）。原有 `空格 gd` 保留 Gitsigns 当前文件对比。

- 文件面板中用 `j/k` 选择、回车打开；`Tab` / `Shift-Tab` 切换下一个 / 上一个文件。
- 差异窗口中用 `]c` / `[c` 跳转下一个 / 上一个差异块，`Ctrl-h/j/k/l` 切换窗口。
- `空格 gq` 关闭差异或历史视图，返回之前的编辑页。
- `:DiffviewOpen HEAD` 查看相对最近提交的全部改动；`:DiffviewOpen origin/main...HEAD` 查看当前分支相对 main 分叉点的提交差异（主分支为 master 时替换名称）。
- 查看前先保存文件；Diffview 根据磁盘和 Git 状态展示差异。

更多用法见 `:help diffview.nvim` 或 [Diffview 官方文档](https://github.com/sindrets/diffview.nvim)。

## 语言与插件

Mason 管理 Lua、Python、Kotlin、HTML、CSS、TypeScript/JavaScript、Emmet 服务；使用 Neovim 0.11 的 `vim.lsp.config` 接口。Kotlin 还需要可用的 Java 环境，Node 类服务器需要 Node.js。

- `:Mason`：语言服务器安装状态。
- `:checkhealth vim.lsp`：检查 LSP，`:LspLog` 查看日志。
- `:Lazy`：管理插件；`lazy-lock.json` 记录验证过的版本，`:Lazy restore` 恢复锁定版本。
- `:checkhealth telescope`：检查搜索依赖。全文搜索和文件搜索需要 `rg`；fzf 加速需要 `make` 与 C 编译器，加载失败时使用默认排序。
- `:checkhealth which-key`：检查快捷键。

LSP 依赖固定为 Mason 2.0.1、mason-lspconfig 2.0.0、nvim-lspconfig 2.4.0；Blink 保留 0.14.2。升级这些版本前先核对 Neovim 版本要求。nvim-lspconfig 2.4.0 的最低要求是 0.11.3，参见[官方说明](https://github.com/neovim/nvim-lspconfig/tree/v2.4.0)。

## 代理与 Neovide

默认继承启动进程的代理环境变量。需要原来的本机代理时：

```sh
NVIM_PROXY=http://127.0.0.1:7890 nvim
```

Neovide 设置只在 Neovide 中启用，沿用 JetBrainsMono Nerd Font、透明度和光标效果。标题栏颜色随主题更新；终端模式不设置 GUI 字体。

## 配置布局

- `lua/core/`：基础选项、快捷键、自动命令、Neovide、插件管理器。
- `lua/plugins/`：按插件拆分的配置。
- `lazy-lock.json`：插件锁定版本，应随配置一同保存。
