#!/bin/sh

# List of files or links to create as links
links_list='.vim* .bash* .csh* .X* .gitignore'

dotfiles_create_symlinks() {
  echo "Setting up symlinks"

  for filename in $links_list; do
    local srcfile=`readlink -f "$filename"`
    local dstfile=$HOME/$filename

    if [ -L "$dstfile" ]; then
      echo "  Skipping ${filename}... Is already a link"
      continue
    fi

    if [ -e "$dstfile" ]; then
      echo "  ${filename} exist... Creating a backup"
      mv "$dstfile" "$dstfile".old
    fi

    echo "  $srcfile >> $dstfile"
    ln -s "$srcfile" "$dstfile"

  done
}


dotfiles_remove_symlinks() {
  echo "Removing symlinks"

  for filename in $links_list; do
    local linkfile=$HOME/$filename

    if [ ! -L "$linkfile" ]; then
      echo "  Skipping ${filename}... Not a link"
      continue
    fi

    echo "  Removing ${linkfile}"
    unlink "$linkfile"

    if [ -e "$linkfile".old ]; then
      echo "  Restoring backup of ${filename}"
      mv "$linkfile".old "$linkfile"
    fi

  done
}


dotfiles_setup_vundle() {
  local vundle_dir=$HOME/.vim/bundle/Vundle.vim
  echo "Setting up VIM plugin manager"

  if [ -d "$vundle_dir" ]; then
    if [ -d "$vundle_dir"/.git ]; then
      echo "  Vundle looks alright, if not remove it and try again"
      return
    fi

    echo "  Removing dead Vundle directory"
    rm -rf "$vundle_dir"
  fi

  echo "  Initializing Vundle"
  git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
}


dotfiles_main(){
  local action=$1

  if [ "$action" = setup ]; then
    dotfiles_create_symlinks
    dotfiles_setup_vundle
  elif [ "$action" = cleanup ]; then
    dotfiles_remove_symlinks
  else
    echo "Usage: $0 <setup|cleanup>"
    [ -n "$action" ] && echo "Invalid option: ${action}"
  fi
}


dotfiles_main $@


# Cleanup
unset links_list
unset dotfiles_create_symlinks
unset dotfiles_remove_symlinks
unset dotfiles_setup_vundle
unset dotfiles_main
