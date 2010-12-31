;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-

;パス設定
(add-to-list 'load-path "/opt/scala-2.8.1.final/misc/scala-tool-support/emacs/")

;scala-mode
(require 'scala-mode-auto)
(require 'scala-mode-feature-electric)
(add-hook 'scala-mode-hook
	  (lambda ()
	    (scala-electric-mode)))


;Ya-snippets
;(setq yas/my-directory "scala-mode/contrib/yasnippet/snippets")
;(yas/load-directory yas/my-directory)
;(add-hook 'scala-mode-hook
;            '(lambda ()
;               (yas/minor-mode-on)
;               ))


