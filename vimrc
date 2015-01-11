let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle..."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let iCanHazVundle=0
endif
filetype off " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'authorinfo'
Bundle 'a-vim'
Bundle 'DoxygenToolkit'
"Bundle 'visualmark'
Bundle 'gmarik/vundle'
"color
Bundle 'vim-colors-solarized'
Bundle 'mbbill/desertEx'
Bundle 'Impact'
Bundle 'matrix.vim'
Bundle 'vibrantink'
Bundle 'vividchalk.vim'
Bundle 'molokai'
""plugin
Bundle 'DataWraith/auto_mkdir'
Bundle 'TagHighlight'
"Bundle 'mbbill/echofunc'
"Bundle 'code_complete'
Bundle 'Townk/vim-autoclose'
Bundle 'Twinside/vim-cuteErrorMarker'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'tmhedberg/indent-motion'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'OmniCppComplete'
Bundle 'vim-airline'
Bundle 'supertab'
Bundle 'vim-surround'
Bundle 'tagbar'
Bundle 'tlib_vim'
Bundle 'vim-addon-mw-utils'
Bundle 'indentLine'
"Bundle 'minibufexpl'
Bundle 'project'
Bundle 'neocomplcache'
Bundle 'neosnippet.vim'
Bundle 'pep8'
Bundle 'csapprox'
"Bundle 'python-mode'
Bundle 'pydiction'
Bundle 'vim-term'

" General Settings

set laststatus=2   " Always show the statusline
set showcmd
set cmdheight=1
set nocompatible	" not compatible with the old-fashion vi mode
set bs=2		" allow backspacing over everything in insert mode
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set autoread		" auto read when file is changed from outside
set nu
set mouse=h



filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

au BufEnter /usr/include/c++/* setf cpp

function! VisualSearch(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"
    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")
    if a:direction == 'b'
        execute "normal ?" . l:pattern . "<cr>"
    else
        execute "normal /" . l:pattern . "<cr>"
    endif
    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>  

"map gf :tabnew <cfile><cr>
map gf :IHV<cr>

" auto reload vimrc when editing it
autocmd! bufwritepost .vimrc source ~/.vimrc

syntax enable
syntax on		" syntax highlight
set hlsearch		" search highlighting
"nm<Space> i<space><Esc>l

set background=dark
set t_Co=256
"let g:solarized_termcolors=256
"colorscheme solarized
colorscheme molokai
let g:rehash256 = 1

"let g:airline_section_b = '%{strftime("%d")}'
"let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts=1
let g:airline_enable_branch= 1
"let g:airline_theme= "solarized"
let g:airline_enable_syntastic=1
let g:airline_detect_paste= 1
""" powerline symbols
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = '¶'
""""let g:airline_left_sep = 'ρ'
"let g:airline_right_sep = '«'
let g:airline_right_sep = 'Þ'
"let g:airline_symbols.linenr = '␊'
"""let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
"""let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.paste = 'ρ'
""let g:airline_symbols.paste = 'Þ'
""let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" terminal color settings
"set background=dark
"colorscheme desertEx
set cursorline         " highlight current line
"hi CursorLine  term=reverse cterm=reverse ctermbg=darkred ctermfg=black guibg=blue guifg=white
"hi CursorLine  term=none cterm=none ctermbg=none ctermfg=white guibg=blue guifg=white
"hi CursorLine  term=none ctermfg=none ctermbg=8 gui=bold,reverse



set guioptions-=T
set clipboard=unnamed	" yank to the system register (*) by default
set showmatch		" Cursor shows matching ) and }
set showmode		" Show current mode
set wildchar=<TAB>	" start wild expansion in the command line using <TAB>
set wildmenu            " wild char completion menu

" ignore these files while expanding wild chars
set wildignore=*.o,*.class,*.pyc

set autoindent		" auto indentation
set incsearch		" incremental search
set nobackup		" no *~ backup files
set copyindent		" copy the previous indentation on autoindenting
set ignorecase		" ignore case when searching
set smartcase		" ignore case if search pattern is all lowercase,case-sensitive otherwise
set smarttab		" insert tabs on the start of a line according to context

" disable sound on errors
set noerrorbells
set novisualbell
set vb t_vb=
set tm=500

" TAB setting{
set expandtab        "replace <TAB> with spaces
set softtabstop=4
set shiftwidth=4

au FileType Makefile set noexpandtab


" C/C++ specific settings
autocmd FileType c,cpp,cc,h set cindent comments=sr:/*,mb:*,el:*/,:// cino=>s,e0,n0,f0,{0,}0,^0,:s,=s,g0,h1s,ps,t0,+s,(0,ms,)20,*30

