#!/bin/bash

# Путь к папке с дотфайлами (где лежит сам скрипт)
DOTFILES_DIR=$(pwd)

echo "--- Начинаю установку конфигов ---"

# Список папок в .config, которые нужно скопировать
CONFIG_FOLDERS=("hypr" "waybar" "kitty" "fuzzel" "dunst" "nvim" "gtk-3.0" "gtk-4.0")

# 1. Работаем с .config
mkdir -p ~/.config

for folder in "${CONFIG_FOLDERS[@]}"; do
    if [ -d "$DOTFILES_DIR/.config/$folder" ]; then
        # Если папка уже есть в системе, делаем бэкап
        if [ -d "$HOME/.config/$folder" ]; then
            echo "Бэкап существующей папки $folder в $folder.bak"
            rm -rf "$HOME/.config/$folder.bak"
            mv "$HOME/.config/$folder" "$HOME/.config/$folder.bak"
        fi
        echo "Установка конфига: $folder"
        cp -r "$DOTFILES_DIR/.config/$folder" "$HOME/.config/"
    fi
done

# 2. Работаем с Zsh
if [ -f "$DOTFILES_DIR/.zshrc" ]; then
    if [ -f "$HOME/.zshrc" ]; then
        echo "Бэкап .zshrc в .zshrc.bak"
        mv "$HOME/.zshrc" "$HOME/.zshrc.bak"
    fi
    echo "Установка .zshrc"
    cp "$DOTFILES_DIR/.zshrc" "$HOME/"
fi

# 3. Работаем с курсорами
mkdir -p ~/.icons/default
if [ -f "$DOTFILES_DIR/.icons/default/index.theme" ]; then
    echo "Установка темы курсора"
    cp "$DOTFILES_DIR/.icons/default/index.theme" "$HOME/.icons/default/"
fi

echo "--- Установка завершена! ---"
echo "Не забудь установить программы из packages.txt, если ты на новой системе."
