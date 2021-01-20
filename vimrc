if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

Plug 'slashmili/alchemist.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
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

call plug#end()

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

let g:go_highlight_methods = 1
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_array_whitespace_error = 0
let g:go_highlight_build_constraints = 0
let g:go_highlight_chan_whitespace_error = 0
let g:go_highlight_diagnostic_errors = 1
let g:go_highlight_diagnostic_warnings = 1
let g:go_highlight_extra_types = 0
let g:go_highlight_fields = 0
let g:go_highlight_format_strings = 1
let g:go_highlight_function_calls = 0
let g:go_highlight_function_parameters = 0
let g:go_highlight_functions = 0
let g:go_highlight_generate_tags = 0
let g:go_highlight_operators = 0
let g:go_highlight_space_tab_error = 0
let g:go_highlight_string_spellcheck = 1
let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_types = 0
let g:go_highlight_variable_assignments = 0
let g:go_highlight_variable_declarations = 0

" syntax enable
" set background=dark
" colorscheme solarized

autocmd BufWritePre *.js Neoformat
colorscheme monokai
map <leader>int viw<c-c>a}<c-c>Bi#{<c-c>
"Insert Fat Arrow/Hashrocket
map <leader>hr a=><space>
"Insert Skinny Arrow
map <leader>sa a-><space>

"0 if you want to enable it later via :RainbowToggle
let g:rainbow_active = 1
let g:markdown_fenced_languages = ['html', 'vim', 'ruby', 'python', 'zsh=sh', 'elixir', 'clojure', 'javascript']

set nolist
iabbrev epry require IEx; IEx.pry
iabbrev bpry require 'pry'; binding.pry

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

augroup NeoformatAutoFormat
  autocmd!
  autocmd FileType javascript,javascript.jsx setlocal formatprg=prettier\ --stdin\ --print-width\ 80\ --single-quote\ --trailing-comma\ es5
  autocmd BufWritePre *.js,*.jsx Neoformat
augroup END

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

