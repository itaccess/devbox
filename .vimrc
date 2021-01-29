" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocp
" call pathogen#infect()
"

if empty(glob('~/.vim/autoload/plug.vim'))
  !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" vim-plug setup
call plug#begin('~/.vim/plugged')

Plug 'terryma/vim-smooth-scroll'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
" " Plug 'mustache/vim-mustache-handlebars'
" Plug 'jaawerth/nrun.vim'
" " Plug 'moll/vim-bbye'
" " Plug 'rizzatti/dash.vim'
" " Plug 'rizzatti/funcoo.vim'
" Plug 'scrooloose/nerdtree'
" Plug 'w0rp/ale'
" Plug 'tomtom/tlib_vim'
" Plug 'MarcWeber/vim-addon-mw-utils'
" " Plug 'kchmck/vim-coffee-script'
" " Plug 'altercation/vim-colors-solarized'
" Plug 'tpope/vim-commentary'
" " Plug 'tpope/vim-fugitive'
" Plug 'airblade/vim-gitgutter'
" Plug 'nathanaelkane/vim-indent-guides'
" Plug 'pangloss/vim-javascript'
" Plug 'jelera/vim-javascript-syntax'
" Plug 'plasticboy/vim-markdown'
" Plug 'tpope/vim-repeat'
" Plug 'tpope/vim-sensible'
" Plug 'garbas/vim-snipmate'
" Plug 'tpope/vim-surround'
" Plug 'tpope/vim-unimpaired'
" Plug 'nelstrom/vim-visual-star-search'
" Plug 'jimenezrick/vimerl'
" Plug 'bling/vim-airline'
" Plug 'othree/javascript-libraries-syntax.vim'
" Plug 'glanotte/vim-jasmine'
" Plug 'honza/vim-snippets'
" Plug 'bahmutov/code-snippets'
" Plug 'rstacruz/sparkup'
" Plug 'mxw/vim-jsx'
" Plug 'ctrlpvim/ctrlp.vim'
" Plug 'edkolev/tmuxline.vim'
" Plug 'vim-airline/vim-airline-themes'
" Plug 'tmux-plugins/tpm'
" Plug 'tmux-plugins/tmux-continuum'
" Plug 'tmux-plugins/tmux-resurrect'
" Plug 'tmux-plugins/tmux-sensible'
" Plug 'mhinz/vim-grepper'
" Plug 'Shougo/vimproc.vim'
" Plug 'flowtype/vim-flow'
" Plug 'hail2u/vim-css3-syntax'
" Plug 'chriskempson/base16-vim'
" Plug 'flazz/vim-colorschemes'

" Initialize plugin system
call plug#end()

" silent! source /root/my-zsh/.vimrc.custom
