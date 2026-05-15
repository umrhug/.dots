"
" keybind and macro
"
inoremap jj <Esc>

vnoremap ; :
vnoremap : ;

nnoremap ; :
nnoremap : ;

"nnoremap [b :bprevious<CR>
"nnoremap ]b :bnext<CR>
"nnoremap <silent> <c-h> :<c-w>h<CR>
"nnoremap <silent> <c-l> :<c-w>l<CR>
"nnoremap <silent> <c-j> :<c-w>j<CR>
"nnoremap <silent> <c-k> :<c-w>k<CR>

nnoremap [q :cprevious<CR>
nnoremap ]q :cnext and macro<CR>
nnoremap [Q :<C-u>cfirst<CR>
nnoremap ]Q :<C-u>clast<CR>

nnoremap j  gj
nnoremap gj j
nnoremap k  gk
nnoremap gk k
nnoremap J  gJ
nnoremap gJ J

"map gb :ls<CR>:buf
"map db :ls<CR>:bdel

nmap n  nzz
nmap N  Nzz
nmap *  *zz
nmap #  #zz
nmap g* g*zz
nmap g# g#zz

nnoremap <C-]> g<C-]>

imap <c-x> <DEL>
imap <c-a> <HOME>
imap <c-e> <END>
imap <c-l> <RIGHT>
imap <c-j> <DOWN>
imap <c-k> <UP>
imap <c-h> <LEFT>

imap {} {}<LEFT>
imap () ()<LEFT>
imap [] []<LEFT>
imap <> <><LEFT>
imap "" ""<LEFT>
imap '' ''<LEFT>

