"vim plugin-independent settings
"from youtube video by the primeagen (i liked the video)
syntax on "to highlight more
set noeb vb t_vb= "to remove the annoying sound 
set tabstop=4 softtabstop=4 "make tab 4 spaces instead of 8
set shiftwidth=4 "so when << or >> are pressed it shifts by 4
set smartindent " better indentation
set nu "line numbers
set nowrap "line continues on the screen independant of the width
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch "search when typing
autocmd BufWinLeave *.* mkview 
autocmd BufWinEnter *.* silent loadview  

call plug#begin('~/.vim/plugged')
Plug 'lervag/vimtex'
Plug 'sirver/ultisnips'
Plug 'sainnhe/gruvbox-material'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline' "requires installing powerline fonts found in github
Plug 'vim-airline/vim-airline-themes'
Plug 'ycm-core/YouCompleteMe' "requires further installation check github
Plug 'mbbill/undotree'
Plug '907th/vim-auto-save'
Plug 'Chiel92/vim-autoformat'
Plug 'maksimr/vim-jsbeautify'
Plug 'jiangmiao/auto-pairs'
Plug 'cmhughes/latexindent.pl'
Plug 'preservim/nerdcommenter'
Plug 'romgrk/winteract.vim'
call plug#end()

"themes
set t_Co=256 
colorscheme gruvbox-material
set background=dark
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

let mapleader =" "
"you complete me
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
"UltiSnips
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
"access UltiSnipsEdit with <f12>
:map <F12> :UltiSnipsEdit<Cr> 

:map <F5> :!firefox index.html<Cr><Cr>
"auto format
noremap <c-f> :Autoformat<CR>
"autosave
let g:auto_save=1

"vimtex
let g:tex_flavor='latex'
"let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=-1
set conceallevel=0
let g:tex_conceal='abdmg'

noremap <F2> :NERDTreeToggle<Cr>

noremap <F3> :UndotreeToggle<Cr>

let NERDSpaceDelims = 1

nmap <leader>w :InteractiveWindow<CR>
