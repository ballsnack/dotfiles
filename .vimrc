" Pathogen
filetype off
execute pathogen#infect()
filetype plugin indent on

" Airline
let g:airline_powerline_fonts = 1
let g:airline_theme = 'solarized'

" Neocomplcache
let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

inoremap <expr><TAB>    pumvisible() ? "\<C-n>" : "\<TAB>"

autocmd FileType python setlocal omnifunc=pythoncomplete#Complete

" Solarized settings
let g:solarized_termcolors = 256

" Enable syntax highlighting
syntax enable

" Color scheme and background
colo solarized
set bg=light
set t_Co=256

" Highlight current line
set cursorline

" Always show line number and position
set ruler
set number

" Proper backspace
set backspace=2

" Searching
set ignorecase
set smartcase
set hlsearch
set incsearch

" Statusline
set laststatus=2
set noshowmode

" Set utf8
set encoding=utf8

" Turn backup off
set nobackup
set nowb
set noswapfile

" 500 character line break
set lbr
set tw=500

" Tabbing
set expandtab
set smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Indents
set ai
set si
set cindent

" Matching brackets blink
set mat=2

" Hide the buffer when its abandoned
set hid

" Show matching brackets
set showmatch

" Turn off stupid error effects
set noerrorbells
set novisualbell
set t_vb =
set tm=500

" Wrap lines
set wrap

" Timeout length
set timeoutlen=50

" Sudo save the file
command W w !sudo tee % > /dev/null

" Mappings
map j gj
map k gk
