if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

Plug 'slashmili/alchemist.vim'
Plug 'tpope/vim-apathy'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-flagship'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'cespare/vim-toml'
Plug 'godlygeek/tabular'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'KeitaNakamura/neodark.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'altercation/vim-colors-solarized'
Plug 'slashmili/alchemist.vim'
Plug 'elixir-editors/vim-elixir'
Plug 'vim-test/vim-test'
Plug 'jgdavey/tslime.vim'

call plug#end()

syntax enable
colorscheme dracula
let g:dracula_italic = 0

set guifont=Inconsolata\ for\ Powerline:h15
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8
syntax on
set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans = 1
let g:seoul256_background = 234

" Go stuff
let g:go_highlight_methods = 1
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_chan_whitespace_error = 1
let g:go_highlight_diagnostic_errors = 1
let g:go_highlight_diagnostic_warnings = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_functions = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_operators = 1
let g:go_highlight_space_tab_error = 1
let g:go_highlight_string_spellcheck = 1
let g:go_highlight_trailing_whitespace_error = 1
let g:go_highlight_types = 1
let g:go_highlight_variable_assignments = 1
let g:go_highlight_variable_declarations = 1
set runtimepath+=$GOROOT/misc/vim
set rtp+=$GOROOT/misc/vim
filetype plugin indent on
" End go stuff

map <leader>int viw<c-c>a}<c-c>Bi#{<c-c>
"Insert Fat Arrow/Hashrocket
map <leader>hr a=><space>
"Insert Skinny Arrow
map <leader>sa a-><space>

"0 if you want to enable it later via :RainbowToggle
let g:rainbow_active = 1
let g:markdown_fenced_languages = ['html', 'vim', 'ruby', 'python', 'zsh=sh', 'elixir', 'clojure', 'javascript', 'go']

set nolist
iabbrev edebug require IEx; IEx.pry
iabbrev bpry binding.break

"highlight trailing whitespace
match ErrorMsg '\s\+$'
" kill trailing whitespaces automatically
autocmd BufWritePre * :%s/\s\+$//e
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set mouse=a
set nu

inoremap jk <esc>
"Open VIMRC in new tab
noremap <leader>ev :tabedit $MYVIMRC<cr>
"Faster clipboard paste
noremap <leader>p "0p
abbreviate hr =>
noremap <c-h> gT
noremap <c-l> gt
nnoremap <leader>e :call Send_to_Tmux("mix test  ".expand("%")."\n")<CR>
nnoremap <leader>E :call Send_to_Tmux("mix test  ".expand("%").":".line(".")."\n")<CR>
nnoremap <c-P> :FZF<CR>
"
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
"
" " Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"elixir tmux test runner
autocmd FileType elixir call s:elixir_abbreviations()
function! s:elixir_abbreviations()
   iabbrev require 'pry'; binding.pry; require IEx; IEx.pry
    iabbrev require IEx; IEx.pry require IEx; IEx.pry
  endfunction

set incsearch

autocmd BufRead,BufNewFile *.coffee set path+=app/assets/javascripts/app/

nnoremap <leader>e :call Send_to_Tmux("mix test  ".expand("%")."\n")<CR>
nnoremap <leader>E :call Send_to_Tmux("mix test  ".expand("%").":".line(".")."\n")<CR>

nnoremap <leader>s :call Send_to_Tmux("iex -S mix test  ".expand("%")."\n")<CR>
nnoremap <leader>S :call Send_to_Tmux("iex -S mix test  ".expand("%").":".line(".")."\n")<CR>ndfunction

set nu
set visualbell

set wildmenu
set wildmode=list:longest,full

set splitright
set splitbelow

set hidden

set guifont=Monaco:h16
set guioptions-=T guioptions-=e guioptions-=L guioptions-=r
set shell=zsh
set noswapfile

augroup vimrc
 autocmd!
 autocmd GuiEnter * set columns=120 lines=70 number
augroup END

set rtp+=/usr/local/opt/fzf
set foldmethod=indent
set foldlevel=99

au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
au BufRead,BufNewFile *.thor set filetype=ruby
au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

" vim-test
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

let test#strategy = "tslime"
let g:tslime_always_current_session = 1
let g:tslime_always_current_window = 1
let g:tslime_autoset_pane = 1
