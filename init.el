(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)
(defvar my-packages '(better-defaults
                      projectile
                      clojure-mode
                      cider
                      expand-region
                      solarized-theme
                      cider-eval-sexp-fu
                      paredit
                      rainbow-delimiters
		      exec-path-from-shell))

(dolist (p my-packages)
  (unless (package-installed-p p)p
    (package-install p)))

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

(require 'better-defaults)

(require 'expand-region)
(global-set-key (kbd "<A-up>") 'er/expand-region)
(global-set-key (kbd "<A-down>") 'er/contract-region)

;; Font
(add-to-list 'default-frame-alist '(font . "Jetbrains Mono-16"))
(mac-auto-operator-composition-mode)

(require 'cider-eval-sexp-fu)

(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
(add-hook 'cider-repl-mode-hook #'rainbow-delimiters-mode)
(add-hook 'cider-repl-mode-hook #'paredit-mode)
(add-hook 'clojure-mode-hook #'paredit-mode)
(add-hook 'emacs-lisp-mode-hook #'paredit-mode)

(load-theme 'solarized-light t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(better-defaults projectile exec-path-from-shell cider)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
