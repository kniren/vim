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

Current submodules
------------------

Clam

    Easily run shell commands

Ctrlp

    Full path fuzzy finder

Darkmirror

    My personal colorscheme for vim

Fugitive

    Git wrapper for vim

Gundo

    Undo tree visualizer

Neocomplcache

    Better keywords completion

NerdCommenter

    Easily comment blocks of text

NerdTree

    File tree navigator

Supertab

    Using <Tab> for all types of completion

Surround

    Easily change surroundings in pairs

Syntastic

    Syntax checker

Tabular

    The mother of OCD tabularization
