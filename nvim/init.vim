if !exists('g:vscode')
	" Specify a directory for plugins
	call plug#begin('~/.vim/plugged')

	Plug 'dense-analysis/ale'
	Plug 'mattn/emmet-vim'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'scrooloose/nerdtree'
	"Plug 'tsony-tsonev/nerdtree-git-plugin'
	Plug 'Xuyuanp/nerdtree-git-plugin'
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
	Plug 'ryanoasis/vim-devicons'
	Plug 'airblade/vim-gitgutter'
	Plug 'ctrlpvim/ctrlp.vim' " fuzzy find files
	Plug 'scrooloose/nerdcommenter'
	"Plug 'prettier/vim-prettier', { 'do': 'yarn install' }"
	Plug 'christoomey/vim-tmux-navigator'
	Plug 'sheerun/vim-polyglot'
	Plug 'vim-airline/vim-airline'
	Plug 'Yggdroot/indentLine' 
	Plug 'HerringtonDarkholme/yats.vim' " TS Syntax
	Plug 'tomasiser/vim-code-dark'
	Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
	" css3 syntax highlight
	Plug 'hail2u/vim-css3-syntax'

	" less syntax highlight
	Plug 'groenewege/vim-less'

	" Elixir syntax highlight
	Plug 'elixir-editors/vim-elixir'

	" Shakespeare (Yesod templating)
	Plug 'pbrisbin/vim-syntax-shakespeare'

	" file tree
	Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }

	" fuzzy finder
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'junegunn/fzf.vim'

	" commenting text
	Plug 'tpope/vim-commentary'

	" git wrapper
	Plug 'tpope/vim-fugitive'

	" Syntax highlight for .tsx
	Plug 'ianks/vim-tsx', { 'for': 'typescript.tsx' }

	" Syntax highlight for .ts
	Plug 'HerringtonDarkholme/yats.vim', { 'for': 'typescript' }

	" Syntax hightlight for .jsx
	Plug 'mxw/vim-jsx'

	" Syntax hightlight for .js
	Plug 'pangloss/vim-javascript'

	" Show indentation
	Plug 'Yggdroot/indentLine'

	" Highlink yank for a second
	Plug 'machakann/vim-highlightedyank'

	" Visual local history
	Plug 'sjl/gundo.vim'

	" Surround text with something
	Plug 'tpope/vim-surround'

	" Allow repeating of custom commands like surround
	Plug 'tpope/vim-repeat'

	" Typescript autocomplete
	Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
	Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
	Plug 'neoclide/coc-prettier', {'do': 'yarn install --frozen-lockfile'}
	Plug 'neoclide/coc-pairs', {'do': 'yarn install --frozen-lockfile'}

	Plug 'neoclide/coc-eslint', {'do': 'yarn install --frozen-lockfile'}

	" Haskell highlighting
	Plug 'neovimhaskell/haskell-vim'

	" Markdown preview
	Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}

	" Handlebars highlight
	Plug 'mustache/vim-mustache-handlebars'

	" Smart replace, abbreviations, convert case
	Plug 'tpope/vim-abolish'

	" Multifile replace
	Plug 'wincent/ferret'

	" Show list of merge conflicts
	Plug 'wincent/vcs-jump'

	" Functions for manipulating highlight groups
	Plug 'wincent/pinnacle'

	" Vim elm syntax
	Plug 'andys8/vim-elm-syntax'
	" Initialize plugin system


	" UI related
	Plug 'chriskempson/base16-vim'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	" Better Visual Guide
	Plug 'Yggdroot/indentLine'
	" syntax check
	Plug 'w0rp/ale'
	" Autocomplete
	Plug 'ncm2/ncm2'
	Plug 'roxma/nvim-yarp'
	Plug 'ncm2/ncm2-bufword'
	Plug 'ncm2/ncm2-path'
	Plug 'ncm2/ncm2-jedi'
	" Formater
	Plug 'Chiel92/vim-autoformat'
	  
	call plug#end()


	filetype plugin indent on

	" Configurations Part
	" UI configuration
	syntax on
	syntax enable
	" colorscheme
	let base16colorspace=256
	colorscheme base16-gruvbox-dark-hard
	set background=dark
	" True Color Support if it's avaiable in terminal
	if has("termguicolors")
		set termguicolors
	endif
	if has("gui_running")
	  set guicursor=n-v-c-sm:block,i-ci-ve:block,r-cr-o:blocks
	endif
	set number
	set relativenumber
	set hidden
	set mouse=a
	set noshowmode
	set noshowmatch
	set nolazyredraw
	" Turn off backup
	set nobackup
	set noswapfile
	set nowritebackup
	" Search configuration
	set ignorecase                    " ignore case when searching
	set smartcase                     " turn on smartcase
	" Tab and Indent configuration
	set expandtab
	set tabstop=4
	set shiftwidth=4
	" vim-autoformat
	noremap <F3> :Autoformat<CR>
	" NCM2
	augroup NCM2
	  autocmd!
	  " enable ncm2 for all buffers
	  autocmd BufEnter * call ncm2#enable_for_buffer()
	  " :help Ncm2PopupOpen for more information
	  set completeopt=noinsert,menuone,noselect
	  " When the <Enter> key is pressed while the popup menu is visible, it only
	  " hides the menu. Use this mapping to close the menu and also start a new line.
	  inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
	  " uncomment this block if you use vimtex for LaTex
	  " autocmd Filetype tex call ncm2#register_source({
	  "           \ 'name': 'vimtex',
	  "           \ 'priority': 8,
	  "           \ 'scope': ['tex'],
	  "           \ 'mark': 'tex',
	  "           \ 'word_pattern': '\w+',
	  "           \ 'complete_pattern': g:vimtex#re#ncm2,
	  "           \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
	  "           \ })
	augroup END
	" Ale
	let g:ale_lint_on_enter = 0
	let g:ale_lint_on_text_changed = 'never'
	let g:ale_echo_msg_error_str = 'E'
	let g:ale_echo_msg_warning_str = 'W'
	let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
	let g:ale_linters = {'python': ['flake8']}
	" Airline
	let g:airline_left_sep  = ''
	let g:airline_right_sep = ''
	let g:airline#extensions#ale#enabled = 1
	let airline#extensions#ale#error_symbol = 'E:'
	let airline#extensions#ale#warning_symbol = 'W:'

	inoremap jk <ESC>
	nmap <C-n> :NERDTreeToggle<CR>
	vmap ++ <plug>NERDCommenterToggle
	nmap ++ <plug>NERDCommenterToggle

	set mouse=a
	set number
	set hidden
	set cursorline
	set expandtab
	set autoindent
	set smartindent
	set shiftwidth=4
	set tabstop=4
	set encoding=utf8
	set history=5000
	set clipboard=unnamedplus

	let g:python3_host_prog = 'C:\Users\bmckinne\AppData\Local\Programs\Python\Python39\python.exe'

		" open NERDTree automatically
	autocmd StdinReadPre * let s:std_in=1
	autocmd VimEnter * NERDTree

	let g:NERDTreeGitStatusWithFlags = 1
	"let g:WebDevIconsUnicodeDecorateFolderNodes = 1
	"let g:NERDTreeGitStatusNodeColorization = 1
	"let g:NERDTreeColorMapCustom = {
		"\ "Staged"    : "#0ee375",  
		"\ "Modified"  : "#d9bf91",  
		"\ "Renamed"   : "#51C9FC",  
		"\ "Untracked" : "#FCE77C",  
		"\ "Unmerged"  : "#FC51E6",  
		"\ "Dirty"     : "#FFBD61",  
		"\ "Clean"     : "#87939A",   
		"\ "Ignored"   : "#808080"   
		"\ }                         


	let g:NERDTreeIgnore = ['^node_modules$']


	" vim-prettier
	"let g:prettier#quickfix_enabled = 0
	"let g:prettier#quickfix_auto_focus = 0
	" prettier command for coc
	command! -nargs=0 Prettier :CocCommand prettier.formatFile
	" run prettier on save
	"let g:prettier#autoformat = 0
	"autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync


	" ctrlp
	let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

	" j/k will move virtual lines (lines that wrap)
	noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
	noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
	nnoremap <C-s> :w<CR>
	nnoremap <C-Q> :wq<CR>

	" shift+arrow selection
	nmap <S-Up> v<Up>
	nmap <S-Down> v<Down>
	nmap <S-Left> v<Left>
	nmap <S-Right> v<Right>
	vmap <S-Up> <Up>
	vmap <S-Down> <Down>
	vmap <S-Left> <Left>
	vmap <S-Right> <Right>
	imap <S-Up> <Esc>v<Up>
	imap <S-Down> <Esc>v<Down>
	imap <S-Left> <Esc>v<Left>
	imap <S-Right> <Esc>v<Right>

	vmap <C-c> y<Esc>i
	vmap <C-x> d<Esc>i
	map <C-v> pi
	imap <C-v> <Esc>pi

	set cindent
	colorscheme codedark

	" sync open file with NERDTree
	" " Check if NERDTree is open or active
	function! IsNERDTreeOpen()        
	  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
	endfunction

	" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
	" file, and we're not in vimdiff
	function! SyncTree()
	  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
		NERDTreeFind
		wincmd p
	  endif
	endfunction

	" Highlight currently open buffer in NERDTree
	autocmd BufEnter * call SyncTree()

	" coc config
	let g:coc_global_extensions = [
	  \ 'coc-snippets',
	  \ 'coc-pairs',
	  \ 'coc-tsserver',
	  \ 'coc-eslint', 
	  \ 'coc-prettier', 
	  \ 'coc-json', 
	  \ 'coc-python',
	  \ ]
	" from readme
	" if hidden is not set, TextEdit might fail.
	set hidden " Some servers have issues with backup files, see #649 set nobackup set nowritebackup " Better display for messages set cmdheight=2 " You will have bad experience for diagnostic messages when it's default 4000.
	set updatetime=300

	" don't give |ins-completion-menu| messages.
	set shortmess+=c

	" always show signcolumns
	set signcolumn=yes

	" Use tab for trigger completion with characters ahead and navigate.
	" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
	inoremap <silent><expr> <TAB>
		  \ pumvisible() ? "\<C-n>" :
		  \ <SID>check_back_space() ? "\<TAB>" :
		  \ coc#refresh()
	inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

	function! s:check_back_space() abort
	  let col = col('.') - 1
	  return !col || getline('.')[col - 1]  =~# '\s'
	endfunction

	" Use <c-space> to trigger completion.
	inoremap <silent><expr> <c-space> coc#refresh()

	" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
	" Coc only does snippet and additional edit on confirm.
	inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
	" Or use `complete_info` if your vim support it, like:
	" inoremap <expr> <cr> complete_nfo()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

	" Use `[g` and `]g` to navigate diagnostics
	nmap <silent> [g <Plug>(coc-diagnostic-prev)
	nmap <silent> ]g <Plug>(coc-diagnostic-next)

	" Remap keys for gotos
	nmap <silent> gd <Plug>(coc-definition)
	nmap <silent> gy <Plug>(coc-type-definition)
	nmap <silent> gr <Plug>(coc-references)

	" Use K to show documentation in preview window
	nnoremap <silent> K :call <SID>show_documentation()<CR>

	function! s:show_documentation()
	  if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	  else
		call CocAction('doHover')
	  endif
	endfunction

	" Highlight symbol under cursor on CursorHold
	autocmd CursorHold * silent call CocActionAsync('highlight')

	" Remap for rename current word
	nmap <F2> <Plug>(coc-rename)

	" Remap for format selected region
	xmap <leader>f  <Plug>(coc-format-selected)
	nmap <leader>f  <Plug>(coc-format-selected)

	augroup mygroup
	  autocmd!
	  " Setup formatexpr specified filetype(s).
	  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
	" Update signature help on jump placeholder
	  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
	augroup end

	" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
	xmap <leader>a  <Plug>(coc-codeaction-selected)
	nmap <leader>a  <Plug>(coc-codeaction-selected)

	" Remap for do codeAction of current line
	nmap <leader>ac  <Plug>(coc-codeaction)
	" Fix autofix problem of current line
	nmap <leader>qf  <Plug>(coc-fix-current)

	" Create mappings for function text object, requires document symbols feature of languageserver.
	xmap if <Plug>(coc-funcobj-i)
	xmap af <Plug>(coc-funcobj-a)
	omap if <Plug>(coc-funcobj-i)
	omap af <Plug>(coc-funcobj-a)

	" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
	nmap <silent> <C-d> <Plug>(coc-range-select)
	xmap <silent> <C-d> <Plug>(coc-range-select)

	" Use `:Format` to format current buffer
	command! -nargs=0 Format :call CocAction('format')

	" Use `:Fold` to fold current buffer
	command! -nargs=? Fold :call     CocAction('fold', <f-args>)

	" use `:OR` for organize import of current buffer
	command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

	" Add status line support, for integration with other plugin, checkout `:h coc-status`
	set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

	" Using CocList
	" Show all diagnostics
	nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
	" Manage extensions
	nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
	" Show commands
	nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
	" Find symbol of current document
	nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
	" Search workspace symbols
	nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
	" Do default action for next item.
	nnoremap <silent> <space>j  :<C-u>CocNext<CR>
	" Do default action for previous item.
	nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
	" Resume latest coc list
	nnoremap <silent> <space>p  :<C-u>CocListResume<CR>i

	set laststatus=2
	let g:airline#extensions#tabline#enabled = 1
	let g:airline_powerline_fonts = 1
	let g:airline_statusline_ontop=0
	let g:airline_theme='base16_twilight'

	let g:airline#extensions#tabline#formatter = 'default'
	" navegação entre os buffers
	nnoremap <M-Right> :bn<cr>
	nnoremap <M-Left> :bp<cr>
	nnoremap <c-x> :bp \|bd #<cr>

	let g:ale_completion_enabled = 0
	let g:ale_linters = {'python': ['flake8', 'pylint'], 'javascript': ['eslint']}