"Restore cursor to file position in previous editing session
set viminfo='10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

    "--------------------------------------------------------------------------- 
    " Tip #382: Search for <cword> and replace with input() in all open buffers 
    "--------------------------------------------------------------------------- 
fun! Replace() 
    let s:word = input("Replace " . expand('<cword>') . " with:") 
    :exe 'bufdo! %s/\<' . expand('<cword>') . '\>/' . s:word . '/ge' 
    :unlet! s:word 
endfun 

"--------------------------------------------------------------------------- 
" USEFUL SHORTCUTS
"--------------------------------------------------------------------------- 
" set leader to ,
let mapleader=","
let g:mapleader=","

"replace the current word in all opened buffers
map <leader>s :call Replace()<CR>

map <leader>e ysiw
" open the error console
map <leader>ec :botright cope<CR> 
" move to next error
map <leader>] :cn<CR>
" move to the prev error
map <leader>[ :cp<CR>

" --- move around splits {
" move to and maximize the below split 
"map <C-J> <C-W>j<C-W>_
map <C-j> <ESC><C-w>j
map <C-k> <ESC><C-w>k
map <C-h> <ESC><C-w>h
map <C-l> <ESC><C-w>l
" move to and maximize the above split 
"map <C-K> <C-W>k<C-W>_
" move to and maximize the left split 
"nmap <c-h> <c-w>h<c-w><bar>
" move to and maximize the right split  
"nmap <c-l> <c-w>l<c-w><bar>
set wmw=0                     " set the min width of a window to 0 so we can maximize others 
set wmh=0                     " set the min height of a window to 0 so we can maximize others
" }

" move around tabs. conflict with the original screen top/bottom
" comment them out if you want the original H/L
" go to prev tab 
map <S-H> gT
" go to next tab
map <S-L> gt

" new tab
map <C-t><C-t> :tabnew<CR>
" close tab
map <C-t><C-w> :tabclose<CR> 

" ,/ turn off search highlighting
nmap <leader>/ :nohl<CR>

" allow multiple indentation/deindentation in visual mode
vnoremap < <gv
vnoremap > >gv

" ,g generates the header guard
map <leader>g :call IncludeGuard()<CR>
fun! IncludeGuard()
    let basename = substitute(bufname(""), '.*/', '', '')
    let guard = '_' . substitute(toupper(basename), '\.', '_', "H")
    call append(0, "#ifndef " . guard)
    call append(1, "#define " . guard)
    call append( line("$"), "#endif // for #ifndef " . guard)
endfun
" ,f format the c/c++ code
"map <leader>f :!astyle -A2 -S -p -U -k1 -x -M -w -L -s2 -o 

" Enable omni completion. (Ctrl-X Ctrl-O)
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType java set omnifunc=javacomplete#Complete

"" use syntax complete if nothing else available
"if has("autocmd") && exists("+omnifunc")
"    autocmd Filetype *
"                \	if &omnifunc == "" |
"                \		setlocal omnifunc=syntaxcomplete#Complete |
"                \	endif
"endif

"set cot-=preview "disable doc preview in omnicomplete

"" make CSS omnicompletion work for SASS and SCSS
"autocmd BufNewFile,BufRead *.scss             set ft=scss.css
"autocmd BufNewFile,BufRead *.sass             set ft=sass.css

"--------------------------------------------------------------------------- 
" ENCODING SETTINGS
"--------------------------------------------------------------------------- 
"set encoding=gb2312
set encoding=utf-8                                  
set termencoding=utf-8
"set termencoding=gb2312
"set fileencodings=utf-8,gb2312,ucs-bom,big5,latin1
"set fileencodings=ucs-bom,utf-8,big5,gb2312,latin1
set fileencodings=utf-8,gbk,ucs-bom,cp936


" --- EasyMotion
"let g:EasyMotion_leader_key = '<Leader>m' " default is <Leader>w
hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade  Comment


" --- TagBar
" toggle TagBar with F7
nnoremap <silent> <F7> :TagbarToggle<CR> 
nnoremap <silent> <F8> :NERDTreeToggle<CR> 
let NERDTreeQuitOnOpen = 0
" set focus to TagBar when opening it
let g:tagbar_autofocus = 0


set tags+=/home/ning.xue/.vim/my_tags/stl_cpp
set tags+=/home/ning.xue/svnprojects/include/tags
set tags+=/usr/include/tags
set tags+=/usr/local/include/tags

set path+=/usr/local/include
set path+=/usr/lib/gcc/x86_64-redhat-linux/4.4.7/include
set path+=/usr/include
set path+=/usr/lib/gcc/x86_64-redhat-linux/4.4.7/../../../../include/c++/4.4.7
set path+=/usr/lib/gcc/x86_64-redhat-linux/4.4.7/../../../../include/c++/4.4.7/x86_64-redhat-linux
set path+=/usr/lib/gcc/x86_64-redhat-linux/4.4.7/../../../../include/c++/4.4.7/backward
set path+=/usr/local/include
set path+=/usr/lib/gcc/x86_64-redhat-linux/4.4.7/include
set path+=/usr/include
set path+=/home/ning.xue/svnprojects/include
"SuperTab
let g:SuperTabMappingForward = '<tab>'
let g:SuperTabMappingBackward = '<s-tab>'
let g:SuperTabRetainCompletionType=2
"let g:SuperTabDefaultCompletionType="<C-X><C-O>"
let g:SuperTabDefaultCompletionType = "context"
" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD", "string", "vector", "map"]
let OmniCpp_SelectFirstItem = 2
" automatically open and close the popup menu / preview window
"au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview



