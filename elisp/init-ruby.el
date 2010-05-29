;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-

;パス設定
(add-to-list 'load-path "~/.emacs.d/elisp/ruby")

;ruby-mode
(autoload 'ruby-mode "ruby-mode" "Mode for editing ruby source files" t)

(setq auto-mode-alist
      (append '(
                ("\\.rb$"   . ruby-mode)
                ("Rakefile" . ruby-mode)
                ("\\.rake$" . ruby-mode)
                ("\\.rjs"   . ruby-mode)
                ) auto-mode-alist))

(setq interpreter-mode-alist
      (append '(
                ("ruby" . ruby-mode)
                )
              interpreter-mode-alist))

(autoload 'run-ruby "inf-ruby" "Run an inferior Ruby process")
(autoload 'inf-ruby-keys "inf-ruby" "Set local key defs for inf-ruby in ruby-mode")
(add-hook 'ruby-mode-hook '(lambda () (inf-ruby-keys)))

;; ruby-electric.el --- electric editing commands for ruby files
(require 'ruby-electric)
(add-hook 'ruby-mode-hook '(lambda () (ruby-electric-mode t)))


(setq ruby-indent-level 2)
(setq ruby-indent-tabs-mode nil)


;; magic comment
;; Ruby1.9から、ファイルの文字コードを明記する必要がある
;; http://d.hatena.ne.jp/rubikitch/20080307/magiccomment
(defun ruby-insert-magic-comment-if-needed ()
  "バッファのcoding-systemをもとにmagic commentをつける。"
  (when (and (eq major-mode 'ruby-mode)
             (find-multibyte-characters (point-min) (point-max) 1))
    (save-excursion
      (goto-char 1)
      (when (looking-at "^#!")
        (forward-line 1))
      (if (re-search-forward "^#.+coding" (point-at-eol) t)
          (delete-region (point-at-bol) (point-at-eol))
        (open-line 1))
      (let* ((coding-system (symbol-name buffer-file-coding-system))
             (encoding (cond ((string-match "japanese-iso-8bit\\|euc-j" coding-system)
                              "euc-jp")
                             ((string-match "shift.jis\\|sjis\\|cp932" coding-system)
                              "shift_jis")
                             ((string-match "utf-8" coding-system)
                              "utf-8"))))
        (insert (format "# -*- coding: %s -*-" encoding))))))

(add-hook 'before-save-hook 'ruby-insert-magic-comment-if-needed)
