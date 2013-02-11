Instructions
============

How to install
--------------

Clone the repository to your local machine:

	git clone git@github.com:kniren/vim.git .vim

Add the necesary symlinks:

	ln -s .vim/vimrc .vimrc

Switch to the `~/.vim` directory and fetch the submodules:

    cd ~/.vim
    git submodule init
    git submodule update

How to add new bundles
----------------------

From the root of the vim repository:

    git submodule add [url] bundle/*plugin*
