set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Self update
Bundle 'gmarik/vundle'

""""""""""""""""""""""""""""""""""""""""""
""  Bundles
""""""""""""""""""""""""""""""""""""""""""

" Some dependancies
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'

" colorscheme related bundles
Bundle 'spf13/vim-colors'
Bundle 'flazz/vim-colorschemes'
Bundle 'altercation/vim-colors-solarized'
Bundle 'godlygeek/csapprox'

" some general bundles
Bundle 'mileszs/ack.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'sjl/gundo.vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'mbbill/undotree'
Bundle 'myusuf3/numbers.vim'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'vim-scripts/OnSyntaxChange'
Bundle 'Lokaltog/vim-easymotion'

" General programming specific
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-fugitive'
Bundle 'mattn/webapi-vim'
Bundle 'mattn/gist-vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'godlygeek/tabular'
if executable('ctags')
	Bundle 'majutsushi/tagbar'
endif

" Snippets & Autocomplete
Bundle 'Shougo/neocomplcache'
"Bundle 'Valloric/YouCompleteMe'
Bundle 'honza/snipmate-snippets'

" PHP plugins
Bundle 'spf13/PIV'

" Python plugins
Bundle 'klen/python-mode'
Bundle 'python.vim'
Bundle 'python_match.vim'
Bundle 'pythoncomplete'

" C# plugins
Bundle 'xandox/vim-csharp'


" workaround for css/sass
autocmd BufNewFile,BufRead *.scss set filetype=css
autocmd BufNewFile,BufRead *.sass set filetype=css

" dark background
set t_Co=256
set background=dark
"colorscheme tir_black 
colorscheme molokai

" Other customizations
filetype plugin indent on
syntax on
scriptencoding utf-8

" needed for vim-latex
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'

set shortmess+=filmnrxoOtT
set history=1000
set nospell
set hidden

set backup " backups are nice ...
if has('persistent_undo')
	set undofile "so is persistent undo ...
	set undolevels=1000 "maximum number of changes that can be undone
	set undoreload=10000 "maximum number lines to save for undo on a buffer reload
endif

if has('statusline')
	set laststatus=2
	set statusline+=%<%f\	  		  " Filename
	set statusline+=%w%h%m%r		  " Options
	set statusline+={fugitive#statusline()}   " Git Hotness
	set statusline+=\ [%{&ff}/%Y]			 " File
	set statusline+=\ [%{getcwd()}]		   " Current dir
	set statusline+=%=%-14.(%l,%c%V%)\ %p%%   " Right aligned file nav info
endif

set backspace=indent,eol,start " backspace for dummies
set linespace=0                " No extra spaces between rows
set nu                         " Line numbers on
set showmatch                  " Show matching brackets/parens
set incsearch                  " Search as you type
set hlsearch                   " Hilight the search term
set winminheight=0             " Windows can be 0 lines high
set ignorecase                 " Case insensitive search
set wildmenu                   " Show list instead of just completing
set wildmode=list:longest,full " Command <Tab> completion
set whichwrap=b,s,h,l,<,>,[,]  " Backspace and cursor keys wrap
set scrolljump=5               " Lines to scroll at bottom/top of screen
set scrolloff=3                " Minimum lines from edge of screen

set nowrap					   " Wrap long lines
set autoindent				   " Indent to same level as previous line
set shiftwidth=4			   " Use indents of 4 spaces
set softtabstop=4			   " An indentation every 4 columns
set tabstop=4
set noexpandtab
set pastetoggle=<F12>		   " F12 to toggle paste mode
" remove trailing whitespace and ^M characters
autocmd FileType c,cpp,java,php,javascript,python,twig,xml,yml autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))
autocmd BufNewFile,BufRead *.html.twig set filetype=html.twig

" change the leader
let mapleader = ','

" Mappings to ease movement between splits
map <C-J> <C-W>j<C-W>
map <C-K> <C-W>k<C-W>
map <C-L> <C-W>l<C-W>
map <C-H> <C-W>h<C-W>

" don't skip wrapped lines when moving
nnoremap j gj
nnoremap k gk

if has("user_commands")
	command! -bang -nargs=* -complete=file E e<bang> <args>
	command! -bang -nargs=* -complete=file W w<bang> <args>
	command! -bang -nargs=* -complete=file Wq wq<bang> <args>
	command! -bang -nargs=* -complete=file WQ wq<bang> <args>
	command! -bang Wa wa<bang>
	command! -bang WA wa<bang>
	command! -bang Q q<bang>
	command! -bang QA qa<bang>
	command! -bang Qa qa<bang> 
endif 

cmap Tabe tabe
nnoremap Y y$
nmap <silent> <leader><space> :nohlsearch<CR>       " clear search hilight with ,/
vnoremap < <gv
vnoremap > >gv

