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
Plug 'terryma/vim-multiple-cursors'
" Plug 'mustache/vim-mustache-handlebars'
Plug 'jaawerth/nrun.vim'
" Plug 'moll/vim-bbye'
" Plug 'rizzatti/dash.vim'
" Plug 'rizzatti/funcoo.vim'
Plug 'scrooloose/nerdtree'
Plug 'w0rp/ale'
Plug 'tomtom/tlib_vim'
Plug 'MarcWeber/vim-addon-mw-utils'
" Plug 'kchmck/vim-coffee-script'
" Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-commentary'
" Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'pangloss/vim-javascript'
Plug 'jelera/vim-javascript-syntax'
Plug 'plasticboy/vim-markdown'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'garbas/vim-snipmate'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'nelstrom/vim-visual-star-search'
Plug 'jimenezrick/vimerl'
Plug 'bling/vim-airline'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'glanotte/vim-jasmine'
Plug 'honza/vim-snippets'
Plug 'bahmutov/code-snippets'
Plug 'rstacruz/sparkup'
Plug 'mxw/vim-jsx'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'edkolev/tmuxline.vim'
Plug 'vim-airline/vim-airline-themes'
Plug 'tmux-plugins/tpm'
Plug 'tmux-plugins/tmux-continuum'
Plug 'tmux-plugins/tmux-resurrect'
Plug 'tmux-plugins/tmux-sensible'
Plug 'mhinz/vim-grepper'
Plug 'Shougo/vimproc.vim'
Plug 'flowtype/vim-flow'
Plug 'hail2u/vim-css3-syntax'
Plug 'chriskempson/base16-vim'
Plug 'flazz/vim-colorschemes'

" Initialize plugin system
call plug#end()

"turn on syntax highlighting
syntax on

"load ftplugins and indent files
filetype plugin indent on

" automatically save when changing buffer
set autowrite

" undofile set up
set undofile "Maintain undo history between sessions
set undodir=~/.vim/undodir

" no backups
set nobackup
set nowritebackup
" no swapfiles
set noswapfile

" Set MacVim font (maybe move to .gvimrc one day?)
" set guifont=Meslo\ LG\ M\ DZ\ Regular\ for\ Powerline:h14

" Set up colour scheme
" set termguicolors
" let g:airline_theme='jellybeans'
let g:airline_theme='minimalist'
" set background=dark
" colorscheme base16-default-dark
" colorscheme jellybeans
" colorscheme distinguished
" colorscheme vividchalk
" colorscheme desert
" colorscheme neverland
colorscheme ir_black
" colorscheme solarized
syntax enable

highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE

"Set up leader to comma
let mapleader=","

" My own leader mappings
nnoremap <leader>c :cclose<cr>
nnoremap <leader>l :lclose<cr>
nnoremap <leader>p :pclose<cr>
" delete the current buffer via moll/vim-bbye
nnoremap <Leader>b :Bdelete<CR>

"Set up vim-grepper
" Make ag the default tool. Open Quickfix window. Jump to first match
" for browsing the input history
" cnoremap <c-n> <down>
" cnoremap <c-p> <up>

" nmap gs <plug>(GrepperOperator)
" xmap gs <plug>(GrepperOperator)

" nnoremap <leader>g :Grepper -tool git<cr>
" nnoremap <leader>G :Grepper -tool ag<cr>
" nnoremap <leader>* :Grepper -tool ag -cword -noprompt<cr>

" let g:grepper = {
" 	\ 'tools':     ['git', 'ag', 'grep'],
" 	\ 'open':      1,
" 	\ 'jump':      1,
" 	\ 'next_tool': '<leader>g',
" 	\ }

" Set up vim-jsx plugin
let g:jsx_ext_required = 0 " allow JSX syntax in js files also.

" Set up vim-smooth-scroll
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 10, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 10, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 10, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 10, 4)<CR>
noremap <silent> <c-k> :call smooth_scroll#up(&scroll, 10, 2)<CR>
noremap <silent> <c-j> :call smooth_scroll#down(&scroll, 10, 2)<CR>

" set up airline
" let g:airline#extensions#tabline#enabled = 1 " enable airline tabline
" let g:airline#extensions#tabline#enabled = 0 " enable airline tabline
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_powerline_fonts = 1 " automatically populate the g:airline_symbols dictionary with the proper font glyphs for various symbols

"Set up javascript libraries
let g:used_javascript_libs = 'backbone,angularjs,jquery,mocha,react,flux,chai'

