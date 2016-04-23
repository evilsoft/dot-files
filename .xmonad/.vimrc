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

set visualbell
set t_vb=

set background=light

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

let g:jsx_ext_required = 0

" NerdTree colors
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
  exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
  exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('html', 'red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('md', 'magenta', 'none', 'blue', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('less', 'brown', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'brown', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('js', 'darkgreen', 'none', 'darkgreen', '#151515')
call NERDTreeHighlightFile('jsx', 'darkgreen', 'none', 'darkgreen', '#151515')

nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>
