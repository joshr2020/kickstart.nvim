-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'ledger/vim-ledger',
    config = function()
      vim.keymap.set('n', '<leader>lc', ":call ledger#transaction_state_toggle(line('.'), ' *')<CR>", { silent = true, desc = '[L]edger [C]lear' })
      vim.keymap.set('n', '<leader>la', ':LedgerAlign<CR>', { silent = true, desc = '[L]edger [A]lign' })
    end,
  },
  {
    'axkirillov/easypick.nvim',
    ft = 'ledger',
    requires = 'nvim-telescope/telescope.nvim',
    config = function() -- This is the function that runs, AFTER loading
      -- setup pickers
      local actions = require 'telescope.actions'
      local action_state = require 'telescope.actions.state'
      local easypick = require 'easypick'
      easypick.setup {
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

      -- setup keymaps for easypick telescope
      vim.keymap.set('n', '<leader>sp', ':Easypick descriptions<CR>', { silent = true, desc = '[S]earch [P]ayees' })
      vim.keymap.set('n', '<leader>sa', ':Easypick accounts<CR>', { silent = true, desc = '[S]earch [A]ccounts' })
    end,
  },
}
