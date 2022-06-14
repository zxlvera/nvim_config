local status_ok, worktree = pcall(require, "git-worktree")
if status_ok then
  return worktree.setup({
  })
end
