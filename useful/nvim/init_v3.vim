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
set clipboard=unnamedplus "so yanking goes to the clipboard
"set completeopt-=preview "stops ycm from showing the preview
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
"nnoremap <Leader>k :!/home/bechir/.config/nvim/makeClass.sh $CUR_DIR
"
call plug#begin('~/.vim/plugged')
Plug 'sirver/ultisnips'
Plug 'sainnhe/gruvbox-material'
Plug 'morhetz/gruvbox'
Plug 'mbbill/undotree'
Plug '907th/vim-auto-save'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree'
Plug 'romgrk/winteract.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'vim-airline/vim-airline' "requires installing powerline fonts found in github
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'Chiel92/vim-autoformat'
Plug 'hlissner/vim-multiedit'
Plug 'tpope/vim-surround'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'masukomi/vim-markdown-folding'
Plug 'tpope/vim-markdown' "to highlight python... code in md
call plug#end()

let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']
"themes
set t_Co=256
set encoding=UTF-8
colorscheme gruvbox-material
set background=dark
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
"UltiSnips
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
"access UltiSnipsEdit with <f12>
nmap <F12> :UltiSnipsEdit<Cr>
nmap <F2> :NERDTreeToggle<Cr>
nmap <F3> :UndotreeToggle<Cr>
nmap <leader>w :InteractiveWindow<CR>
nmap <c-f> :Autoformat<CR>
nmap <leader>mk :MarkdownPreview<CR>
let NERDSpaceDelims = 1 "nerdcommenter"
let g:auto_save=1 "autosave
let g:markdown_fold_style = 'nested'

set nocompatible
if has("autocmd")
	filetype plugin indent on
endif
