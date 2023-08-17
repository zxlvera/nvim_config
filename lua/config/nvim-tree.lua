local status_ok, nvimtree = pcall(require, 'nvim-tree')
if status_ok then
  return nvimtree.setup({
    sort_by = "case_sensitive",
    diagnostics = {
      enable = true
    },
    view = {
      adaptive_size = true,
    },
    renderer = {
      group_empty = true,
    },
    filters = {
      dotfiles = false,
    },
    respect_buf_cwd = true,
    sync_root_with_cwd = true,
    update_focused_file = {
        enable = true,
        update_cwd = true,
    }
  })
end


