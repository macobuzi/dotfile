(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(iedit anzu comment-dwim-2 ws-butler dtrt-indent clean-aindent-mode yasnippet undo-tree volatile-highlights helm-gtags helm-projectile helm-swoop helm zygospore projectile company use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; set font size 14pt
(set-face-attribute 'default nil :height 140)

;; turn on highlight matching brackets when cursor is on one
(show-paren-mode 1)
;; highlight brackets
;;(setq show-paren-style 'parenthesis)
;; highlight entire expression
;;(setq show-paren-style 'expression)
;; highlight brackets if visible, else entire expression
;;(setq show-paren-style 'mixed)

;; set default tab char's display width to 4 spaces
(setq-default c-basic-offset 4
              tab-width 4
              indent-tabs-mode t
              c-default-style "k&r")
;; indent commands always use space
;; (setq-default indent-tabs-mode nil)

;; set leuven theme
(load-theme 'misterioso)

;; turn on line number
(global-display-line-numbers-mode)

;; set cursor color to white
(set-cursor-color "#ffffff")

;; turn on speedbar and open at startup
(add-to-list 'load-path "~/.emacs.d/lisp/")
(require 'sr-speedbar)
(setq speedbar-use-images nil)
(add-hook 'emacs-startup-hook (lambda ()
  (sr-speedbar-open)
  ))

;; lisp interpreter
(load (expand-file-name "~/quicklisp/slime-helper.el"))
(setq inferior-lisp-program "/usr/local/bin/sbcl --noinform")

;; quick window navigation
(global-set-key (kbd "C-.") #'other-window)
(global-set-key (kbd "C-,") #'prev-window)

(defun prev-window ()
  (interactive)
  (other-window -1))

;; auto save current layout and open next session
(desktop-save-mode 1)
