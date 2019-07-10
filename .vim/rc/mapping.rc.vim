" ,をリーダーに設定
let mapleader = ','
noremap \ ,
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;
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
" 今開いているタブだけに
nnoremap <silent> to :<C-u>tabo<CR>
" タブを閉じて左のタブにフォーカス
nnoremap <silent> tr :<C-u>call CloseTab()<CR>
function! CloseTab()
	let current_tabno = tabpagenr()
	let max_tabno = tabpagenr('$')
	exec 'tabc'
	if current_tabno != max_tabno
		exec 'tabp'
	endif
endfunction
" タブ複製
nnoremap tt <C-w>v<C-w>T
" tab
nnoremap tf :<C-u>tabf 
" タブ移動マッピング
nnoremap <silent> tl :<C-u>tabn<CR>
nnoremap <silent> th :<C-u>tabp<CR>
" gfをタブで開く
nnoremap gf <C-w>gf
nnoremap gF <C-w>gF
" <cword>grep結果をタブで開く
nnoremap <silent> gc <C-w>v<C-w>T:<C-u>grep -rn <C-R>=expand('<cword>')<CR> * <CR>
" タグジャンプ結果をタブで開く
nnoremap <silent> <C-]> :<C-u>tab stj <C-R>=expand('<cword>')<CR><CR>
" ウィンドウ関連
nnoremap s  <Nop>
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
nnoremap <silent> { :call search('^'. matchstr(getline('.'), '\(^\s*\)') .'\%<' . line('.') . 'l\S', 'be')<CR>
nnoremap <silent> } :call search('^'. matchstr(getline('.'), '\(^\s*\)') .'\%>' . line('.') . 'l\S', 'e')<CR>
" 検索結果を画面中央に
nnoremap n nzz
nnoremap N Nzz
" 単語の検索を楽に
nnoremap <Leader>/ /\<\><Left><Left>
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
" terminalのEsc
tnoremap <silent> <Esc> <C-\><C-n>
tnoremap <silent> jj <C-\><C-n>
tnoremap <silent> <C-j> <C-\><C-n><C-w>j
tnoremap <silent> <C-k> <C-\><C-n><C-w>k
tnoremap <silent> <C-h> <C-\><C-n><C-w>h
tnoremap <silent> <C-l> <C-\><C-n><C-w>l
" terminalショートカット
nnoremap <silent> st <C-w>s:<C-u>terminal<CR>i
" バッファ
nnoremap <silent> <C-n> :<C-u>bnext<CR>
nnoremap <silent> <C-p> :<C-u>bprev<CR>
