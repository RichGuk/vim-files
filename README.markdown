My vim configuration files; plugins, syntax highlights, etc... Having them on github make it easier for me to install on new machines, or keep update-to-date between my machines.

# I'd like to try it, but how?

Clone this repo into your home directory and initialise the snippets submodule.

    cd ~
    git clone http://github.com/RichGuk/vim-files.git .vim
    cd ~/.vim
    git submodule init
    git submodule update

Then in your ~/.vimrc and ~/.gvimrc add the following lines before any personal setting:

**.vimrc**:

    source ~/.vim/vimrc
    ...

**.gvimrc**:

    source ~/.vim/gvimrc
    ...
