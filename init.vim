colorscheme molokai
syntax on
language en_US
set mouse=a
set clipboard+=unnamed
set number
set tabstop=2
set noswapfile
set autoread
set hidden
set nobackup
set showcmd
set backspace=indent,eol,start
set whichwrap=b,s,h,l,<,>,[,]
set termguicolors
set inccommand=split
let g:previm_open_cmd = 'open -a Safari'
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let $PATH = $PYENV_VIRTUAL_ENV."/bin:".$PATH
let g:python_host_prog  = '/Users/tak/.pyenv/versions/py2neovim/bin/python'
let g:python3_host_prog  = '/Users/tak/.pyenv/versions/py3neovim/bin/python'

nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap <ESC><ESC> :noh<CR>
augroup PrevimSettings
  autocmd!
  autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END
let mapleader = ","
"vimfiler configs
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default = 0

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here like this:
  "call dein#add('Shougo/neosnippet.vim')
  "call dein#add('Shougo/neosnippet-snippets')

  "call dein#add('Shougo/vimproc.vim')
  "call dein#add('Shougo/deoplete.nvim')
  "call dein#add('Shougo/neomru.vim')
  "call dein#add('Shougo/vimfiler.vim')
  "call dein#add('kannokanno/previm')
  "call dein#add('Shougo/denite.nvim')
  "call dein#add('Shougo/defx.nvim')
  "call dein#add('airblade/vim-gitgutter')
  
  let g:config_dir  = expand('~/.config/nvim')
  let s:toml        = g:config_dir . '/dein.toml'
  let s:lazy_toml   = g:config_dir . '/dein_lazy.toml'
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

"quick run
let g:quickrun_config={'*': {'split': 'vertical'}}
nnoremap <silent> <Leader>rr :QuickRun<CR>
au FileType qf nnoremap <silent><buffer>q :quit<CR>
set splitbelow
set splitright

" deoplete
let g:deoplete#enable_at_startup = 1
" denite configs -------------------------
call denite#custom#map('insert', 'jj', '<denite:enter_mode:normal>')
call denite#custom#map('insert', "<CR>", '<denite:do_action:tabopen>')
nnoremap <silent> <Space>f :<C-u>Denite<Space>buffer<Space>file<Space>file_mru<CR>
nnoremap <silent> <Space>d :<C-u>Denite<Space>directory_mru<CR>
nnoremap <silent> <Space>b :<C-u>Denite<Space>buffer<CR>
nnoremap <silent> <Space>r :<C-u>Denite<Space>register<CR>
nnoremap <silent> <Space><CR> :<C-u>Denite<Space>file_rec<CR>
nnoremap <silent> <Space>c :<C-u>Denite<Space>dirmark<CR>

" defx configs ---------------------------
nnoremap <silent> <Leader>fi :<C-u>Defx -split=vertical -winwidth=40 -direction=topleft<CR>
nnoremap <silent> <Leader>fe :<C-u>Defx<CR>
autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
  " Define mappings
  nnoremap <silent><buffer><expr> <CR>
  \ defx#do_action('open')
  nnoremap <silent><buffer><expr> c
  \ defx#do_action('copy')
  nnoremap <silent><buffer><expr> m
  \ defx#do_action('move')
  nnoremap <silent><buffer><expr> p
  \ defx#do_action('paste')
  nnoremap <silent><buffer><expr> l
  \ defx#do_action('open')
  nnoremap <silent><buffer><expr> E
  \ defx#do_action('open', 'vsplit')
  nnoremap <silent><buffer><expr> P
  \ defx#do_action('open', 'pedit')
  nnoremap <silent><buffer><expr> K
  \ defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> N
  \ defx#do_action('new_file')
  nnoremap <silent><buffer><expr> d
  \ defx#do_action('remove')
  nnoremap <silent><buffer><expr> r
  \ defx#do_action('rename')
  nnoremap <silent><buffer><expr> x
  \ defx#do_action('execute_system')
  nnoremap <silent><buffer><expr> yy
  \ defx#do_action('yank_path')
  nnoremap <silent><buffer><expr> .
  \ defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> ;
  \ defx#do_action('repeat')
  nnoremap <silent><buffer><expr> h
  \ defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> ~
  \ defx#do_action('cd')
  nnoremap <silent><buffer><expr> q
  \ defx#do_action('quit')
  nnoremap <silent><buffer><expr> <Space>
  \ defx#do_action('toggle_select') . 'j'
  nnoremap <silent><buffer><expr> *
  \ defx#do_action('toggle_select_all')
  nnoremap <silent><buffer><expr> j
  \ line('.') == line('$') ? 'gg' : 'j'
  nnoremap <silent><buffer><expr> k
  \ line('.') == 1 ? 'G' : 'k'
  nnoremap <silent><buffer><expr> <C-l>
  \ defx#do_action('redraw')
  nnoremap <silent><buffer><expr> <C-g>
  \ defx#do_action('print')
  nnoremap <silent><buffer><expr> cd
  \ defx#do_action('change_vim_cwd')
endfunction

"vim-airline
let g:airline_powerline_fonts = 1
let g:airline_theme = 'molokai'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#virtualenv#enabled = 1
"quickrun
let g:quickrun_config = {}
let g:quickrun_config['*'] = {'runner': 'vimproc'}