let g:indentLine_color_term = 239  
let g:indentLine_color_gui = '#A4E57E'  
let g:indentLine_color_dark = 1
let g:indentLine_char = '¦' 

set cursorcolumn
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=darkgrey ctermbg=8 
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=black ctermbg=9
"map <F10> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ .<CR>





"let g:EchoFuncKeyPrev='<C-p>'
"let g:EchoFuncKeyNext='<C-n>'
"let g:EchoFuncShowOnStatus = 1
"let g:EchoFuncLangsUsed = ["c","java","cpp", 'javascript', 'python']
highlight Pmenu    guibg=darkgrey  guifg=black 
highlight PmenuSel guibg=lightgrey guifg=black
"hi Pmenu term=reverse ctermfg=3 ctermbg=8 gui=bold,reverse
"hi PmenuSel term=reverse ctermfg=3 ctermbg=8 gui=bold,reverse


nmap <F4> :AuthorInfoDetect<cr>
let g:vimrc_author='Xue Ning'  
let g:vimrc_email='ning.xue@duomi.com' 
let g:vimrc_homepage='http://www.vimer.cn' 

nmap <F3> :Dox <cr>
nmap <F2> :ConqueTermVSplit 

"doxygen setting
let g:DoxygenToolkit_authorName="Xue Ning, ning.xue@duomi.com"
let s:licenseTag = "Copyright(C)\<enter>"
let s:licenseTag = s:licenseTag . "For free\<enter>"
let s:licenseTag = s:licenseTag . "All right reserved\<enter>"
let g:DoxygenToolkit_licenseTag = s:licenseTag
let g:DoxygenToolkit_briefTag_funcName="yes"
let g:doxygen_enhanced_color=1

