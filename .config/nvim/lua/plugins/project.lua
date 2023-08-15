return {
  "ahmedkhalf/project.nvim",
  event = "VeryLazy",
  -- lazy = false,
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

    require("telescope").load_extension("projects")
  end,
}
