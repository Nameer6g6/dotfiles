local status, neo_well = pcall(require, "neo-well")
if not status then
  vim.notify "Warning: neo-well isn't working"
  return
end

neo_well.setup {
  height = 10,
}
