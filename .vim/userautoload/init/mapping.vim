" ,をリーダーに設定
let mapleader = ","
noremap \ ,
" USキーボード用
nnoremap ; :
nnoremap : ;
" 思い立ったらすぐvimrc
nnoremap <silent> <F2> :<C-u>tabf	$MYVIMRC<CR>
nnoremap <silent> <F3> :<C-u>source	$MYVIMRC<CR>
" Ctrl+jでEsc
noremap  <C-j> <ESC>
noremap! <C-j> <ESC>
" インサート中はjjでもエスケープ可能
inoremap <silent> jj <ESC>
" *をした箇所にカーソルが移動するようにする
nnoremap <silent> * *N
" ZZとZQ無効
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>
" Yにy$(カーソル位置から後ろをヤンク)をマッピング
nnoremap Y y$
" <C-g>でフルパス表示に
nnoremap <C-g> 1<C-g>
" :grepの結果を次々と
nnoremap <silent> <C-n> :<C-u>cn<CR>
nnoremap <silent> <C-p> :<C-u>cp<CR>
" grep love
nnoremap gr :<C-u>grep 
" タブ関連
nnoremap <silent> to :<C-u>tabo<CR>
" タブ複製
nnoremap <Leader>t <C-w>v<C-w>T
" tab最高
nnoremap tf :<C-u>tabf 
" タブ移動マッピング
nnoremap <silent> tl :<C-u>tabn<CR>
nnoremap <silent> th :<C-u>tabp<CR>
" <cword>grep結果をタブで開く
nnoremap <silent> gc <C-w>v<C-w>T:<C-u>grep <C-R>=expand('<cword>')<CR><CR>
" タブを閉じて左にフォーカス コメント化理由：右端のタブを閉じたときに無駄に左に行っちゃう
" nnoremap <silent> tc :<C-u>tabc<CR>:<C-u>tabp<CR>
" ウィンドウ関連
" ウィンドウ移動をマッピング
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
" ウィンドウ大きさ変更
nnoremap s= <C-w>=
nnoremap s> <C-w>>
nnoremap s< <C-w><
nnoremap s+ <C-w>+
nnoremap s- <C-w>-
" ウィンドウ分割
nnoremap <silent> ss :<C-u>split<CR>
nnoremap <silent> sv :<C-u>vsplit<CR>
" 同じ高さのインデントへ移動
nnoremap <silent> { k:<C-u>call search("^". matchstr(getline(line("." + 1)), '\(\s*\)') ."\\S")<CR>^
nnoremap <silent> } :<C-u>call search("^". matchstr(getline(line(".")), '\(\s*\)') ."\\S")<CR>^
