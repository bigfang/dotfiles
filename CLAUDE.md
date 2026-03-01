# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## 概述

这是一个 dotfiles 仓库，用于管理用户的个性化配置文件（Shell、Git、Vim、Tmux、Neovim、SSH 等）。

## 初始化部署

通过以下命令一键部署：
```bash
curl -fsSL https://github.com/bigfang/dotfiles/raw/master/.local/bin/dotsinit.sh | /bin/bash
```

然后在 `~/.zshrc` 中加载扩展配置：
```bash
[ -f ~/.local/etc/zshrc ] && source ~/.local/etc/zshrc
```

## 目录结构

```
~/
├── .cargo/              # Cargo 镜像源配置
├── .clojure/            # Clojure CLI 依赖配置
├── .config/             # $XDG_CONFIG_HOME
│   ├── bat/             # cat 替代品主题
│   ├── fish/
│   ├── ghostty/         # Ghostty 终端
│   ├── git/
│   ├── mise/            # mise 工具版本管理
│   ├── nvim/
│   ├── pip/
│   ├── tig/             # Git 日志查看器
│   ├── tmux/
│   ├── uv/
│   └── zed/
├── .gradle/             # Gradle 初始化脚本
├── .hex/                # Hex 包管理器配置
├── .lein/               # Leiningen profiles
├── .local/              # 用户本地文件
│   ├── bin/             # 工具脚本
│   └── etc/             # Shell 扩展配置
├── .m2/                 # Maven settings.xml
├── .ssh/                # SSH 配置
├── .bashrc
├── .bunfig.toml
├── .condarc
├── .npmrc
├── .vimrc
└── README
```

## 常用配置说明

### Shell 别名
- `ll` - `eza` 带 git 状态显示
- `lt` - 树状显示目录结构
- `ta` - 连接名为 "praha" 的 tmux 会话
- `vi` - 根据可用性选择 nvim 或 emacsclient
- `dc` - docker compose

### Git 配置
- 默认分支：`master`
- 拉取时 rebase：`pull.rebase = true`
- 冲突风格：`zdiff3`
- 常用别名：`co` (checkout), `st` (status), `lg` (彩色日志), `zz/zp` (stash)

### Ghostty 配置
- 前缀键：`Ctrl+;`
- 分屏：`\` (水平), `-` (垂直)
- 面板导航：vim 风格 `h/j/k/l`
- `Cmd` 键映射为 `Esc` 前缀（类似 Emacs Meta）

### Tmux 配置
- 前缀键：`C-j`
- 分屏：`\` (水平), `"` (垂直)
- 面板导航：vim 风格 `h/j/k/l`
- 复制模式：vi 风格，按 `y` 或 `Enter` 复制选中内容

### Vim/Neovim 配置
- leader 键：空格
- 交换 `q` 和 `%` 键
- 交换 `H/L` 和 `^/$` 键
- 交换 `j/k` 和 `gj/gk` 键
- 退格键清除搜索高亮

## 工具脚本

### .local/bin/
- `dotsinit.sh` - dotfiles 初始化部署脚本
- `swp` - macOS 系统代理切换脚本（参数：主机 端口）
- `upp` - 统一更新脚本（更新 Emacs/oh-my-zsh/homebrew/mise/bun/skills）

### .local/etc/
- `gitrc` - Git 包装脚本，使用 Homebrew git + GPG 支持，init/clone 时自动配置 user.name/email（已在 `.bashrc` 中加载）
- `skimrc` - skim (fzf 替代品) 配置及快捷函数：skf/fh/fkill/cdd/cdf/drs/drmi（已在 `.bashrc` 中加载）
- `zshrc` - Zsh 特定配置：zoxide/mise 初始化、Homebrew 镜像源
