;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-

;;; ECB http://d.hatena.ne.jp/yuko1658/20071213/1197517201
;; (setq load-path (cons (expand-file-name "~/elisp/ecb-2.32") load-path))
;; (load-file "~/elisp/cedet-1.0pre3/common/cedet.el")
(setq semantic-load-turn-useful-things-on t)
(require 'ecb)
(setq ecb-tip-of-the-day nil)
(setq ecb-windows-width 0.25)
(defun ecb-toggle ()
  (interactive)
  (if ecb-minor-mode
      (ecb-deactivate)
    (ecb-activate)))
(global-set-key [f2] 'ecb-toggle)
