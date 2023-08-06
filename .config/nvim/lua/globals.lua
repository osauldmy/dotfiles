-- Globals, same as `let g:foo = bar`
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- SETTINGS FOR CHECKHEALTH
vim.g.loaded_perl_provider = 0
vim.g.loaded_php_provider = 0
vim.g.loaded_ruby_provider = 0

-- Advice from :checkhealth
-- "Create a virtualenv specifically for Nvim using pyenv and set g:python3_host_prog"
local pynvim_venv = vim.fn.stdpath("data") .. "/pynvim_venv"
local pynvim_python = pynvim_venv .. "/bin/python"

-- NOTE: Create if doesn't exist
if not vim.loop.fs_stat(pynvim_python) then
  vim.notify("Installing python neovim provider...")
  vim.fn.system({ "python3", "-m", "venv", pynvim_venv })
  vim.fn.system({ pynvim_python, "-m", "pip", "install", "pynvim" })
end

vim.g.python3_host_prog = pynvim_python
