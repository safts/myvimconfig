" leader shortcut
let mapleader=","

set background=dark
colorscheme badwolf         	" awesome colorscheme

syntax enable                 	" enable syntax processing

set expandtab                   " tabs are spaces
set shiftwidth=4
set softtabstop=4

set number                      " show line numbers
set showcmd                     " show command in bottom bar
set cursorline                  " highlight current line

" cursorline config
:hi CursorLine ctermfg=White ctermbg=Yellow cterm=bold guifg=white guibg=yellow gui=bold

" new splits will open to the right of the current buffer
set splitright

" new splits will open below the current buffer
set splitbelow

" start pathogen to load plugins
execute pathogen#infect()

" highlight searches (use :noh to remove highlights)
set hlsearch
hi Search guibg=Yellow

" set to make vim follow terminal background settings
hi Normal ctermbg=none         
hi nonText ctermbg=none

" disable line numbers highlight color
hi LineNr ctermbg=none

filetype plugin indent on
autocmd Filetype htmldjango setlocal ts=2 sts=2 sw=2 expandtab

set wildmenu                   " visual autocomplete for command menu

" NerdTree toggle
map <C-n> :NERDTreeToggle<CR>
" NERDTree ignore .pyc
let NERDTreeIgnore = ['\.pyc$']


" ctrlp.vim ignore .gitignore files
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" highlight last inserted text
nnoremap gV `[v`]

" move between splits  with C-j, C-k etc instead of C-w, C-j etc
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


" this uses system clipboard instead of vim's registers
" http://stackoverflow.com/questions/11489428/how-to-make-vim-paste-from-and-copy-to-systems-clipboard
" :help registers
set clipboard=unnamed

" highlight text over 80 characters
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/


" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" shorcut to remote trailing whitespaces
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>


" HARDCORE MODE: ON
" (disable arrow keys, mouse scrollwhell)
for prefix in ['i', 'n', 'v']
  for key in ['<Up>', '<Down>', '<Left>', '<Right>']
    exe prefix . "noremap " . key . " <Nop>"
  endfor
endfor


" Syntastic options
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_auto_loc_list = 0


" always show statusbar
:set laststatus=2
" use patched fonts
let g:airline_powerline_fonts = 1
