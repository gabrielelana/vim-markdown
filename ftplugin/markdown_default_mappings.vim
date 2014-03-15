if exists('b:markdown_default_mappings_loaded') | finish | endif
if !exists('g:markdown_include_default_mappings') || !g:markdown_include_default_mappings | finish | endif

nnoremap <buffer> <Leader>e :MdEditCodeBlock 'N'<CR>
vnoremap <buffer> <Leader>e :MdEditCodeBlock 'V'<CR>

let b:markdown_default_mappings_loaded = 1
