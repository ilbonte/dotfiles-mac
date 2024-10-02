" Start vim-plug section
call plug#begin()

" List your plugins here
Plug 'itchyny/lightline.vim'
Plug 'catppuccin/vim', { 'as': 'catppuccin' }

call plug#end()
" End vim-plug section

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

let g:lightline = {'colorscheme': 'catppuccin_latte'}
