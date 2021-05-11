# This was tested for vim not neovim

## NERDTree

open it with :NERDTree\
toggle it woth :NERDTreeToggle or `<f2>`\
chage focus with :NERDtreeFocus or crtl-w\
open a file with o or enter\
use help with ? in undotree window\
open in another tab with s

## Undotree

open with :UndotreeToggle or `<f3>`
? for help

## Autosave

autosaves every vim file automatically

## YouCompleteMe

downloaded for all available languages

## UltiSnippets

type the snippet sign then press tab to expand\
to edit the snippets press `<F12>` or type :UltiSnipsEdit

## surround

"hello world"  press cs"' in that example to get 'hello world'
press ds' to delete the '
(hell) cs({ to get {hell}
hello world press ysiw] on hello to obtain \[hello] world   and yss{ to wrap the
whole line
hello type `ysiw<p>` to get `<p>hello</p>`
select a line with V (visual mode) and press `S<p class=degla>` to get

```html
<p class=dugla>
hello world
</p>
```

## Autoformat

`<crtl-f>` to format code now setup for js,html,css,c,c++ files check github for more

## web-dev

`<crtl-f>` to autoformat js,html,css,json,jsx files
`<F5>` to open index.html in the file directory with firefox

## latex

type pp in terminal to open latex file and the pdf

## NERD commenter

`<leader>cc` comments\
`<leader>c<space>` toggles comments\
`<leader>cs` comment block\
`<leader>cu` uncomments

## Folds

select lines with V and press zf to make a fold\
zo to open a fold\
zc to close a fold\
zd to delete a fold\
zfa{ to make a fold from the braces to braces\
:mkview to save the folds in vim/view (automatic when closing a file)\
:loadview to load the view (automatic when opening a file)

## Winteract-vim

nmap <leader>w :InteractiveWindow<CR>

*   resize            j/k/h/l
*   fullwidth         F
*   equalize          =
*   next/prev         w/W
*   move window       H/J/K/L
*   change buffer     n/p

## Terminal

type <space>t to open terminal below

## vimrc

type <space>v to open the init.vim

## Multiedit

<leader>mi insert mark to edit it after\
<leader>M start editing\
<leader>mr removes all marks

## Markdown

use this to generate table of content
https://ecotrust-canada.github.io/markdown-toc/

### vim-markdown-folding

i use nested folding
zr to reduce folding
zR to see all
zm to fold by one level
zM to fold all

### markdown preview.nvim

<leader>mk to preview the md file in web browser
