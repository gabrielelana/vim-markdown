" autoload the local .vimrc file you need to have
" https://github.com/MarcWeber/vim-addon-local-vimrc
" plugin installed

" clean and reload the markdown syntax in the current buffer
nnoremap <silent> <Leader>r :
  \ if expand('%:e') ==# 'md' <BAR>
  \   syn clear <BAR>
  \   unlet! b:did_ftplugin <BAR>
  \   unlet! b:current_syntax <BAR>
  \   unlet! g:markdown_edit_code_blocks <BAR>
  \   unlet! g:markdown_include_jekyll_support <BAR>
  \   source syntax/markdown.vim <BAR>
  \   source syntax/markdown_jekyll.vim <BAR>
  \   source ftplugin/markdown.vim <BAR>
  \   source ftplugin/markdown_edit_code_blocks.vim <BAR>
  \   let g:markdown_include_jekyll_support = 1 <BAR>
  \ endif <CR>

augroup MdAdvisedMappings
  autocmd!
  autocmd FileType markdown nnoremap <buffer> <Leader>e :MdEditCodeBlock<CR>
  autocmd FileType markdown vnoremap <buffer> <Leader>e :'<,'>MdEditCodeBlock<CR>
augroup END


" display all the highgligh groups with relative colors
nnoremap <silent> <Leader>g :source $VIMRUNTIME/syntax/hitest.vim<CR>

" tells you just what syntax highlighting groups the item under the cursor actually is
nnoremap <silent> <Leader>h :echo
      \ "hi<" . synIDattr(synID(line("."),col("."),1),"name") . "> " .
      \ "trans<" . synIDattr(synID(line("."),col("."),0),"name") . "> " .
      \ "lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" tells you more information about the highlighting group of the item under cursor
source .hilinks.vim
nnoremap <silent> <Leader>t :HLT!<CR>

if filereadable(expand("./.session.vim"))
  execute "source " . expand("./.session.vim")
  bufdo execute "normal " . mapleader . "r<CR>"
endif
