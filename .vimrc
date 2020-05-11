set nocompatible              " be iMproved, required
filetype off                  " required

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

" Plugin manager
Plugin 'VundleVim/Vundle.vim'

" Highlighting:
Plugin 'pangloss/vim-javascript'

" Snippets:
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'grvcoelho/vim-javascript-snippets'

" Lint:
Plugin 'w0rp/ale'

" Autocomplete:
Plugin 'Valloric/YouCompleteMe'

" File explorer:
Plugin 'scrooloose/nerdtree'

" System clipboard:
Plugin 'christoomey/vim-system-copy'

" Find file by text:
Plugin 'dyng/ctrlsf.vim'

" Find file by name:
set rtp+=~/.fzf
Plugin 'junegunn/fzf.vim'

" JSX Vim
Plugin 'maxmellon/vim-jsx-pretty'

" Vue Vim Plugin
Plugin 'posva/vim-vue'

" Vim Airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Gruvbox
Plugin 'morhetz/gruvbox'

" Palenight
Plugin 'drewtempelmeyer/palenight.vim'

call vundle#end()


" Vim configuration:
" Indentation
filetype plugin indent on
set tabstop=2
set shiftwidth=2
set expandtab

" Line numbers:
set number

" No wrap:
set nowrap

" Disable preview window
set completeopt-=preview

" Auto open nerdtree
au VimEnter *  NERDTree

" Plugins configuration:
" Snippets:
imap <C-J> <esc>a<Plug>snipMateNextOrTrigger
smap <C-J> <Plug>snipMateNextOrTrigger

" Lint:
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" Sign error
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'

" Code formatter:
let b:ale_fixers = ['eslint']
let g:ale_fix_on_save = 1

" Vim Vue Optimization
let g:vue_pre_processors = []

" Theme config

autocmd vimenter * colorscheme gruvbox
" autocmd vimenter * colorscheme palenight
set background=dark


" File explorer:

" Show hidden files
let NERDTreeShowHidden=1

" NERDTress Ctrl+n
map <C-n> :NERDTreeToggle<CR>
" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction
call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

" ctrlsf (find file by text)
" O - always leave CtrlSF window opening.
" <C-O> - open file in a horizontal split window.
" <C-J> - Move cursor to next match.
" <C-K> - Move cursor to previous match.
nmap     <C-F> <Plug>CtrlSFPrompt
vmap     <C-F> <Plug>CtrlSFVwordPath


" vim.fzf (find file by filename)
map <C-b> :Files<CR>
