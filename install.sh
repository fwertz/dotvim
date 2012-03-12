#! /bin/bash

# Static link rc files to home dir
ln -s $(pwd)/vimrc ~/.vimrc
ln -s $(pwd)/gvimrc ~/.gvimrc

# Initiatilize && update all the things!
git submodule init
git submodule update





