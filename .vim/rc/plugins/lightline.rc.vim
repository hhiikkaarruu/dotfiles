let g:lightline = {
			\ 'colorscheme': 'jellybeans',
			\ 'mode_map': {'c': 'NORMAL'},
			\ 'active': {
			\ 	'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename', 'currenttag', 'currentbranch' ] ]
			\ },
			\ 'component': {
			\ 'lineinfo': "\u2668 %3l:%-2v",
			\ },
			\ 'component_function': {
			\ 'modified': 'LightlineModified',
			\ 'readonly': 'LightlineReadonly',
			\ 'fugitive': 'LightlineFugitive',
			\ 'filename': 'LightlineFilename',
			\ 'currenttag': 'LightlineZCurrenttag',
			\ 'currentbranch': 'LightlineCurrentbranch',
			\ 'fileformat': 'LightlineFileformat',
			\ 'filetype': 'LightlineFiletype',
			\ 'fileencoding': 'LightlineFileencoding',
			\ 'mode': 'LightlineMode'
			\ },
			\ 'separator': { 'left': "▶︎", 'right': "◀︎"}, 
			\ 'subseparator': { 'left': "\u1433", 'right': "\u1438"}
			\ }

function! LightlineModified()
	return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightlineReadonly()
	return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '🔒' : ''
endfunction

function! LightlineFilename()
	return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
				\ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
				\  &ft == 'unite' ? unite#get_status_string() :
				\  &ft == 'vimshell' ? vimshell#get_status_string() : 
				\  '' != expand('%:t') ? expand('%:t') : '[No Name]') .
				\ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

function! LightlineCurrenttag()
	return tagbar#currenttag('%s', '')
endfunction

function! LightlineCurrentbranch()
	return vcs#info("<%s> %r:%b", "<%s> %r:%b")
endfunction

function! LightlineFugitive()
	if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
		return fugitive#head()
	else
		return ''
	endif
endfunction

function! LightlineFileformat()
	return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
	return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightlineFileencoding()
	return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightlineMode()
	return winwidth(0) > 60 ? lightline#mode() : ''
endfunction
