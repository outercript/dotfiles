#!/usr/bin/sh
pushd $HOME/repos/vim/src

make distclean

./configure --prefix=$HOME/opt/ \
            --with-features=huge \
            --enable-terminal \
            --enable-cscope \
            --enable-largefile \
            --enable-multibyte \
            --enable-rubyinterp \
            --enable-perlinterp \
            --enable-luainterp \
            --enable-pythoninterp \
            --with-python-config-dir=/usr/lib/python2.7/config \
            --enable-gui=yes \
            --with-x=yes \
            --with-compiledby=osuro

make
make install

popd
