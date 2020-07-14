" use actual tab characters for indent
setlocal shiftwidth=4 tabstop=4 noexpandtab

" don't do vim-go vim version check
let g:go_version_warning = 0

" jump to the definition of the variable under the cursor
nnoremap <leader>d :GoDef<CR>

" jump to the type definition of the variable under the cursor
nnoremap <leader>t :GoDefType<CR>
