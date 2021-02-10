" Plugins "
call plug#begin('~/.vim/plugged')
Plug 'ayu-theme/ayu-vim'
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'kien/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'sheerun/vim-polyglot'
Plug 'dense-analysis/ale'
Plug 'jiangmiao/auto-pairs'
Plug 'ap/vim-css-color'
Plug 'itchyny/vim-cursorword'
Plug 'mattn/emmet-vim'
call plug#end()


" Settings "
syntax on
set updatetime=500
set termguicolors
set encoding=UTF-8
set mouse=a
set ruler
set number
set relativenumber
set cursorline
set hlsearch
set incsearch
set wrap linebreak
set autoindent
set expandtab
set tabstop=2
set shiftwidth=2
set laststatus=2
set showtabline=2
set guioptions-=e
set nobackup
set noswapfile
set list
set listchars=tab:→\ ,eol:↲,space:·
set colorcolumn=80
set autoread

let g:netrw_banner = 0
let g:netrw_liststyle = 3

let ayucolor="dark"
coloscheme ayu


" Dvorak "
set langmap='q,\\,w,.e,pr,yt,fy,gu,ci,ro,lp,/[,=],aa,os,ed,uf,ig,dh,hj,tk,nl,s\\;,-',\\;z,qx,jc,kv,xb,bn,mm,w\\,,v.,z/,[-,]=,\"Q,<W,>E,PR,YT,FY,GU,CI,RO,LP,?{,+},AA,OS,ED,UF,IG,DH,HJ,TK,NL,S:,_\",:Z,QX,JC,KV,XB,BN,MM,W<,V>,Z?


" Basic keys "
let mapleader = "\<Space>"
imap ef <Esc>
nnoremap <esc><esc> :noh<CR>


" Hotkeys "
nnoremap <leader>w <esc>:w<CR>
nnoremap <leader>q <esc>:q<CR>
nnoremap <leader>Q <esc>:q!<CR>

" Alt + k (t) "
nnoremap † <Up>ddp<Up>
" Alt + j (h) "
nnoremap ˙ ddp
" Alt + p (l) "
nnoremap ¬ Yp
" Copy line "
nnoremap Y y$

map <Leader> <Plug>(easymotion-prefix)

let g:user_emmet_expandabbr_key='<Tab>'
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

" Tabs "
nnoremap <C-b> <esc>:tabnew<CR>
nnoremap ‘ <esc>gt<CR>
nnoremap “ <esc>gT<CR>

noremap ¡ <esc>1gt<CR>
noremap ™ <esc>2gt<CR>
noremap £ <esc>3gt<CR>
noremap ¢ <esc>4gt<CR>
noremap ∞ <esc>5gt<CR>
noremap § <esc>6gt<CR>
noremap ¶ <esc>7gt<CR>
noremap • <esc>8gt<CR>
noremap ª <esc>9gt<CR>


" Custom functions "
map <silent> <C-d> :call WinMove('h')<CR>
map <silent> <C-h> :call WinMove('j')<CR>
map <silent> <C-t> :call WinMove('k')<CR>
map <silent> <C-n> :call WinMove('l')<CR>

function! WinMove(key)
  let t:curwin = winnr()
  exec "wincmd ".a:key
  if (t:curwin == winnr())
    if (match(a:key,'[jk]'))
      wincmd v
    else
      wincmd s
    endif
    exec "wincmd ".a:key
  endif
endfunction



" lightline "
let g:lightline = {
  \ 'colorscheme': 'fearOfCode',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ], [ 'lineinfo' ], [ 'readonly', 'fileencoding', 'filetype', 'absolutepath' ] ],
  \   'right': [ [ 'gitbranch' ], [ 'modified' ] ],
  \ },
  \ 'inactive': {
  \   'left': [['filename']],
  \   'right': []
  \ },
  \ 'tabline': {
  \   'left': [['tabs']],
  \   'right': [['close']]
  \ },
  \ 'tab': {
  \   'active': ['tabnum', 'filename', 'modified'],
  \   'inactive': ['tabnum', 'filename', 'modified']
  \ },
  \ 'component': {
  \   'lineinfo': '%2l:%-2v',
  \   'branch': '%{FugitiveStatusline()}',
  \ },
  \ 'component_function': {
  \   'gitbranch': 'gitbranch#name',
  \ },
  \ 'mode_map': {
    \ 'n' : 'N',
    \ 'i' : 'I',
    \ 'R' : 'R',
    \ 'v' : 'V',
    \ 'V' : 'VL',
    \ "\<C-v>": 'VB',
    \ 'c' : 'C',
    \ 's' : 'S',
    \ 'S' : 'SL',
    \ "\<C-s>": 'SB',
    \ 't': 'T',
    \ },
  \ 'separator': { 'left': '', 'right': '' },
  \ 'subseparator': { 'left': '|', 'right': '|' },
  \ 'tabline_separator': {},
  \ 'tabline_subseparator': {},
  \ }


