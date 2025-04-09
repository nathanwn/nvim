return {
    "nvim-lualine/lualine.nvim",
    config = function()
        require('lualine').setup {
            options = {
                section_separators = '',
                component_separators = '',
                icons_enabled = false,
                disabled_filetypes = {
                    "NvimTree", "qf",
                }
            },
            sections = {
                lualine_a = {'mode'},
                lualine_b = {'branch', 'diff'},
                lualine_c = {'diagnostics'},
                lualine_x = {'lsp_status'},
                lualine_y = {'encoding', 'fileformat', 'filetype'},
                lualine_z = {'location'}
            },
            winbar = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {
                    {
                        'filename',
                        path = 1,
                    }
                },
                lualine_x = {},
                lualine_y = {},
                lualine_z = {}
            },
            inactive_winbar = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {
                    {
                        'filename',
                        path = 1,
                    }
                },
                lualine_x = {},
                lualine_y = {},
                lualine_z = {}
            },
            extensions = {}
        }
    end
}
