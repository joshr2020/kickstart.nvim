return {
  {
    'nvim-neorg/neorg',
    lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
    version = '*', -- Pin Neorg to the latest stable release
    config = true,
    opts = {
      load = {
        ['core.defaults'] = {},
        ['core.qol.todo_items'] = {},
        ['core.concealer'] = {},
        ['core.summary'] = {},
        ['core.dirman'] = {
          config = {
            workspaces = {
              notes = '~/notes', -- Format: <name_of_workspace> = <path_to_workspace_root>
            },
            default_workspace = 'notes',
          },
        },
      },
    },
  },
}
