call pathogen#infect()
syntax on
filetype plugin indent on

"nmap <leader>sw<left>  :topleft  vnew<CR>
"nmap <leader>sw<right> :botright vnew<CR>

set wildmenu                  " Menu completion in command mode on <Tab>
set wildmode=full

" Enable folding
"set foldmethod=indent
"set foldlevel=99
"
" Enable folding with the spacebar
"nnoremap <space> za

let g:syntastic_python_checkers = ['python']
"let g:syntastic_python_checkers = ['flake8']
"let g:syntastic_python_checkers = ['pylint']
let g:syntastic_python_flake8_exe = 'python -m flake8'


set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

au BufNewFile * startinsert	" open new files in insert mode

augroup Shebang
  autocmd BufNewFile *.py 0put =\"#!/usr/bin/env python\<nl># -*- coding: iso-8859-15 -*-\<nl>\"|$
  autocmd BufNewFile *.rb 0put =\"#!/usr/bin/env ruby\<nl># -*- coding: None -*-\<nl>\"|$
  autocmd BufNewFile *.tex 0put =\"%&plain\<nl>\"|$
  autocmd BufNewFile *.\(cc\|hh\) 0put =\"//\<nl>// \".expand(\"<afile>:t\").\" -- \<nl>//\<nl>\"|2|start!
  autocmd BufNewFile *.sh 0put =\"#!/bin/sh -\"|$	
augroup END

autocmd BufLeave * if @% == '.vimrc' | echo 'configuration updated!' | else | echo 'PASS' | endif
"autocmd BufLeave *.vimrc echo 'configuration updated!'

function Foovenv()
  let g:syntastic_python_python_exec = '/home/starq/REP/DEV/python/foo-venv/bin/python'
endfunction
