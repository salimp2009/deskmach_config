#!/bin/bash

# this is for compatibility with lvim 1.2
# removing /parser /queries is not needed; delete those lines
# this is to update the master ; but will work for other branches if
# you checkout the branch you want to install;
# need to remove the previous version if it is different
# see https://github.com/neovim/neovim/wiki/Building-Neovim

echo "updating neovim !!"

cd $HOME/repos/neovim/
git pull
sudo make clean
sudo make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install

# check if you need to wait for the above steps to finish for this to run
echo "removing /queries and /parser folder lvim 1.2 compatibility!"
rm /usr/local/share/nvim/runtime/queries/*.*
rm /usr/local/lib/nvim/parser/*.*
