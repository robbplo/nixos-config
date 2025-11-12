return {
  'stevearc/oil.nvim',
  opts = {
    experimental_watch_for_changes = true,
    skip_confirm_for_simple_edits = true,
    prompt_save_on_select_new_entry = false,
    constrain_cursor = 'name',
    watch_for_changes = true,
    view_options = {
      -- Show files and directories that start with "."
      show_hidden = true,
      -- This function defines what is considered a "hidden" file
      is_hidden_file = function(name, bufnr)
        return false
      end,
      -- This function defines what will never be shown, even when `show_hidden` is set
      is_always_hidden = function(name, bufnr)
        return false
      end,
      sort = {
        -- sort order can be "asc" or "desc"
        -- see :help oil-columns to see which columns are sortable
        { "type", "asc" },
        { "name", "asc" },
      },
    },
  }
}
