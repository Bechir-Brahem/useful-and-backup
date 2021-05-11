# vim setup

***this tutorial will focus on nvim***

## nvim config

### basic configs

add these lines first to `~/.config/nvim/init.vim`
**these lines were altered check the latest init.vim file**

```sh
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
"set completeopt-=preview "stops ycm from showing the preview
let mapleader =" "
"opens terminal
```

```sh
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
```

## plugins

### plug

necessary libraries for plug

```sh
sudo apt-get install nodejs fuse libfuse2 git python3-pip ack-grep -y
```

plug for vim

```sh
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

plug for nvim

```sh
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

### installing some basic plugins and themes

```sh
call plug#begin('~/.vim/plugged')
Plug 'sainnhe/gruvbox-material'
Plug 'morhetz/gruvbox'
Plug 'mbbill/undotree'
Plug '907th/vim-auto-save'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree'
Plug 'romgrk/winteract.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'hlissner/vim-multiedit'
Plug 'tpope/vim-surround'
call plug#end()
"themes
set t_Co=256
set encoding=UTF-8
colorscheme gruvbox-material
set background=dark
"autosave
let g:auto_save=1
noremap <F2> :NERDTreeToggle<Cr>
noremap <F3> :UndotreeToggle<Cr>
let NERDSpaceDelims = 1 "nerdcommenter"
nmap <leader>w :InteractiveWindow<CR>
nmap <leader>m :MarkdownPreview<CR>
```

### installing airline and devicons

#### 

install these with plug

```sh
Plug 'vim-airline/vim-airline' "requires installing powerline fonts found in github
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'

```

and add these after

```sh
let g:airline_powerline_fonts = 1 "for triangles
let g:airline#extensions#tabline#enabled = 1 "show buffers
```

download [patched fonts](https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete.ttf)
and you can check the readme for updates\
install these files in `/usr/share/fonts/` `~/.local/share/fonts/` `/usr/local/share/fonts`
and change the font in the terminal to hack nerd font

### installing vim-autoformat

#### step

`sudo apt install clang-format`

and then install it with plug

`Plug 'Chiel92/vim-autoformat'`
and add `noremap <c-f> :Autoformat<CR>`
auto format only finds .clang-format files if they are in the directory or the one above
and clang-format can't take a path for the .clang-format file. so to have a general formatting style
i created this .clang-format style 

```YAML
AlignConsecutiveMacros: true
AlignTrailingComments: true
AllowShortBlocksOnASingleLine: true
AllowShortFunctionsOnASingleLine: true
AllowShortIfStatementsOnASingleLine: true
AllowShortLoopsOnASingleLine: true
SpaceInEmptyBlock: true
IndentWidth: 4
MaxEmptyLinesToKeep: 2

BreakBeforeBraces: Custom
BraceWrapping:
  SplitEmptyFunction: true
  AfterControlStatement: Never
  AfterFunction:   true
```

and this command will format main.cpp

```sh
clang-format -style={
    AlignConsecutiveMacros: true ,
    AlignTrailingComments: true ,
    AllowShortBlocksOnASingleLine: true ,
    AllowShortFunctionsOnASingleLine: true ,
    AllowShortIfStatementsOnASingleLine: true , 
    AllowShortLoopsOnASingleLine: true , 
    SpaceInEmptyBlock: true , 
    IndentWidth: 4 , 
    MaxEmptyLinesToKeep: 2 ,
    BraceWrapping: {
        SplitEmptyFunction: true,
        AfterControlStatement: Never, 
        AfterFunction: true, 
        }
    } main.cpp
```
and so i added this style to ~/.config/nvim/plugged/vim-autoformat/plugin/defaults.vim

```
if !exists('g:formatdef_clangformat')
    "bechir added the next two lines
    let s:noconfigfile_def = "'clang-format -lines='.a:firstline.':'.a:lastline.' --assume-filename=\"'.expand('%:p').'\" -style=\"{AlignConsecutiveMacros: true , AlignTrailingComments: true , AllowShortBlocksOnASingleLine: true , AllowShortFunctionsOnASingleLine: true , AllowShortIfStatementsOnASingleLine: true , AllowShortLoopsOnASingleLine: true , SpaceInEmptyBlock: true , IndentWidth: 4 , MaxEmptyLinesToKeep: 2 ,BreakBeforeBraces: Custom, BraceWrapping: {SplitEmptyFunction: true,AfterControlStatement: Never, AfterFunction: true,  }}\"'"
    let s:configfile_def = "'clang-format -lines='.a:firstline.':'.a:lastline.' --assume-filename=\"'.expand('%:p').'\" -style=\"{AlignConsecutiveMacros: true , AlignTrailingComments: true , AllowShortBlocksOnASingleLine: true , AllowShortFunctionsOnASingleLine: true , AllowShortIfStatementsOnASingleLine: true , AllowShortLoopsOnASingleLine: true , SpaceInEmptyBlock: true , IndentWidth: 4 , MaxEmptyLinesToKeep: 2 ,BreakBeforeBraces: Custom, BraceWrapping: {SplitEmptyFunction: true,AfterControlStatement: Never, AfterFunction: true,  }}\"'"
    let g:formatdef_clangformat = "g:ClangFormatConfigFileExists() ? (" . s:configfile_def . ") : (" . s:noconfigfile_def . ")"
endif
```

