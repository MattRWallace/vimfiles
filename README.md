My vim configuration.

First, clone this repository into your ~/.vim:

    $ git clone https://github.com/MattRWallace/vimfiles.git ~/.vim

The whole setup relies on the vundle plugin which installs and updates all your plugins, including itself.
Vundle must originally be installed using git:

    $ git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

The next required step is to link .vimrc from your home folder to the .vimrc inside this .vim file:

    $ ln -s ~/.vim/.vimrc ~/.vimrc

Finally you can install the bundles:

    $ vim +BundleInstall +qall

This command can be invoked anytime you wish to check for updates to any of the plugins.
