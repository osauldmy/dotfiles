return {
  "Olical/conjure",
  ft = { "clojure", "lisp" },
  config = function()
    vim.g["conjure#log#hud#width"] = 1
    vim.g["conjure#client#clojure#nrepl#connection#auto_repl#enabled"] = false
  end,
}
