#!/bin/bash

set -u

DOT_DIR=$(cd $(dirname $0); pwd)

cd ${DOT_DIR}
git submodule init
git submodule update

echo "Setup dot links..."
for f in .??*
do
    [[ "$f" = ".DS_Store" ]] && continue
    [[ "$f" = ".git" ]] && continue
    [[ "$f" = ".gitignore" ]] && continue
    [[ "$f" = ".gitmodules" ]] && continue
    if [[ -f $f ]]; then
        ln -snfv ${DOT_DIR}/${f} ${HOME}/${f}
    elif [[ -d $f ]]; then
        rm -rf ${HOME}/${f}
        ln -snfv ${DOT_DIR}/${f} ${HOME}/${f}
    fi
done
echo "Deploy dotfiles complete!."
