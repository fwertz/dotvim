#! /bin/bash

# Link dotvim to actual home directory and change dir to it
ln -s $(pwd) ~/.vim
cd !$

# Static link rc files to home dir
ln -s $(pwd)/vimrc ~/.vimrc
ln -s $(pwd)/gvimrc ~/.gvimrc

# Initiatilize && update all the things!
git submodule init
git submodule update
