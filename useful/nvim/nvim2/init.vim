"vim plugin-independent settings
"from youtube video by the primeagen (i liked the video)
syntax on "to highlight more
set noeb vb t_vb= "to remove the annoying sound
set expandtab tabstop=4 softtabstop=4 "make tab 4 spaces instead of 8
set shiftwidth=4 "so when << or >> are pressed it shifts by 4
set smartindent " better indentation
set nowrap "line continues on the screen independant of the width
set nu rnu "line numbers and relative numbers
set noswapfile
set nobackup
set undodir=~/.config/nvim/undodir
set undofile
set incsearch "search when typing
set cursorline "cursor line highlighted
set clipboard=unnamedplus "so yanking goes to the clipboard
set autochdir "to set working directory in vim to the current file dir
"[ source ]https://vim.fandom.com/wiki/Set_working_directory_to_the_current_file
"set completeopt-=preview "stops ycm from showing the preview
let mapleader =" "
nmap <c-d> :bd!<CR>
nmap <c-n> :bn<cr>
nmap <c-p> :bp<cr>
"opens terminal
" nnoremap <leader>t :bot 7sp term://zsh<cr>
nmap <leader>t :vsp term://zsh<cr>a
"to exit terminal mode
tnoremap <Esc> <C-\><C-n>
"to open vim.init or vimrc
nnoremap <Leader>v :e $MYVIMRC<cr>
"let $CUR_FILE=escape(escape(expand("%:r"), ' '), '\ ') |
"
call plug#begin('~/.config/nvim/plugged')
Plug 'sainnhe/gruvbox-material'
Plug 'morhetz/gruvbox'
Plug 'mbbill/undotree'
Plug '907th/vim-auto-save'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree'
Plug 'romgrk/winteract.vim'
Plug 'vim-airline/vim-airline' "requires installing powerline fonts found in github
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'Chiel92/vim-autoformat'
Plug 'hlissner/vim-multiedit'
Plug 'tpope/vim-surround'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'masukomi/vim-markdown-folding'
Plug 'tpope/vim-markdown' "to highlight python... code in md
" Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'ojroques/vim-scrollstatus'
call plug#end()
"themes
set t_Co=256
set encoding=UTF-8
colorscheme gruvbox-material
set background=dark
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
"plugins
nmap <F2> :NERDTreeToggle<Cr>
nmap <F3> :UndotreeToggle<Cr>
nmap <leader>w :InteractiveWindow<CR>
"nmap <c-f> :Autoformat<CR>
nmap <leader>mk :MarkdownPreview<CR>
let NERDSpaceDelims = 1 "nerdcommenter"
let g:auto_save=1 "autosave
let g:markdown_fold_style = 'nested'
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']


"coc
nmap <c-f> :call CocAction('format')<cr>
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
							  \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
let g:coc_snippet_next = '<tab>'

"cpp highlight
let g:cpp_no_function_highlight = 0
"vim scroll
let g:airline_section_x = '%{ScrollStatus()}'
let g:scrollstatus_size = 12
"coc-snippets
nmap <F12> :CocCommand snippets.editSnippets <cr>
