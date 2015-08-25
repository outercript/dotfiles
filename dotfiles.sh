#!/bin/sh

# List of files or links to create as links
links_list='.vim* .bash* .csh* .X* .gitignore'
dotfiles_DESTDIR=$HOME

dotfiles_create_symlinks() {
  local items=$@
  echo "Setting up symlinks"

  for filename in $items; do
    local srcfile=`readlink -f "$filename"`
    local dstfile=$dotfiles_DESTDIR/$filename

    # Links exists, nothing to do
    if [ -L "$dstfile" ]; then
      echo "  Skipping ${filename}... Is already a link"
      continue
    fi

    # Existing file, create a copy
    if [ -e "$dstfile" ]; then
      echo "  ${filename} exist... Moving to ${filename}.old"
      mv "$dstfile" "$dstfile".old
    fi

    # Create the link
    echo "  $srcfile >> $dstfile"
    ln -s "$srcfile" "$dstfile"

  done
}


dotfiles_remove_symlinks() {
  local items=$@
  echo "Removing symlinks"

  for filename in $items; do
    local linkfile=$dotfiles_DESTDIR/$filename

    if [ ! -L "$linkfile" ]; then
      echo "  Skipping ${filename}... Not a link"
      continue
    fi

    echo "  Removing $linkfile"
    unlink "$linkfile"

    if [ -e "$linkfile".old ]; then
      echo "  Restoring backup of $filename"
      mv "$linkfile".old "$linkfile"
    fi

  done
}


dotfiles_vundle() {
  local vundle_dir=$dotfiles_DESTDIR/.vim/bundle/Vundle.vim
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


# dotfiles_fonts: Install custom fonts to the system
dotfiles_fonts(){
  local fonts_dir=".fonts"
  dotfiles_create_symlinks $fonts_dir
  fc-cache -vf $dotfiles_DESTDIR/$fonts_dir &2> /dev/null
}


dotfiles_setup(){
  dotfiles_create_symlinks $links_list
  dotfiles_fonts
}


dotfiles_cleanup(){
  dotfiles_remove_symlinks $links_list
}


dotfiles_main(){
  local action=$1

  if [ "$action" = setup ]; then
    dotfiles_setup
  elif [ "$action" = vundle ]; then
    dotfiles_vundle
  elif [ "$action" = cleanup ]; then
    dotfiles_cleanup
  else
    echo "Usage: $0 <setup|cleanup>"
    [ -n "$action" ] && echo "Invalid option: ${action}"
  fi
}


dotfiles_main $@


# Cleanup:
# Remove the all the definitions in this file including font creation
unset links_list
dotfiles_functions=$(declare -F | awk '/dotfiles_/ { print $3;}')
for item in $dotfiles_functions; do
  unset $item
done
unset dotfiles_functions
