" leader
let mapleader = ","

" https://github.com/tpope/vim-sensible - defaults everyone can agree on, plus...
filetype plugin indent on
syntax on
set ruler
set number
set wildmenu
set history=1000
set visualbell
set hlsearch
set incsearch
set noshowmode
set completeopt=menu,menuone,noselect

" built-in comment plugin
packadd! comment

" http://vim.wikia.com/wiki/Using_the_mouse_for_Vim_in_an_xterm
set title
if $TERM_PROGRAM == "iTerm.app"
  set mouse=a
  set ttymouse=sgr
  set clipboard=autoselect
elseif $TERM_PROGRAM == "Apple_Terminal"
  set mouse=a
  set ttymouse=sgr
  set clipboard=autoselect
elseif $TERM == "xterm-256color"
  set mouse=a
  set ttymouse=sgr
elseif $TERM == "tmux-256color"
  set mouse=a
  set ttymouse=xterm2
endif

" underline misspelled words
hi clear SpellBad
hi SpellBad cterm=underline
" to spell check all git commit messages
au BufNewFile,BufRead COMMIT_EDITMSG set spell spelllang=de,en

" https://draculatheme.com/vim
if v:version < 802
  packadd! dracula
endif
syntax enable
colorscheme dracula

" https://github.com/itchyny/lightline.vim
let g:lightline = {
\   'colorscheme': 'dracula',
\}

" https://github.com/preservim/nerdtree
let NERDTreeIgnore=['\.pyc$', '\~$']

" https://github.com/inkarkat/vim-VcsMessageRecall
let g:VcsMessageRecall_StoreDirName = 'commit-msgs'
let g:VcsMessageRecall_git_MessageRecallOptions = {
\   'ignorePattern': "^Merge branch",
\}

" https://github.com/dense-analysis/ale
let g:ale_linters = {
\   'markdown': ['vale'],
\   'python': ['ruff'],
\   'yaml.cloudformation': ['cfn-lint'],
\}
let g:ale_fixers = {
\   'markdown': ['vale'],
\   'python': ['ruff'],
\}
let g:ale_type_map = {
\   'vale': {'ES': 'WS', 'suggestion': 'I'},
\}
let g:ale_fix_on_save = 0
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'

" https://github.com/prabirshrestha/vim-lsp
function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  nmap <buffer> gd <plug>(lsp-definition)
  nmap <buffer> gr <plug>(lsp-references)
  nmap <buffer> K <plug>(lsp-hover)
endfunction
if executable('vale-ls')
  au User lsp_setup call lsp#register_server({
    \ 'name': 'vale-ls',
    \ 'cmd': {server_info->['vale-ls']},
    \ 'whitelist': ['markdown', 'text'],
    \})
endif
if executable('pylsp')
  au User lsp_setup call lsp#register_server({
    \ 'name': 'pylsp',
    \ 'cmd': {server_info->['pylsp']},
    \ 'allowlist': ['python'],
    \ 'workspace_config': {
    \   'pylsp': {
    \     'plugins': {
    \       'ruff': {
    \         'enabled': v:true,
    \         'config': 'pyproject.toml'
    \       },
    \       'pycodestyle': {'enabled': v:false},
    \       'pyflakes': {'enabled': v:false},
    \       'mccabe': {'enabled': v:false},
    \       'pylint': {'enabled': v:false}
    \     }
    \   }
    \ }
    \})
endif
" disable diagnostics support (handled by ALE)
let g:lsp_diagnostics_enabled = 0

" vim: sw=2 ts=2