if !exists('g:neocomplcache_omni_patterns')
      let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"inoremap <expr><space>  pumvisible() ? neocomplcache#close_popup() . "\<SPACE>" : "\<SPACE>"
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()
"inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction

imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"
"let g:completekey = "<C-k>"   "code_complete hotkey"
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory='~/.vim/bundle/neosnippet-snippets/neosnippets/'



"set completeopt=menuone,menu,longest,preview
set completeopt=menuone,menu,preview
let g:neocomplcache_enable_at_startup = 1  
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_auto_select = 1 
let g:NeoComplCache_DisableAutoComplete = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
let g:neocomplcache_enable_auto_select = 1 
let g:neocomplcache_disableautocomplete = 1

let g:pep8_map = '<F6>'
let g:pydiction_location='~/.vim/bundle/pydiction/complete-dict' 
" Python-mode
" Activate rope
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)
let g:pymode_rope = 0
let g:pymode_rope_completion = 0

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0




" 更新ctags和cscope索引
map <F12> :call Do_CsTag()<cr>
function! Do_CsTag()
    let dir = getcwd()

    "先删除已有的tags和cscope文件，如果存在且无法删除，则报错。
    if ( DeleteFile(dir, "tags") ) 
        return 
    endif
    if ( DeleteFile(dir, "cscope.files") ) 
        return 
    endif
    if ( DeleteFile(dir, "cscope.out") ) 
        return 
    endif

    if(executable('ctags'))
        silent! execute "!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q ."
    endif
    if(executable('cscope') && has("cscope") )
        if(g:isWin)
            silent! execute "!dir /s/b *.c,*.cpp,*.h,*.java,*.cs >> cscope.files"
        else
            silent! execute "!find . -iname '*.[ch]' -o -name '*.cpp' > cscope.files"
        endif
        silent! execute "!cscope -b"
        execute "normal :"
        if filereadable("cscope.out")
            execute "cs add cscope.out"
        endif
    endif
    " 刷新屏幕
    execute "redr!"
endfunction

function! DeleteFile(dir, filename)
    if filereadable(a:filename)
        if (g:isWin)
            let ret = delete(a:dir."\\".a:filename)
        else
            let ret = delete("./".a:filename)
        endif
        if (ret != 0)
            echohl WarningMsg | echo "Failed to delete ".a:filename | echohl None
            return 1
        else
            return 0
        endif
    endif
    return 0
endfunction

" cscope 绑定
if has("cscope")
    set csto=1
    set cst
    set nocsverb
    if filereadable("cscope.out")
        cs add cscope.out
    endif
    set csverb
    " s: C语言符号  g: 定义     d: 这个函数调用的函数 c: 调用这个函数的函数
    " t: 文本       e: egrep模式    f: 文件     i: include本文件的文件
    nmap <leader>ss :cs find s <C-R>=expand("<cword>")<CR><CR>:copen<CR>
    nmap <leader>sg :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <leader>sc :cs find c <C-R>=expand("<cword>")<CR><CR>:copen<CR>
    nmap <leader>st :cs find t <C-R>=expand("<cword>")<CR><CR>:copen<CR>
    nmap <leader>se :cs find e <C-R>=expand("<cword>")<CR><CR>:copen<CR>
    nmap <leader>sf :cs find f <C-R>=expand("<cfile>")<CR><CR>:copen<CR>
    nmap <leader>si :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>:copen<CR>
    nmap <leader>sd :cs find d <C-R>=expand("<cword>")<CR><CR>:copen<CR>
endif
