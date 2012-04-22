;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-

;; install from marmalade
;; http://blog.ik.am/entry/view/id/110/title/Clojure+Emacs%E3%81%AA%E9%96%8B%E7%99%BA%E7%92%B0%E5%A2%83%E3%82%92%E4%BD%9C%E3%82%8B%28late%202011%29/

(require 'clojure-mode)
;; 拡張子の*.clojure
(setq auto-mode-alist
      (append '(("\\.clj$" . clojure-mode)) auto-mode-alist))

; Paredit
(defun turn-on-paredit () (paredit-mode 1))
(add-hook 'clojure-mode-hook 'turn-on-paredit)

