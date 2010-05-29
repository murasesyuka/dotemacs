;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-

;rails-mode

;; Rinari
; git clone git://github.com/eschulte/rinari.git
; cd rinari
; git submodule init
; git submodule update
(add-to-list 'load-path "~/.emacs.d/elisp/rinari")
(setq rinari-minor-mode-prefixes (list "r"))
(require 'rinari)


;;; rhtml-mode
; git clone git://github.com/eschulte/rhtml.git
(add-to-list 'load-path "~/.emacs.d/elisp/rhtml")
(require 'rhtml-mode)
(add-hook 'rhtml-mode-hook
    (lambda () (rinari-launch)))



