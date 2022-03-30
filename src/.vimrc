syntax enable
set background=dark
set termguicolors
colorscheme gruvbox
set paste
set hlsearch
set encoding=UTF-8

"{{{ Tabs and Whitespace
  set shiftwidth=2
  set tabstop=2
  set softtabstop=2
  set expandtab
  set list
  set listchars=tab:>-,trail:~,extends:>,precedes:<
"}}}

"{{{ UI Options
  set number
  set showcmd
  set cursorline
  filetype indent plugin on
  set wildmenu
  set showmatch
  set showtabline=2
"}}}

"{{{ Autogroups
augroup configgroup
  autocmd!
  autocmd VimEnter * highlight clear SignColumn
  autocmd FileType php setlocal expandtab
  autocmd FileType js setlocal expandtab
  autocmd BufEnter Makefile setlocal noexpandtab
  autocmd FileType php setlocal formatprg=par\ -w80\ -T4
  autocmd FileType sh setlocal formatprg=par\ -w80\ -T4
  autocmd FileType js setlocal formatprg=par\ -w80\ -T4
augroup END
"}}}

"{{{ NERDTree 
  autocmd VimEnter * NERDTree
  autocmd VimEnter * NERDTree | wincmd p
  autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

  autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
  autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

  let NERDTreeShowHidden=1
  let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ 'Modified'  :'✹',
    \ 'Staged'    :'✚',
    \ 'Untracked' :'✭',
    \ 'Renamed'   :'➜',
    \ 'Unmerged'  :'═',
    \ 'Deleted'   :'✖',
    \ 'Dirty'     :'✗',
    \ 'Ignored'   :'☒',
    \ 'Clean'     :'✔︎',
    \ 'Unknown'   :'?',
    \ }
"}}}

"{{{ Airline Options
  let g:airline_powerline_fonts = 1
  let g:airline_theme='gruvbox'
"}}}
" vim:foldmethod=marker:foldlevel=0
