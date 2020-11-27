set termguicolors
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set autoread
set title
set nu
set rnu
set cursorcolumn
set cursorline
syntax on
set clipboard+=unnamedplus
set encoding=UTF-8
autocmd BufWritePre * :%s/\s\+$//e
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
set autochdir
set smartcase
set shada='20,<50,s10
let g:mapleader=" "
let g:python3_host_prog='D:\ProgramFiles\anaconda\python.exe'
"nnoremap <F7> :let @+=expand('%:p')<CR>
noremap <C-g> :set splitbelow<CR>:split<CR>:term<CR>
set winaltkeys=no

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"PlugList
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('D:\ProgramFiles\scoop\apps\neovim\current\share\nvim\plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'liuchengxu/space-vim-theme'
Plug 'mg979/vim-xtabline'
Plug 'Yggdroot/indentLine'
Plug 'mhinz/vim-startify'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'mbbill/undotree'
Plug 'tpope/vim-surround'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'airblade/vim-gitgutter'
Plug 'cohama/agit.vim'
Plug 'tpope/vim-fugitive'
Plug 'luochen1990/rainbow'
Plug 'jiangmiao/auto-pairs'
Plug 'easymotion/vim-easymotion'
Plug 'tomtom/tcomment_vim'
Plug 'liuchengxu/vista.vim'
Plug 'RRethy/vim-illuminate'
Plug 'bfredl/nvim-miniyank'
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Plugset
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"themes
colorscheme space_vim_theme

"undotree
nnoremap <F5> :UndotreeToggle<CR>

"indentLine
let g:indentLine_enabled=1
let g:indentLine_fileTypeExclude = ['coc-explorer', 'startify']

"airliine
let g:airline_theme='laederon'
let g:airline_powerline_fonts = 1
nnoremap <tab> gt

"xtabline
let g:xtabline_settings = {}
let g:xtabline_settings.enable_mappings = 0
let g:xtabline_settings.buffers_paths = 0
let g:xtabline_settings.current_tab_paths = 0
let g:xtabline_settings.other_tabs_paths = 0

"leaderf
let g:Lf_UseCache = 0
let g:Lf_DefaultExternalTool = "rg"
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_RootMarkers = ['.root','.git']
let g:Lf_GtagsAutoGenerate = 1
let g:Lf_CacheDirectory = 'E:\Work\temp\gtags'
let g:Lf_Gtagslabel="native-pygments"
let g:Lf_Gtagsconf = 'D:\ProgramFiles\scoop\apps\global\6.6.3\share\gtags\gtags.conf'

let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1

nnoremap <leader>l :Leaderf! line<CR>
nnoremap <leader>f :Leaderf! file<CR>
nnoremap <leader>r :Leaderf! rg<CR>
nnoremap <leader>m :Leaderf! mru<CR>
noremap <leader>tr :<C-U><C-R>=printf("Leaderf! gtags -r %s", expand("<cword>"))<CR><CR>
noremap <leader>td :<C-U><C-R>=printf("Leaderf! gtags -d %s", expand("<cword>"))<CR><CR>
noremap <leader>tg :<C-U><C-R>=printf("Leaderf! gtags -g %s", expand("<cword>"))<CR><CR>

"rainbow
let g:rainbow_active = 1

"coc.nvim
let g:coc_global_extensions = [
	\ 'coc-json',
	\ 'coc-python',
	\ 'coc-clangd',
	\ 'coc-snippets',
	\ 'coc-yank',
	\ 'coc-explorer',
	\ 'coc-vimlsp']

nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>

set updatetime=300
set shortmess+=c
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"GitGutter
let g:gitgutter_sign_allow_clobber = 0
let g:gitgutter_map_keys = 0
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_preview_win_floating = 1
let g:gitgutter_sign_added = '▎'
let g:gitgutter_sign_modified = '░'
let g:gitgutter_sign_removed = '▏'
let g:gitgutter_sign_removed_first_line = '▔'
let g:gitgutter_sign_modified_removed = '▒'
nnoremap <leader>h :GitGutterPreviewHunk<CR>

"Agit
nnoremap <leader>gl :Agit<CR>
let g:agit_no_default_mapping = 1

"coc-explorer
nmap tt :CocCommand explorer<CR>

"easymotion
nmap <leader>e <Plug>(easymotion-s2)

"tcomment_vim
let g:tcomment_textobject_inlinecomment = ''
nmap <LEADER>cn g>c
vmap <LEADER>cn g>
nmap <LEADER>cu g<c
vmap <LEADER>cu g<

"miniyank
map p <Plug>(miniyank-autoput)
map P <Plug>(miniyank-autoPut)
