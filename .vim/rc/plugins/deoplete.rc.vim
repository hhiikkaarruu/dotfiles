let g:deoplete#auto_complete_delay = 0
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_camel_case = 0
let g:deoplete#enable_ignore_case = 0
let g:deoplete#enable_refresh_always = 0
let g:deoplete#auto_refresh_delay = 100
let g:deoplete#enable_smart_case = 1
let g:deoplete#file#enable_buffer_path = 1
let g:deoplete#max_list = 10000

inoremap <expr><C-k> pumvisible() ? deoplete#close_popup() : ""
inoremap <expr><C-g> deoplete#smart_close_popup()
inoremap <expr><C-f> deoplete#complete_common_string()
