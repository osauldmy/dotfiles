(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(dolist (package '(slime paredit company evil gruvbox-theme))
  (unless (package-installed-p package)
    (package-install package)))

(setq custom-safe-themes t)
(load-theme 'gruvbox-dark-medium)

(setq inferior-lisp-program "sbcl")
(require 'slime)

(require 'evil)
(evil-mode 1)

(global-display-line-numbers-mode)

(add-hook 'after-init-hook 'global-company-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
