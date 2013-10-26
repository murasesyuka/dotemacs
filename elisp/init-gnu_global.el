;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-


;;; ;http://uguisu.skr.jp/Windows/gtags.html
;; GNU GLOBAL(gtags)
(autoload 'gtags-mode "gtags" "" t)
(setq gtags-mode-hook
      '(lambda ()
         (local-set-key "\M-t" 'gtags-find-tag)
         (local-set-key "\M-r" 'gtags-find-rtag)
         (local-set-key "\M-s" 'gtags-find-symbol)
         (local-set-key "\C-t" 'gtags-pop-stack)
         ))

(add-hook 'c-mode-common-hook
          '(lambda()
             (gtags-mode 1)
             (gtags-make-complete-list)
             ))

;;; ;https://github.com/syohex/emacs-helm-gtags
;; helm-gtags
(require 'helm-config)
(require 'helm-gtags)

(add-hook 'c-mode-hook (lambda () (helm-gtags-mode)))

;; customize
(setq helm-c-gtags-path-style 'relative)
(setq helm-c-gtags-ignore-case t)
;(setq helm-c-gtags-read-only t)

;; key bindings
(add-hook 'helm-gtags-mode-hook
          '(lambda ()
              (local-set-key (kbd "M-t") 'helm-gtags-find-tag)
              (local-set-key (kbd "M-r") 'helm-gtags-find-rtag)
              (local-set-key (kbd "M-s") 'helm-gtags-find-symbol)
              (local-set-key (kbd "C-t") 'helm-gtags-pop-stack)))

;; http://qiita.com/hayamiz/items/8e8c7fca64b4810d8e78
(defun update-gtags ()
  (interactive)
  (let* ((file (buffer-file-name (current-buffer)))
	 (dir (directory-file-name (file-name-directory file))))
    (when (executable-find "global")
      (start-process "gtags-update" nil
		     "global" "-uv"))))

;; (add-hook 'after-save-hook
;; 	  'update-gtags)
