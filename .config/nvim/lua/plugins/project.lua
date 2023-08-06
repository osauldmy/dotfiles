return {
  "ahmedkhalf/project.nvim",
  event = "VeryLazy",
  opts = {
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
    silent_chdir = true,
    detection_methods = { "lsp", "patterns" },
    manual_mode = false,
  },
  config = function()
    require("telescope").load_extension("projects")
  end,
}
