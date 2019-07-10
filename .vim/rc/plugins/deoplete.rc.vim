inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS>  deoplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-g> deoplete#refresh()
inoremap <expr><C-e> deoplete#cancel_popup()
inoremap <expr><C-f> deoplete#complete_common_string()
inoremap <expr> <C-d> pumvisible() ? deoplete#close_popup() : ""

call deoplete#custom#source('_', 'matchers',
			\ ['matcher_fuzzy', 'matcher_length'])

call deoplete#custom#source('_', 'converters', [
      \ 'converter_remove_paren',
      \ 'converter_remove_overlap',
      \ 'matcher_length',
      \ 'converter_truncate_abbr',
      \ 'converter_truncate_menu',
      \ 'converter_auto_delimiter',
      \ ])

call deoplete#custom#option('keyword_patterns', {
      \ '_': '[a-zA-Z_]\k*\(?',
      \ 'tex': '[^\w|\s][a-zA-Z_]\w*',
      \ })

call deoplete#custom#option('camel_case', v:true)
call deoplete#custom#option('refresh_always', v:true)

