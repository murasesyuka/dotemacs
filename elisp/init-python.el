;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-

; http://pedrokroger.com/2010/07/configuring-emacs-as-a-python-ide-2/
(require 'python-mode)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))

(require `ipython)

