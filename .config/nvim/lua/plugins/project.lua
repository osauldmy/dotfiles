return {
  "ahmedkhalf/project.nvim",
  event = "VeryLazy",
  config = function()
    require("project_nvim").setup({
      silent_chdir = true,
      manual_mode = false,
      detection_methods = { "lsp", "patterns" },
      patterns = {
        ".git",
        "Makefile",
        "package.json",
        "pyproject.toml",
        "setup.py",
        "Dockerfile",
        "docker-compose.yml",
        "docker-compose.yaml",
      },
    })

    local telescope = require("telescope")
    telescope.load_extension("projects")

    -- NOTE: Not the best approach, tried to use autocmd as well,
    -- but had basically same bad results. For now sticking to this way.
    if vim.v.argv[3] == nil then
      vim.schedule(function()
        local recent = require("project_nvim.utils.history").get_recent_projects()
        telescope.extensions.projects.projects(recent)
      end)
    end
  end,
}