```
this was the original 
" Generic C, C++, Objective-C
if !exists('g:formatdef_clangformat')
let s:configfile_def = "'clang-format -lines='.a:firstline.':'.a:lastline.' --assume-filename=\"'.expand('%:p').'\" -style=file'"
let s:noconfigfile_def = "'clang-format -lines='.a:firstline.':'.a:lastline.' --assume-filename=\"'.expand('%:p').'\" -style=\"{BasedOnStyle: WebKit, AlignTrailingComments: true, '.(&textwidth ? 'ColumnLimit: '.&textwidth.', ' : '').(&expandtab ? 'UseTab: Never, IndentWidth: '.shiftwidth() : 'UseTab: Always').'}\"'"
let g:formatdef_clangformat = "g:ClangFormatConfigFileExists() ? (" . s:configfile_def . ") : (" . s:noconfigfile_def . ")"
endif
```


### Coc.nvim

#### steps

installed provider for python 2 and 3

```sh
python3 -m pip install pynvim
sudo apt install python2
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python get-pip.py
python2.7 -m pip install --user --upgrade pynvim
```

then add `Plug 'neoclide/coc.nvim', {'branch': 'release'}`\
install npm `sudo apt install npm`

```sh
:CocInstall coc-cmake coc-css coc-html coc-java coc-json coc-markdownlin
t coc-python coc-sh coc-spell-checker coc-texlab coc-tsserver
```
change coc-settings file too

### markdown tools

add these lines first one is for automatic folding based on headers and the second is explained

```sh
Plug 'masukomi/vim-markdown-folding'
Plug 'tpope/vim-markdown' "to highlight python... code in md
```

```sh
"markdown
nmap <leader>mk :MarkdownPreview<CR>
let g:markdown_fold_style = 'nested' "instead of stacked
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh'] "syntax higlight for code inside md
"so automatically update folding
set nocompatible
if has("autocmd")
	filetype plugin indent on
endif

```

### bechir edits

#### vimwiki

ftpplugin/vimwki.vim
(i didn't know any other way to unmap it)
  " commented by bechir
  " call vimwiki#u#map_key('i', '<C-L><C-K>', '<Plug>VimwikiListPrevSymbol')

#### vim autopairs

(i didn't know any other way to unmap it)
"commented by bechir
" Map <C-h> as the same BS
" if !exists('g:AutoPairsMapCh')
  " let g:AutoPairsMapCh = 1
" end

" commented by bechir
  " if g:AutoPairsMapCh
    " execute 'inoremap <buffer> <silent> <C-h> <C-R>=AutoPairsDelete()<CR>'
  " endif

#### gruvbox-material

to highlight pairs ([{"''"}]) 
i added these at the end of ~/.config/nvim/plugged/gruvbox-material/colors/gruvbox-material.vim

"bechir
```sh
let s:gb = {}
let s:gb.dark3       = ['#665c54', 241]     " 102-92-84
let s:bg3  = s:gb.dark3
let s:none = ['NONE', 'NONE']
let s:bold = 'bold,'
if !exists('g:gruvbox_bold')
  let g:gruvbox_bold=1
endif
if g:gruvbox_bold == 0
  let s:bold = ''
endif
function! s:HL(group, fg, ...)
  " Arguments: group, guifg, guibg, gui, guisp

  " foreground
  let fg = a:fg

  " background
  if a:0 >= 1
    let bg = a:1
  else
    let bg = s:none
  endif

  " emphasis
  if a:0 >= 2 && strlen(a:2)
    let emstr = a:2
  else
    let emstr = 'NONE,'
  endif

  " special fallback
  if a:0 >= 3
    if g:gruvbox_guisp_fallback != 'NONE'
      let fg = a:3
    endif

    " bg fallback mode should invert higlighting
    if g:gruvbox_guisp_fallback == 'bg'
      let emstr .= 'inverse,'
    endif
  endif

  let histring = [ 'hi', a:group,
        \ 'guifg=' . fg[0], 'ctermfg=' . fg[1],
        \ 'guibg=' . bg[0], 'ctermbg=' . bg[1],
        \ 'gui=' . emstr[:-2], 'cterm=' . emstr[:-2]
        \ ]

  " special
  if a:0 >= 3
    call add(histring, 'guisp=' . a:3[0])
  endif

  execute join(histring, ' ')
endfunction

call s:HL('MatchParen', s:none, s:bg3, s:bold)

```
