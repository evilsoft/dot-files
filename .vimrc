set nocompatible

syntax on

filetype indent plugin on

set expandtab
set autoindent
set number
set nowrap
set fdm=indent
set shiftwidth=2
set tabstop=2
set laststatus=2

set visualbell
set t_vb=

set mouse=a
set pastetoggle=<F11>

set wildmenu
set wildmode=list:longest,full

" Use Pathogen for Plugins
execute pathogen#infect()

" NERDTree Key Binding (Plugin)
map <C-n> :NERDTreeToggle<CR>

" Airline Config (Plugin)
let g:airline_powerline_fonts = 1
let g:airline_theme = 'laederon'
