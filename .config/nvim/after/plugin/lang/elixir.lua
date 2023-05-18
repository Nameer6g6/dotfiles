local status, mix = pcall(require, "mix")
if not status then
  return
end
mix.setup()
