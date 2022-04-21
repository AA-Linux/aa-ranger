#!/usr/bin/env bash

RANGERDIR="$HOME"/.config/ranger

install_ranger() {
    if [[ `whereis ranger` ]] && [[ `whereis ueberzug` ]]; then
        echo -e "\e[0;32m+---Backup your Ranger Conf---+\e[0m\n"
        if [[ `ls ~/.config/ranger` ]]; then
            mv ~/.config/ranger  ~/.config/RANGER.BAK
            mkdir -p ~/.config/ranger
        fi
        echo -e "\e[0;32m Copy files for .config\e[0m"
        cp -r `pwd`/files/*  "$RANGERDIR"
        echo -e "\n\e[0;32m+----------Finished!----------+\e[0m"
    else
        echo -e "\e[0;32m+---Install Ranger & ueberzug---+\e[0m"
        sudo pacman -S ranger
        sudo pip install ueberzug
        mkdir -p "$RANGERDIR"
        echo -e "\e[0;32m Copy files for .config\e[0m"
        cp -r `pwd`/files/*  "$RANGERDIR"
        echo -e "\n\e[0;32m+------------Finised!-----------+\e[0m"
    fi
}
install_ranger
