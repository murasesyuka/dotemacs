;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-

;;; e2wm
; http://d.hatena.ne.jp/kiwanami/20100528/1275038929
;;; 
;; (auto-install-from-url "http://github.com/kiwanami/emacs-window-layout/raw/master/window-layout.el")
;; (auto-install-from-url "http://github.com/kiwanami/emacs-window-manager/raw/master/e2wm.el")


(require 'e2wm)
(global-set-key (kbd "M-+") 'e2wm:start-management)
(global-set-key (kbd "C-9") 'e2wm:dp-code-main-maximize-toggle-command)


;; (auto-install-from-url "https://github.com/kiwanami/emacs-window-manager/raw/master/e2wm-vcs.el")

(require 'magit)
(require 'e2wm-vcs)

;; M-w に magit パースペクティブ変更を割り当て
(e2wm:add-keymap
 e2wm:pst-minor-mode-keymap
 '(("C-M-w" . e2wm:dp-magit))
 e2wm:prefix-key)
