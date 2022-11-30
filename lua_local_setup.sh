#!/bin/bash

<< COMMENT
	Make config folder
COMMENT
if [ ! -d "$HOME/.config" ]; then
   mkdir $HOME/.config
fi

<< COMMENT
	Copy Setting file
COMMENT
if [ -d "$HOME/.config/nvim" ];then
	cp init.lua $HOME/.config/nvim/
   cp -r lua $HOME/.config/nvim/
else
   mkdir -p $HOME/.config/nvim
	cp init.lua $HOME/.config/nvim/
   cp -r lua $HOME/.config/nvim/
fi
