let mapleader = ','
noremap \ ,

" for english keyboard
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

nnoremap  <C-j> <ESC>
vnoremap  <C-j> <ESC>

inoremap <silent> kj <ESC>

nnoremap <silent> * *N

nnoremap ZZ <Nop>
nnoremap ZQ <Nop>

nnoremap Y y$

" show full path on <C-g>
nnoremap <C-g> 1<C-g>

" for :grep
nnoremap <silent> <C-n> :<C-u>cn<CR>
nnoremap <silent> <C-p> :<C-u>cp<CR>
nnoremap gr :<C-u>grep 

" forcus to left tab when tab close
nnoremap <silent> tr :<C-u>call CloseTab()<CR>
function! CloseTab()
	let current_tabno = tabpagenr()
	let max_tabno = tabpagenr('$')
	exec 'tabc'
	if current_tabno != max_tabno
		exec 'tabp'
	endif
endfunction

" duplicate tab
nnoremap tt <C-w>v<C-w>T

" open file in new tab
nnoremap tf :<C-u>tabf 

" tab move
nnoremap <silent> tl :<C-u>tabn<CR>
nnoremap <silent> th :<C-u>tabp<CR>

" open tab on gf
nnoremap gf <C-w>gf
nnoremap gF <C-w>gF

" open in tab on <cword>grep
nnoremap <silent> gc <C-w>v<C-w>T:<C-u>grep -rn <C-R>=expand('<cword>')<CR> * <CR>

" open in tab on tab jump
nnoremap <silent> <C-]> :<C-u>tab stj <C-R>=expand('<cword>')<CR><CR>

" window move
nnoremap s  <Nop>
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" window size
nnoremap s= <C-w>=
nnoremap s> <C-w>>
nnoremap s< <C-w><
nnoremap s+ <C-w>+
nnoremap s- <C-w>-

" window split
nnoremap <silent> ss :<C-u>split<CR>
nnoremap <silent> sv :<C-u>vsplit<CR>

" move same indent
nnoremap <silent> { :call search('^'. matchstr(getline('.'), '\(^\s*\)') .'\%<' . line('.') . 'l\S', 'be')<CR>
nnoremap <silent> } :call search('^'. matchstr(getline('.'), '\(^\s*\)') .'\%>' . line('.') . 'l\S', 'e')<CR>

nnoremap n nzz
nnoremap N Nzz

" word search
nnoremap <Leader>/ /\<\><Left><Left>

nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" terminal setting
tnoremap <silent> <Esc> <C-\><C-n>
tnoremap <silent> jj <C-\><C-n>
tnoremap <silent> <C-j> <C-\><C-n><C-w>j
tnoremap <silent> <C-k> <C-\><C-n><C-w>k
tnoremap <silent> <C-h> <C-\><C-n><C-w>h
tnoremap <silent> <C-l> <C-\><C-n><C-w>l
nnoremap <silent> st <C-w>s:<C-u>terminal<CR>i

nnoremap <silent> <C-n> :<C-u>bnext<CR>
nnoremap <silent> <C-p> :<C-u>bprev<CR>
