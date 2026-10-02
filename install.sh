#!/bin/bash
# ~/dotfiles/install.sh —— 把 dotfiles 铺到该去的位置
set -euo pipefail

DOTFILES="$HOME/dotfiles"

# 先备份已有配置，避免误覆盖
for f in .bashrc .tmux.conf .gitconfig; do
    if [ -e "$HOME/$f" ] && [ ! -L "$HOME/$f" ]; then
        mv "$HOME/$f" "$HOME/$f.bak"
        echo "备份 $f → $f.bak"
    fi
done

# 建立符号链接
ln -sf "$DOTFILES/bashrc"     "$HOME/.bashrc"
ln -sf "$DOTFILES/tmux.conf"  "$HOME/.tmux.conf"
ln -sf "$DOTFILES/gitconfig"  "$HOME/.gitconfig"

echo "完成。重新打开终端或 source ~/.bashrc 生效。"