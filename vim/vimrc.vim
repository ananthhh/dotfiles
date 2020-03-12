call plug#begin('~/.vim/plugged')

Plug 'godlygeek/tabular' | Plug 'plasticboy/vim-markdown'
Plug 'https://github.com/jceb/vim-orgmode'
Plug 'https://github.com/tpope/vim-speeddating'
Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'iCyMind/NeoSolarized'

call plug#end()

nmap <silent> <Leader>n :NERDTreeToggle<CR>

let g:mkdx#settings     = { 'highlight': { 'enable': 1 },
                        \ 'enter': { 'shift': 1 },
                        \ 'links': { 'external': { 'enable': 1 } },
                        \ 'toc': { 'text': 'Table of Contents', 'update_on_write': 1 },
                        \ 'fold': { 'enable': 1 } }
autocmd BufNewFile,BufFilePre,BufRead *.mdx set filetype=markdown

" http://www.markcampbell.me/2016/04/12/setting-up-yank-to-clipboard-on-a-mac-with-vim.html
" yank to clipboard
if has("clipboard")
  set clipboard=unnamed " copy to the system clipboard
endif