map [F $
imap [F $
map [H g0
imap [H g0

" sudo from inside
cmap w!! w !sudo tee % >/dev/null

set cursorline 

""""""""""""""""""""""""""""""""""""""""""""""""
" Omnicomplete
""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

""""""""""""""""""""""""""""""""""""""""""""""""
" Eclim settings
" """"""""""""""""""""""""""""""""""""""""""""""
" ,i imports whatever is needed for current line
nnoremap <silent> <LocalLeader>i :JavaImport<cr>
" ,d opens javadoc for statement in browser
nnoremap <silent> <LocalLeader>d :JavaDocSearch -x declarations<cr>
" ,<enter> searches context for statement
nnoremap <silent> <LocalLeader><cr> :JavaSearchContext<cr>
" ,jv validates current java file
nnoremap <silent> <LocalLeader>jv :Validate<cr>
" ,jc shows corrections for the current line of java
nnoremap <silent> <LocalLeader>jc :JavaCorrect<cr>
" 'open' on OSX will open the url in the default browser without issue
let g:EclimBrowser='firefox'


" Disable AutoComplPop in comments
" call OnSyntaxChange#Install('Comment', '^Comment$', 0, 'i')
" autocmd User SyntaxCommentEnterI silent! AcpLock
" autocmd User SyntaxCommentLeaveI silent! AcpUnlock

" Tabularize customizations
nmap <Leader>a& :Tabularize /&<CR>
vmap <Leader>a& :Tabularize /&<CR>
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:<CR>
vmap <Leader>a: :Tabularize /:<CR>
nmap <Leader>a:: :Tabularize /:\zs<CR>
vmap <Leader>a:: :Tabularize /:\zs<CR>
nmap <Leader>a, :Tabularize /,<CR>
vmap <Leader>a, :Tabularize /,<CR>
nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
vmap <Leader>a<Bar> :Tabularize /<Bar><CR>

" YouCompleteMe options
let g:ycm_global_ycm_extra_conf = '/home/matt/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'

""""""""""""""""""""""""""""""""""""""""""""
" NeoComplCache settings
""""""""""""""""""""""""""""""""""""""""""""
let g:neocomplcache_enable_at_startup = 1

" tab to cycle through choices
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" heavy omni completion
if !exists('g:neocomplcache_omni_patterns')
	let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\->)\h\w*\|\h\w*::'

""""""""""""""""""""""""""""""""""""""""""""
" easymotion settings
""""""""""""""""""""""""""""""""""""""""""""
hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade Comment

""""""""""""""""""""""""""""""""""""""""""""
" move tagbar to the left
""""""""""""""""""""""""""""""""""""""""""""
let g:tagbar_left = 1

""""""""""""""""""""""""""""""""""""""""""""
" cycle through sidebars
""""""""""""""""""""""""""""""""""""""""""""
nnoremap <F9> :call SidebarCycle() <CR>
inoremap <F9> :call SidebarCycle()<CR>

"""""""""""""""""""""""""""""""""""""""""""
" C# settings
""""""""""""""""""""""""""""""""""""""""""

" C# Fold settings
au FileType cs set omnifunc=syntaxcomplete#Complete
au FileType cs set foldmarker={,}
au FileType cs set foldtext=substitute(getline(v:foldstart),'{.*','{...}',)
au FileType cs set foldlevelstart=2

" C# quickfix setting
au FileType cs set errorformat=\ %#%f(%l\\\,%c):\ error\ CS%n:\ %m


"""""""""""""""""""""""""""""""""""""""""""""""""""
" utility functions
"""""""""""""""""""""""""""""""""""""""""""""""""""
function! NERDTreeVisible()
	if exists("b:NERDTreeType")
		return 1
	endif
	return 0
endfunction

function! GundoVisible()
	if (bufwinnr(bufnr("__Gundo__")) != -1 || bufwinnr(bufnr("__Gundo_Preview__")) != -1)
		return 1
	endif
	return 0
endfunction

function! TagbarVisible()
	if (bufwinnr("__Tagbar__") != -1)
		return 1
	endif
	return 0
endfunction

function! SidebarCycle()
	if NERDTreeVisible()
		NERDTreeClose
		TagbarOpen
	elseif TagbarVisible()
		TagbarClose
		GundoShow
	elseif GundoVisible()
		GundoHide
	else
		NERDTree
	endif
endfunction

function! RunPhpcs()
	let l:filename=@%
	let l:phpcs_output=system('phpcs --report=csv --standard=YMC '.l:filename)
	let l:phpcs_list=split(l:phpcs_output, "\n")
	unlet l:phpcs_list[0]
	cexpr l:phpcs_list
	cwindow
endfunction
