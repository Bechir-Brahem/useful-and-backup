"vim plugin-independent settings
"from youtube video by the primeagen (i liked the video)
syntax on "to highlight more
set noeb vb t_vb= "to remove the annoying sound
set tabstop=4 softtabstop=4 "make tab 4 spaces instead of 8
set shiftwidth=4 "so when << or >> are pressed it shifts by 4
set smartindent " better indentation
set nowrap "line continues on the screen independant of the width
set nu rnu "line numbers and relative numbers
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch "search when typing
set cursorline "cursor line highlighted
" set splitbelow "splits horizental happen at the bottom
set clipboard=unnamedplus "so yanking goes to the clipboard
set completeopt-=preview "stops ycm from showing the preview
let mapleader =" "
"opens terminal

nnoremap <leader>t :bot 7sp term://bash<cr>
"to exit terminal mode
tnoremap <Esc> <C-\><C-n>
"to open vim.init or vimrc
nnoremap <Leader>v :e $MYVIMRC<cr>
"current dir
let $CUR_DIR=escape(escape(expand("%:p:h"), ' '), '\ ') |  
"create class files
nnoremap <Leader>k :!/home/bechir/.config/nvim/makeClass.sh $CUR_DIR   
" open index
:nmap <F5> :!firefox index.html &<Cr><Cr>

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
Plug 'preservim/nerdtree'
Plug 'romgrk/winteract.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'hlissner/vim-multiedit'
Plug 'tpope/vim-surround'
" Plug 'dense-analysis/ale'
call plug#end()

" clang format without plugins
" map <C-K> ggVG :pyf /home/bechir/.vim/clang-format.py<cr>
" imap <C-K> <c-o>:pyf /home/bechir/.vim/clang-format.py<cr>
		
"themes
set t_Co=256
set encoding=UTF-8
colorscheme gruvbox-material
set background=dark
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

"you complete me
" let g:ycm_key_list_select_completion = ['<Down>', '<Enter>'] 
" let g:ycm_use_clangd = 1
" let g:ycm_clangd_binary_path = "/usr/bin/clangd" "requires installing clangd

"UltiSnips
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
"access UltiSnipsEdit with <f12>
:map <F12> :UltiSnipsEdit<Cr>

"auto format
noremap <c-f> :Autoformat<CR>
"autosave
let g:auto_save=1

"vimtex
let g:tex_flavor='pdflatex'
"let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=-1
set conceallevel=0
let g:tex_conceal='abdmg'

noremap <F2> :NERDTreeToggle<Cr>

noremap <F3> :UndotreeToggle<Cr>

let NERDSpaceDelims = 1 "nerdcommenter"

nmap <leader>w :InteractiveWindow<CR>

