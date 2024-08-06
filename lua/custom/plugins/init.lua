-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  'ledger/vim-ledger',
  {
    'axkirillov/easypick.nvim',
    requires = 'nvim-telescope/telescope.nvim',
    config = function() -- This is the function that runs, AFTER loading
      local actions = require 'telescope.actions'
      local action_state = require 'telescope.actions.state'
      require('easypick').setup {
        pickers = {
          {
            name = 'accounts',
            command = 'hledger accounts',
            action = function(prompt_bufnr, _)
              actions.select_default:replace(function()
                actions.close(prompt_bufnr)
                local selection = action_state.get_selected_entry()
                vim.api.nvim_put({ selection[1] }, '', false, true)
              end)
              return true
            end,
          },
          {
            name = 'descriptions',
            command = 'hledger descriptions',
            action = function(prompt_bufnr, _)
              actions.select_default:replace(function()
                actions.close(prompt_bufnr)
                local selection = action_state.get_selected_entry()
                vim.api.nvim_put({ selection[1] }, '', false, true)
              end)
              return true
            end,
          },
        },
      }
    end,
  },
}