" Enable syntax highlighting for Flow
let g:javascript_plugin_flow = 1

"Set grep to use ack and include column number
set grepprg=ack\ --nogroup\ --column\ $*
set grepformat=%f:%l:%c:%m

" Set command line history limit
set history=1000

" Show whitespace
set list

" Show the cursor position all the time
set ruler

" Show incomplete commands at the bottom
set showcmd

" Show current mode at the bottom
set noshowmode

" Highlight search matches
set hlsearch

" Highlight search match as you type
set incsearch

" Display line numbers
set number

" Proper wrapping
set wrap linebreak

"add some line space for easy reading
set linespace=4

"disable visual bell
set visualbell t_vb=

set autoindent

" virtual tabstops using spaces
set expandtab
set shiftwidth=2
set softtabstop=2
" allow toggling between local and default mode
function! TabToggle()
  if &expandtab
    set shiftwidth=2
    set tabstop=2
    set noexpandtab
  else
    set shiftwidth=2
    set softtabstop=2
    set expandtab
  endif
endfunction
nmap <F9> mz:execute TabToggle()<CR>'z

" (TAB)Indentation settings
"set shiftwidth=4
"set tabstop=4
"set noexpandtab
"set autoindent
" (SPACE)Indentation settings
" set shiftwidth=2
" set softtabstop=2
" set expandtab
" set autoindent

" Activate TAB auto-complete for file paths
"set wildmode=list:longest
set wildmode=longest,list

" Make tab completion for files/buffers act like bash
set wildmenu

" Make searches case-sensitive only if they contain upper-case characters
set ignorecase
set smartcase


"""CTRL P Settings""""
" Ignore all version control and node_modules code
let g:ctrlp_custom_ignore = '\v[\/](\.git|\.hg|\.svn|bower_components|misc|node_modules|test-results)$'
" Ignore files in .gitignore
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

""""""""""Miscellaneous Mappings"""""""
" Escape key remap
inoremap jk <Esc>

" Toggle  highlighted search
nnoremap <F3> :set hlsearch!<CR>

" Re-enable syntax highlighting
nnoremap <F2> :set syntax=on<CR>

""""""""""NERDTree"""""
"Mao control-n for toggling NERDTre
" map <c-n> :NERDTreeToggle<CR>
map <c-e> :NERDTreeToggle<CR>

" Global Syntastic settings
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 0
"When set to 1 the error window will be automatically opened when errors are detected, and closed when none are detected.
"let g:syntastic_auto_loc_list = 0
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_error_symbol = '✗'
"let g:syntastic_warning_symbol = '⚠'
" Set up Syntastic to use eslint for javascript
" let g:syntastic_javascript_eslint_exe = 'yarn run eslint --'
"
" Set up Syntastic to use semistandard for javascript
"let g:syntastic_javascript_standard_exec = 'semistandard'
"let g:syntastic_javascript_checkers=['standard']
" autocmd bufwritepost *.js silent !semistandard % --fix
" set autoread
" Set up vim-sass-lint
"let g:syntastic_sass_checkers=["sasslint"]
"let g:syntastic_scss_checkers=["sasslint"]
"let g:sass_lint_config = '~/.sass-lint.yml'

" Global ale settings
let g:ale_sign_column_always = 1
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'
" Set ale to use semistandard for standard linter
let g:ale_linters = { 'javascript': ['standard'] }
let g:ale_javascript_standard_executable = nrun#Which('semistandard')
" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1


""""""""""FOLDING"""""
set foldmethod=syntax
set nofoldenable " ... but have folds open by default
" Use space to fold
nnoremap <Space> za
"Enable folding by indent when using python files
au BufNewFile,BufReadPost *.py setl foldmethod=indent

"Easy expansion of Active File Directory (p116 Practical Vim)
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" ELM and elm.vim settings
nnoremap <leader>el :ElmEvalLine<CR>
vnoremap wleader>es :<C-u>ElmEvalSelection<CR>
nnoremap <leader>em :ElmMakeCurrentFile<CR>

" Compile Main.elm on file write to any elm file in the project
au BufWritePost *.elm ElmMakeFile("Main.elm")
" au BufWritePost *.elm ElmMakeCurrentFile

" WHITESPACE
" Removes traling whitespace when pressing <F5>
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" WRAPPING
nnoremap <leader>wr :set wrap linebreak
nnoremap <leader>rw :set nowrap

"Highlight trailing whitespace in red, have not appear in insert mode,
"highlight when open new buffers
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
