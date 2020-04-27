" This must be first, because it changes other options as a side effect.
set nocp

" Auto load plugins
if empty(glob('~/.vim/autoload/plug.vim'))
  !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" vim-plug setup
call plug#begin('~/.vim/plugged')

Plug 'joshdick/onedark.vim'

" Initialize plugin system
call plug#end()

syntax on
colorscheme onedark

silent! source /root/my-zsh/.vimrc.custom
