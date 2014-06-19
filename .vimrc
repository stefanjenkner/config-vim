execute pathogen#infect()
syntax on
filetype plugin indent on

set nu
set wrap

" disable?
"runtime! plugin/sensible.vim
"runtime! plugin/vim-xpath.vim

"set ttyfast
"set mouse=a
"set ttymouse=xterm2

"let g:GPGExecutable = 'gpg'
"let g:GPGUseAgent = 1
"let g:GPGPreferArmor = 1

"set modeline
"set modelines=4

" https://coderwall.com/p/a8akca
" To spell check all git commit messages
au BufNewFile,BufRead COMMIT_EDITMSG set spell spelllang=de,en
" Underline misspelled words
hi clear SpellBad
hi SpellBad cterm=underline
