;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-


;;; https://github.com/mooz/js2-mode
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.\\(js\\|json\\)$" . js2-mode))



;;; http://ozmm.org/posts/coffee_mode.html
(require 'coffee-mode)

(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
(add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode))


;;; http://d.hatena.ne.jp/mooz/20110504/p1
;;; git clone https://github.com/mooz/shadow.el.git
;;; shadow.el
(add-to-list 'load-path "~/.emacs.d/elisp/shadow.el")
(require 'shadow)

(add-hook 'find-file-hooks 'shadow-on-find-file)
(add-hook 'shadow-find-unshadow-hook
          (lambda () (auto-revert-mode 1)))

