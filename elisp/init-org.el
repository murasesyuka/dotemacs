;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-


(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)


(add-hook 'org-mode-hook 'turn-on-iimage-mode)

;; http://pastelwill.jp/wiki/doku.php?id=emacs:org-tree-slide
;; (auto-install-from-url "https://raw.github.com/takaxp/org-tree-slide/master/org-tree-slide.el")

(require 'org-tree-slide)
