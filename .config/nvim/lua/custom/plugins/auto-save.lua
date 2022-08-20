local present, autosave = pcall(require, "auto-save")

if present then
  autosave.setup()
end
