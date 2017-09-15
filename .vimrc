syntax on
set nu
set ai
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set expandtab
nnoremap <F2> :<C-U>setlocal lcs=tab:>-,trail:-,eol:$ list! list? <CR>

autocmd FileType make setlocal noexpandtab
nmap <F3> :set tabstop=8 softtabstop=8 shiftwidth=8 noexpandtab<CR>

" ------ Vundle Settings -------
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
echo "Installing Vundle.."
echo ""
silent !mkdir -p ~/.vim/bundle
silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
let iCanHazVundle=0
endif
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" ---------- Plugins ----------

Bundle 'MarcWeber/vim-addon-mw-utils'
"Bundle 'garbas/vim-snipmate'
Bundle 'wesleyche/SrcExpl'
Bundle 'scrooloose/nerdtree'
Bundle 'vim-scripts/taglist.vim'
Bundle 'wesleyche/Trinity'
"Bundle 'vivien/vim-addon-linux-coding-style'


set foldmethod=marker

" Open and close all the three plugins on the same time
nmap <f6>  :TrinityToggleAll<CR>
" Open and close the srcexpl.vim separately
nmap <f7>  :TrinityToggleSourceExplorer<CR>
" Open and close the taglist.vim separately
nmap <f8>  :TrinityToggleTagList<CR>
" Open and close the NERD_tree.vim separately
nmap <f9> :TrinityToggleNERDTree<CR>
" Back to last modified line
"----------------------------------------




""-------------------------------------------------------"
""   ctags
""-------------------------------------------------------"
set tags=home/uscc/Ken/linux-arm/tags

""-------------------------------------------------------"
""   cscope
""-------------------------------------------------------"
set csprg=/usr/bin/cscope
set csto=0
set cst
set nocsverb

cs add /home/uscc/Ken/linux-arm/cscope.out    /home/uscc/Ken/linux-arm/
set csverb

""-------------------------------------------------------"
""   Tap List
""-------------------------------------------------------"
filetype on
""nmap <F7> :TlistToggle<CR>
let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_Inc_Winwidth = 0
let Tlist_Exit_OnlyWindow = 0

let Tlist_Auto_Open = 0
let Tlist_Use_Right_Window = 1
"
""-------------------------------------------------------"
""   Source Explorer
""-------------------------------------------------------"
""nmap <F8> :SrcExplToggle<CR>
"nmap <C-H> <C-W>h
"nmap <C-J> <C-W>j
"nmap <C-K> <C-W>k
"nmap <C-L> <C-W>l
"
let g:SrcExpl_winHeight = 8
let g:SrcExpl_refreshTime = 100
let g:SrcExpl_jumpKey = "<ENTER>"
let g:SrcExpl_gobackKey = "<SPACE>"
let g:SrcExpl_isUpdateTags = 0

""-------------------------------------------------------"
""   NERD Tree
""-------------------------------------------------------"
let NERDTreeWinPos = "left"
""nmap <F9> :NERDTreeToggle<CR>
