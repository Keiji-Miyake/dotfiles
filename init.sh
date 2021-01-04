#!bin/sh

IGNORE_PATTERN="^\.(git|travis)"

echo "Create dotfile links."
for dotfile in .??*; do
	[[ $dotfile =~ $IGNORE_PATTERN ]] && continue
	ln -snfv "$(pwd)/$dotfile" "$HOME/$dotfile"
done
echo $(tput setaf 2)Deploy dotfiles complete!. ✔︎$(tput sgr0)

echo "Vim settings"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
