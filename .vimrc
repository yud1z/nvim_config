set encoding=utf8
set guifontwide=NSimSun
" set autochdir
"cd %:h
let NERDTreeChDirMode=2

set undofile                " Save undo's after file closes
set undodir=$HOME/.undo " where to save undo histories
let g:langpair="ru" 

filetype plugin on
execute pathogen#infect()

set clipboard=unnamed

call pathogen#helptags()

" auto vimrc
autocmd! bufwritepost .vimrc source %

"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" untuk buffer explorer
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:DisableAutoPHPFolding = 1

" ctrl Marking browser
noremap   <C-y> :MarksBrowser<CR>
vnoremap  <C-y> :MarksBrowser<CR>
inoremap  <C-y> :MarksBrowser<CR>


" ctrl P shortcut
noremap   <C-f> :CtrlP<CR>
vnoremap  <C-f> :CtrlP<CR>
inoremap  <C-f> :CtrlP<CR>


set backupdir=~/vimtmp,.
set directory=~/vimtmp,.

set nocompatible
set hidden

"source $VIMRUNTIME/vimrc_example.vim

"ganti warna skema
syntax enable

"set t_Co=16
if has("gui_running")
	let g:solarized_termcolors=16
	set background="dark"
	colorscheme solarized
endif

"set contrast=low
"colorscheme default 

"menu bar
:set guioptions+=m
"set guifont=Monaco\ 12
"set guifont=Monaco:h12

"back to normal
inoremap <C-x> <ESC>
vnoremap <C-x> <ESC>
nnoremap <C-x> <ESC>

"untuk hide toolbar
set guioptions-=T

"untuk simpan
noremap   <C-E> :wall<CR>:mksession! ~/session.vim<CR>
imap      <C-E> <ESC><C-E>:updatei<CR>:mksession! ~/session.vim<CR>li
vnoremap  <C-E> :wall<CR>:mksession! ~/session.vim<CR>
inoremap  <C-E> :wall<CR>:mksession! ~/session.vim<CR>

"untuk simpan
noremap   <C-S> :wall<CR>:mksession! ~/session.vim<CR>
imap      <C-S> <SSC><C-S>:updatei<CR>:mksession! ~/session.vim<CR>li
vnoremap  <C-S> :wall<CR>:mksession! ~/session.vim<CR>
inoremap  <C-S> :wall<CR>:mksession! ~/session.vim<CR>

"code movement
vnoremap < <gv
vnoremap > >gv

"untuk tutup buffer
noremap   <silent> <C-Q> :bd<CR>
imap      <C-Q> <ESC><C-Q>:bd<CR>
imap      <C-Q> <ESC><C-Q>:bd<CR>

"pindah buffer
noremap   <silent> <C-tab> :bnext<CR>
imap      <C-tab> <ESC><C-tab>:bnext<CR>

"duplicate line
noremap   <silent> <C-A> yyp<CR>
imap      <C-A> <ESC>yyp<CR>i
vmap      <C-A> yyp

"clipboard
set clipboard=unnamed

"set mouse
set mouse=a

"map leader
let mapleader = ","

"no highlight after search
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>

"Delete a word forward in the insert mode
inoremap <C-d> <S-Right><C-w>

"Keep search pattern at the center of the screen
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

"hide scrollbar
set guioptions-=r

""move cursor when insert mode
"imap <C-h> <C-o>h
"imap <C-j> <C-o>j
"imap <C-k> <C-o>k
"imap <C-l> <C-o>l

"Remap U to <C-r> for easier redo
nnoremap U <C-r>

"toggle list toggle
"noremap   <silent> <C-g> :TlistToggle<CR>

"Clipboard copy mac's vim
":vmap <C-c> :w !pbcopy<CR><CR>

"toggle list NerdTRee
noremap   <silent> <C-i> :NERDTreeToggle<CR>

"copas kaya di windows
nmap <C-V> "+gp
imap <C-V> <ESC><C-V>i
vmap <C-C> "+y
vmap <C-X> "+xhjhjhj

"ada mini buffer dibawah
"set laststatus=2

"untuk otomasi lokasi file
set autochdir

"set default lokasi
"cd /var/www

:noremap <D-s-left> :bprev<CR> 
:noremap <D-s-right> :bnext<CR>

"untuk dokumentasi
"source /home/garena/.vim/php-doc.vim
"vnoremap <C-i> :call PhpDocRange()<CR> 

nnoremap <silent> <Leader>= :vertical resize +10<CR>,
nnoremap <silent> <Leader>+ :resize +10<CR>,
nnoremap <silent> <Leader>- :vertical resize -10<CR>,
nnoremap <silent> <Leader>_ :resize -10<CR>,

nmap <C-h> :TagbarToggle<CR> 

let g:langpair="en" 
let g:vtranslate="T" 

" The Silver Searcher
 if executable('ags')
   " Use ag over grep
     set grepprg=ags\ --nogroup\ --nocolor

       " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
         let g:ctrlp_user_command = 'ags %s -l --nocolor -g ""'

   "ag is fast enough that CtrlP doesn't need to cache
     let g:ctrlp_use_caching = 0
     endif

" bind K to grep word under cursor
 nnoremap J :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" bind \ (backward slash) to grep shortcut
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!

nnoremap \ :Ag<SPACE>

nnoremap <C-x> :FloatermToggle<cr>
tnoremap <C-x> <C-\><C-n>:FloatermToggle<cr>
