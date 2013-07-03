;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-

;;http://d.hatena.ne.jp/mzp/20090618/emacs
(add-hook 'java-mode-hook
	  (lambda ()
	    (message "hook")
	    (setq tab-width 4)
	    (setq indent-tabs-mode t)
	    (setq c-basic-offset 4)))

