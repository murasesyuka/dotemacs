;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-

;パス設定
(add-to-list 'load-path "~/.emacs.d/elisp/ruby")

;ruby-mode
(autoload 'ruby-mode "ruby-mode" "Mode for editing ruby source files" t)

(setq auto-mode-alist
      (append '(
                ("\\.rb$"   . ruby-mode)
                ("Rakefile" . ruby-mode)
                ("\\.rake$" . ruby-mode)
                ("\\.rjs"   . ruby-mode)
                ) auto-mode-alist))

(setq interpreter-mode-alist
      (append '(
                ("ruby" . ruby-mode)
                )
              interpreter-mode-alist))

(autoload 'run-ruby "inf-ruby" "Run an inferior Ruby process")
(autoload 'inf-ruby-keys "inf-ruby" "Set local key defs for inf-ruby in ruby-mode")
(add-hook 'ruby-mode-hook '(lambda () (inf-ruby-keys)))

;; ruby-electric.el --- electric editing commands for ruby files
(require 'ruby-electric)
(add-hook 'ruby-mode-hook '(lambda () (ruby-electric-mode t)))


(setq ruby-indent-level 2)
(setq ruby-indent-tabs-mode nil)