else
	" Comments in Vimscript start with a `"`.

	" If you open this file in Vim, it'll be syntax highlighted for you.

	" Vim is based on Vi. Setting `nocompatible` switches from the default
	" Vi-compatibility mode and enables useful Vim functionality. This
	" configuration option turns out not to be necessary for the file named
	" '~/.vimrc', because Vim automatically enters nocompatible mode if that file
	" is present. But we're including it here just in case this config file is
	" loaded some other way (e.g. saved as `foo`, and then Vim started with
	" `vim -u foo`).
	set nocompatible

	" Save yanks to clipboard
	set clipboard=unnamed

	" Turn on syntax highlighting.
	syntax on

	" Disable the default Vim startup message.
	set shortmess+=I

	" Show line numbers.
	set number

	" This enables relative line numbering mode. With both number and
	" relativenumber enabled, the current line shows the true line number, while
	" all other lines (above and below) are numbered relative to the current line.
	" This is useful because you can tell, at a glance, what count is needed to
	" jump up or down to a particular line, by {count}k to go up or {count}j to go
	" down.
	set relativenumber

	" The backspace key has slightly unintuitive behavior by default. For example,
	" by default, you can't backspace before the insertion point set with 'i'.
	" This configuration makes backspace behave more reasonably, in that you can
	" backspace over anything.
	set backspace=indent,eol,start

	" By default, Vim doesn't let you hide a buffer (i.e. have a buffer that isn't
	" shown in any window) that has unsaved changes. This is to prevent you from "
	" forgetting about unsaved changes and then quitting e.g. via `:qa!`. We find
	" hidden buffers helpful enough to disable this protection. See `:help hidden`
	" for more information on this.
	set hidden

	" This setting makes search case-insensitive when all characters in the string
	" being searched are lowercase. However, the search becomes case-sensitive if
	" it contains any capital letters. This makes searching more convenient.
	set ignorecase
	set smartcase

	" Enable searching as you type, rather than waiting till you press enter.
	set incsearch

	" Unbind some useless/annoying default key bindings.
	nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.

	" Disable audible bell because it's annoying.
	set noerrorbells visualbell t_vb=

	" Try to prevent bad habits like using the arrow keys for movement. This is
	" not the only possible bad habit. For example, holding down the h/j/k/l keys
	" for movement, rather than using more efficient movement commands, is also a
	" bad habit. The former is enforceable through a .vimrc, while we don't know
	" how to prevent the latter.
	" Do this in normal mode...
	nnoremap <Left>  :echoe "Use h"<CR>
	nnoremap <Right> :echoe "Use l"<CR>
	nnoremap <Up>    :echoe "Use k"<CR>
	nnoremap <Down>  :echoe "Use j"<CR>
	" ...and in insert mode
	inoremap <Left>  <ESC>:echoe "Use h"<CR>
	inoremap <Right> <ESC>:echoe "Use l"<CR>
	inoremap <Up>    <ESC>:echoe "Use k"<CR>
	inoremap <Down>  <ESC>:echoe "Use j"<CR> 
end
