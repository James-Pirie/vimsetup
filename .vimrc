set nocompatible              " be iMproved, required
filetype on                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Eliot00/git-lens.vim'
Plugin 'fatih/vim-go'

call vundle#end()            " required

" LSP Config
" https://github.com/yegappan/lsp

packadd lsp

" Javascript/Typescript language server
" https://github.com/typescript-language-server/typescript-language-server
call LspAddServer([#{
\   name: 'typescriptlang',
\   filetype: ['javascript', 'javascriptreact', 'typescript', 'typescriptreact'],
\   path: '/home/james/.nvm/versions/node/v24.16.0/bin/typescript-language-server',
\   args: ['--stdio'],
\  }])


" Golang language server
" https://go.dev/gopls
call LspAddServer([#{
\   name: 'gopls',
\   filetype: ['go', 'gomod'],
\   path: '/home/james/go/bin/gopls',
\   args: ['serve'],
\    syncInit: v:true
\  }])

" C/C++ language Server
" https://clangd.llvm.org
call LspAddServer([#{
\   name: 'clangd',
\   filetype: ['c'],
\   path: '/usr/bin/clangd',
\  }])

filetype plugin indent on    " required

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

set nu

set nowrap

set autoindent

set expandtab

set shiftwidth=2

set tabstop=2

set softtabstop=2

set colorcolumn=120

set updatetime=750

let g:go_def_mapping_enabled = 0

let g:NERDTreeWinSize = 30

autocmd BufWritePre * :%s/\s\+$//e

autocmd VimEnter * if argc() == 0 | NERDTree | endif

au BufWinEnter * set number

let g:GIT_LENS_ENABLED = v:true

let g:git_lense_blame_template = "%h %s"

nnoremap gD :tab LspGotoDefinition<CR>

nnoremap gT :tab LspGotoTypeDef<CR>

nnoremap <C-h> :LspDiagCurrent<CR>

