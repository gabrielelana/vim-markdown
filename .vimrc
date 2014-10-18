" autoload the local .vimrc file you need to have
" https://github.com/MarcWeber/vim-addon-local-vimrc
" plugin installed

" clean and reload the markdown syntax in the current buffer
nnoremap <silent> <Leader>r :
  \ if expand('%:e') ==# 'md' <BAR>
  \   syn clear <BAR>
  \   unlet! b:did_ftplugin <BAR>
  \   unlet! b:current_syntax <BAR>
  \   let g:markdown_enable_mappings = 1 <BAR>
  \   let g:markdown_enable_insert_mode_mappings = 1 <BAR>
  \   let g:markdown_include_jekyll_support = 1 <BAR>
  \   let g:markdown_enable_folding = 0 <BAR>
  \   source syntax/markdown.vim <BAR>
  \   source syntax/markdown_jekyll.vim <BAR>
  \   source autoload/markdown.vim <BAR>
  \   source ftplugin/markdown.vim <BAR>
  \ endif <CR>

nnoremap <silent><buffer> <Leader>k :
  \ let b:kramdown_input = expand('%:p') <BAR>
  \ let b:kramdown_output = tempname() . '.html' <BAR>
  \ call system('bundle exec kramdown ' . shellescape(b:kramdown_input) . ' > ' . shellescape(b:kramdown_output)) <BAR>
  \ execute 'split ' . b:kramdown_output
  \ <CR>

" display all the highgligh groups with relative colors
nnoremap <silent> <Leader>g :source $VIMRUNTIME/syntax/hitest.vim<CR>

" tells you just what syntax highlighting groups the item under the cursor actually is
nnoremap <silent> <Leader>h :echo
      \ "hi<" . synIDattr(synID(line("."),col("."),1),"name") . "> " .
      \ "trans<" . synIDattr(synID(line("."),col("."),0),"name") . "> " .
      \ "lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" tells you more information about the highlighting group of the item under cursor
let s:cpo_save = &cpo
source .hilinks.vim
nnoremap <silent> <Leader>t :HLT!<CR>
let &cpo = s:cpo_save
unlet s:cpo_save

if filereadable(expand("./.session.vim"))
  execute "source " . expand("./.session.vim")
  bufdo execute "normal " . mapleader . "r<CR>"
endif
