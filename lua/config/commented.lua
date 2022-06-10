local status_ok, commented = pcall(require, "commented")
if status_ok then
  return commented.setup({
    prefer_block_comment = true
  })
end
