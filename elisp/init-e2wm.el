;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-

;;; e2wm
; http://d.hatena.ne.jp/kiwanami/20100528/1275038929
;;; 
;; (auto-install-from-url "http://github.com/kiwanami/emacs-window-layout/raw/master/window-layout.el")
;; (auto-install-from-url "http://github.com/kiwanami/emacs-window-manager/raw/master/e2wm.el")


(require 'e2wm)
(global-set-key (kbd "M-+") 'e2wm:start-management)