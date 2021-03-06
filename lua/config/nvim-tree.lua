local status_ok, nvimtree = pcall(require, 'nvim-tree')
if status_ok then
  return nvimtree.setup({
    sort_by = "case_sensitive",
    diagnostics = {
      enable = true
    },
    view = {
      adaptive_size = true,
      mappings = {
        list = {
          { key = "u", action = "dir_up" },
        },
      },
    },
    renderer = {
      group_empty = true,
    },
    filters = {
      dotfiles = true,
    },
    respect_buf_cwd = true,
    sync_root_with_cwd = true,
    update_focused_file = {
        enable = true,
        update_cwd = true,
    }
  })
end


