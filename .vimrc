execute pathogen#infect()
" To disable plugins...
"runtime! plugin/sensible.vim
"runtime! plugin/vim-xpath.vim

filetype plugin indent on
syntax on
set nu
"set wrap

" https://github.com/plasticboy/vim-markdown
"let g:vim_markdown_folding_disabled=1
"let g:vim_markdown_initial_foldlevel=1

" http://vim.wikia.com/wiki/Using_the_mouse_for_Vim_in_an_xterm
"set ttyfast
"set mouse=a
"set ttymouse=xterm2

" http://www.vim.org/scripts/script.php?script_id=3645
"let g:GPGExecutable = 'gpg'
"let g:GPGUseAgent = 1
"let g:GPGPreferArmor = 1

" Underline misspelled words
hi clear SpellBad
hi SpellBad cterm=underline

" To spell check all git commit messages
" https://coderwall.com/p/a8akca
au BufNewFile,BufRead COMMIT_EDITMSG set spell spelllang=de,en

