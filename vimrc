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

autocmd BufWritePre *.js Neoformat
colorscheme railscasts
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

