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
set backspace=eol,indent,start

set clipboard=unamedplus

set visualbell
set t_vb=

set background=light

set mouse=a
set pastetoggle=<F11>

set wildmenu
set wildmode=list:longest,full

" Use Pathogen for Plugins
execute pathogen#infect()

" https://github.com/scrooloose/nerdtree
" https://github.com/pangloss/vim-javascript
" https://github.com/ryanoasis/nerd-fonts
" git clone https://github.com/tomtom/tlib_vim.git
" git clone https://github.com/MarcWeber/vim-addon-mw-utils.git
" git clone https://github.com/garbas/vim-snipmate.git
" git clone https://github.com/honza/vim-snippets.git
" git clone https://github.com/vim-airline/vim-airline
" git clone https://github.com/vim-airline/vim-airline-themes
" git clone git@github.com:ryanoasis/vim-devicons.git
" git clone git@github.com:jiangmiao/auto-pairs.git
" git clone git@github.com:tpope/vim-commentary.git
" git clone git@github.com:tpope/vim-fugitive.git
" git clone git@github.com:digitaltoad/vim-pug.git
" git clone git@github.com:statianzo/vim-jade.git
" git clone git@github.com:jelera/vim-javascript-syntax.git
" git clone git@github.com:elzr/vim-json.git
" git clone git@github.com:mxw/vim-jsx.git
" git clone git@github.com:groenewege/vim-less.git
" git clone git@github.com:xolox/vim-misc.git
" git clone git@github.com:xolox/vim-notes.git

" NERDTree Key Binding (Plugin)
map <C-n> :NERDTreeToggle<CR>

" Airline Config (Plugin)
let g:airline_powerline_fonts = 1
let g:airline_theme = 'laederon'

let g:jsx_ext_required = 0

" NerdTree colors
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
  exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
  exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('pug', 'red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('html', 'red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('md', 'magenta', 'none', 'blue', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('less', 'brown', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'brown', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('js', 'darkgreen', 'none', 'darkgreen', '#151515')
call NERDTreeHighlightFile('jsx', 'darkgreen', 'none', 'darkgreen', '#151515')
call NERDTreeHighlightFile('purs', 'darkgreen', 'none', 'darkgreen', '#151515')
call NERDTreeHighlightFile('elm', 'darkgreen', 'none', 'darkgreen', '#151515')
call NERDTreeHighlightFile('Dockerfile', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')

nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

nnoremap H ^
nnoremap J 5j
nnoremap K 5k
nnoremap L g_

autocmd Filetype elm setlocal ts=2 sw=2
