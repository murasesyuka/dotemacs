;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-

;;; http://d.hatena.ne.jp/mooz/20100421/p1
;; (install-elisp "http://cc-mode.sourceforge.net/src/cc-defs.el")
;; (install-elisp-from-emacswiki "c-eldoc.el")
(load "c-eldoc")

(add-to-list 'auto-mode-alist '("\\.cu\\'" . c++-mode))

(add-hook 'c-mode-hook
          (lambda ()
            (set (make-local-variable 'eldoc-idle-delay) 0.20)
	    (color-theme-montz)
            (c-turn-on-eldoc-mode)
            ))

(add-hook 'c++-mode-hook
          (lambda ()
	    (color-theme-montz)
            ))

