lua <<EOS
_G.init_packer = function()
    require 'packer'.startup(function()
        use {
            'folke/tokyonight.nvim',
            config = function()
                if vim.env.BAT_THEME == 'Tokyo Night Day' then
                    vim.o.background = 'light'
                end

                vim.cmd 'colorscheme tokyonight'
            end
        }
        use {
            'neoclide/coc.nvim',
            branch = 'release',
            config = function()
                vim.o.signcolumn = 'yes'
                vim.g.coc_global_extensions = {
                    'coc-css',
                    'coc-deno',
                    'coc-git',
                    'coc-highlight',
                    'coc-html',
                    'coc-json',
                    'coc-pairs',
                    'coc-tsserver',
                }
            end
        }
        use {
            'nvim-treesitter/nvim-treesitter',
            run = ':TSUpdate',
            config = function()
                require'nvim-treesitter.configs'.setup {
                    ensure_installed = 'all',
                    highlight = { enable = true },
                    incremental_selection = { enable = true },
                    indent = { enable = true }
                }
            end
        }
        use {
            'sheerun/vim-polyglot',
            config = function()
                vim.g.vim_markdown_fenced_languages = {
                    'css',
                    'html',
                    'js=javascript',
                    'ts=typescript',
                    'tsx=typescriptreact',
                }
            end
        }
        use 'wakatime/vim-wakatime'
        use { 'wbthomason/packer.nvim', opt = true }
    end)
end
EOS

com! PackerSync packadd packer.nvim | call v:lua.init_packer() | PackerSync

aug cursorline
    au!
    au WinEnter * set cursorline
    au WinLeave * set nocursorline
aug END

set cursorline
set expandtab tabstop=4
set ignorecase smartcase
set mouse=a
set nowrap

" Useful for alt + v shortcut
autocmd BufRead *.fish set wrap

inoremap <silent><expr> <Tab> pumvisible() ? coc#_select_confirm() : "\<Tab>"
inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<C-r>=coc#on_enter()\<CR>"

nmap <Leader>a <Plug>(coc-codeaction-selected)
xmap <Leader>a <Plug>(coc-codeaction-selected)
nmap <Leader>r <Plug>(coc-rename)

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
nnoremap <silent> K :call <SID>show_documentation()<CR>

autocmd CursorHold * silent call CocActionAsync('highlight')
highlight link CocHighlightText Visual

