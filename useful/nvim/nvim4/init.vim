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
set nohlsearch "no highlighting after searching
set scrolloff=8 "cool beans
set guicursor=n-v-c-sm-i:block "so cursor becomes a block in insert mode

"[ source ]https://vim.fandom.com/wiki/Set_working_directory_to_the_current_file
"set completeopt-=preview "stops ycm from showing the preview
let mapleader =" "
nnoremap <c-d> :bd!<CR>
nnoremap <c-n> :bn<cr>
nnoremap <c-p> :bp<cr>
"opens terminal
" nnoremap <leader>t :bot 7sp term://zsh<cr>
nnoremap <leader>t :vsp term://zsh<cr>a
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
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'ojroques/vim-scrollstatus'
Plug 'vimwiki/vimwiki'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
call plug#end()
"themes
set t_Co=256
set encoding=UTF-8
colorscheme gruvbox-material
set background=dark
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
"plugins
nnoremap <F2> :NERDTreeToggle<Cr>
nnoremap <F3> :UndotreeToggle<Cr>
nnoremap <leader>w :InteractiveWindow<CR>
nnoremap <leader>mk :MarkdownPreview<CR>
let NERDSpaceDelims = 1 "nerdcommenter"
let g:auto_save=1 "autosave
let g:markdown_fold_style = 'nested'
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']


"coc
" nnoremap <c-f> :call CocAction('format')<cr>
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
nnoremap <F12> :CocCommand snippets.editSnippets <cr>
"vim-autoformat
nnoremap <c-f> :Autoformat<CR>
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0

inoremap ä <End>
inoremap ö <Home>
inoremap ü <Del>
nnoremap ä <End>
nnoremap ö <Home>
nnoremap ü <Del>
inoremap <c-l> <Right>
inoremap <c-j> <Down>
inoremap <c-k> <Up>
inoremap <c-h> <Left>
"vim wiki
let g:vimwiki_folding='custom'   
let g:vimwiki_global_ext = 0
let wiki_1 = {}
let wiki_1.path = '~/vimwiki/'
let wiki_1.syntax = 'markdown'
let wiki_1.ext = '.md'
let g:vimwiki_list = [wiki_1]
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}

