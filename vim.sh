#!/usr/bin/sh
cd $HOME/repos/vim/src

make distclean

./configure --prefix=/opt/ \
            --with-features=huge \
            --enable-largefile \
            --enable-multibyte \
            --enable-rubyinterp \
            --enable-pythoninterp \
            --with-python-config-dir=/usr/lib/python2.3/config \
            --enable-perlinterp \
            --enable-luainterp \
            --enable-gui=no \
            --enable-cscope \
            --with-x=yes \
            --with-compiledby=osuro

make
make install
