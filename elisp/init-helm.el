;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-

(require 'helm-config)
(helm-mode 1)

(global-set-key (kbd "C-;") 'helm-mini)
(global-set-key (kbd "C-z") 'helm-M-x)
