;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-

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


;; ;ensime-mode
;; (add-to-list 'load-path "~/.emacs.d/elisp/ensime_2.8.1-0.4/elisp/")
;; (require 'ensime)
;; (add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

;; ;; MINI HOWTO: 
;; ;; Open .scala file. M-x ensime (once per project)