" NERDTree "
let g:NERDTreeMinimalUI=1
let NERDTreeShowHidden=1
let NERDTreeDirArrows=1
let g:NERDTreeMouseMode=2
let NERDTreeAutoDeleteBuffer=1

nnoremap <C-x> :NERDTreeToggle<CR>
nnoremap ≈ <esc>:NERDTreeRefreshRoot<CR>

"" autocmd vimenter * NERDTree
"" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:NERDTreeGitStatusIndicatorMapCustom = {
  \ 'Modified'  :'✹',
  \ 'Staged'    :'✚',
  \ 'Untracked' :'✭',
  \ 'Renamed'   :'➜',
  \ 'Unmerged'  :'═',
  \ 'Deleted'   :'✖',
  \ 'Dirty'     :'✗',
  \ 'Ignored'   :'☒',
  \ 'Clean'     :'✔︎',
  \ 'Unknown'   :'?',
  \ }


" CtrlP "
let g:ctrlp_map = '<C-l>'
let g:ctrlp_show_hidden = 1
let g:ctrlp_prompt_mappings = {
  \ 'PrtBS()':              ['<bs>', '<c-]>'],
  \ 'PrtDelete()':          ['<del>'],
  \ 'PrtDeleteWord()':      ['<c-w>'],
  \ 'PrtClear()':           ['<c-u>'],
  \ 'PrtSelectMove("j")':   ['<c-h>', '<down>'],
  \ 'PrtSelectMove("k")':   ['<c-t>', '<up>'],
  \ 'PrtSelectMove("t")':   ['<Home>', '<kHome>'],
  \ 'PrtSelectMove("b")':   ['<End>', '<kEnd>'],
  \ 'PrtSelectMove("u")':   ['<PageUp>', '<kPageUp>'],
  \ 'PrtSelectMove("d")':   ['<PageDown>', '<kPageDown>'],
  \ 'PrtHistory(-1)':       ['<c-n>'],
  \ 'PrtHistory(1)':        ['<c-p>'],
  \ 'AcceptSelection("e")': ['<cr>', '<2-LeftMouse>'],
  \ 'AcceptSelection("h")': ['<c-x>', '<c-cr>', '<c-s>'],
  \ 'AcceptSelection("t")': ['<c-y>'],
  \ 'AcceptSelection("v")': ['<c-v>', '<RightMouse>'],
  \ 'ToggleFocus()':        ['<s-tab>'],
  \ 'ToggleRegex()':        ['<c-r>'],
  \ 'ToggleByFname()':      ['<c-d>'],
  \ 'ToggleType(1)':        ['<c-k>', '<c-up>'],
  \ 'ToggleType(-1)':       ['<c-b>', '<c-down>'],
  \ 'PrtExpandDir()':       ['<tab>'],
  \ 'PrtInsert("c")':       ['<MiddleMouse>', '<insert>'],
  \ 'PrtInsert()':          ['<c-\>'],
  \ 'PrtCurStart()':        ['<c-a>'],
  \ 'PrtCurEnd()':          ['<c-e>'],
  \ 'PrtCurLeft()':         ['<c-j>', '<left>', '<c-^>'],
  \ 'PrtCurRight()':        ['<c-l>', '<right>'],
  \ 'PrtClearCache()':      ['<F5>'],
  \ 'PrtDeleteEnt()':       ['<F7>'],
  \ 'CreateNewFile()':      ['<c-f>'],
  \ 'MarkToOpen()':         ['<c-z>'],
  \ 'OpenMulti()':          ['<c-o>'],
  \ 'PrtExit()':            ['<esc>', '<c-c>', '<c-g>'],
  \ }

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*

