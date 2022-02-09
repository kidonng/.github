lua <<EOS
_G.init_packer = function()
    require 'packer'.startup(function()
        use {
            'folke/tokyonight.nvim',
            config = function()
                if vim.env.BAT_THEME == 'TokyoNight-light' then
                    vim.o.background = 'light'
                end

                vim.cmd 'colorscheme tokyonight'
            end
        }
        use {
            'nvim-treesitter/nvim-treesitter',
            run = ':TSUpdate',
            config = function()
                require'nvim-treesitter.configs'.setup {
                    ensure_installed = 'maintained',
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

aug page
    au!
    au User PageOpen nn q :q<CR>
aug END

set cursorline
set expandtab tabstop=4
set ignorecase smartcase
set mouse=a
set nowrap
