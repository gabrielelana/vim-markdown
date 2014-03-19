if exists('b:markdown_default_mappings_loaded') | finish | endif
if !exists('g:markdown_include_default_mappings') || !g:markdown_include_default_mappings | finish | endif

nnoremap <buffer> <Leader>e :MdEditCodeBlock<CR>
vnoremap <buffer> <Leader>e :MdEditCodeBlock<CR>

if exists('g:markdown_include_insert_mode_default_mappings') && g:markdown_include_insert_mode_default_mappings
  inoremap <buffer> <Leader>e <Esc>:MdEditCodeBlock<CR>
endif

let b:markdown_default_mappings_loaded = 1
