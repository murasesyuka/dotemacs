;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-

;rails-mode

;; Interactively Do Things (highly recommended, but not strictly required)
(require 'ido)
(ido-mode t)


;; Rinari
;(setq rinari-minor-mode-prefixes (list "r"))
(require 'rinari)


;; ;;; rhtml-mode
;; ; git clone git://github.com/eschulte/rhtml.git
;; (add-to-list 'load-path "~/.emacs.d/elisp/rhtml")
;; (require 'rhtml-mode)
;; (add-hook 'rhtml-mode-hook
;;     (lambda () (rinari-launch)))


;;; slim-mode
;; https://github.com/minad/emacs-slim
(require 'slim-mode)


