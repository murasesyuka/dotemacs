;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-

(require 'yasnippet)
(require 'helm-c-yasnippet)
(setq helm-c-yas-space-match-any-greedy t) ;[default: nil]
(global-set-key (kbd "C-c y") 'helm-c-yas-complete)
(yas--initialize)
(yas-load-directory "~/.emacs.d/elpa/yasnippet-20121108.2222/snippets")
;(yas-load-directory "~/.emacs.d/elpa/yasnippet-20121108.2222/extras/imported")
;(add-to-list 'yas-extra-mode-hooks 'ruby-mode-hook)
;(add-to-list 'yas-extra-mode-hooks 'cperl-mode-hook)
(yas-global-mode 1)







