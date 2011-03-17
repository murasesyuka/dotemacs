;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-


;;; Flymake
(require 'flymake)

;;; ; http://d.hatena.ne.jp/mowamowa/20071217/1197865281
;;; ;; C
(defun flymake-c-init ()
  (let* ((temp-file   (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
         (local-file  (file-relative-name
                       temp-file
                       (file-name-directory buffer-file-name))))
    (list "gcc" (list "-Wall" "-Wextra" "-fsyntax-only" local-file))))
(push '("\\.c$" flymake-c-init) flymake-allowed-file-name-masks)

(add-hook 'c-mode-hook
          '(lambda ()
             (flymake-mode t)))


;;; ; http://d.hatena.ne.jp/suztomo/20080905/1220633281
;;; ;; C++
(defun flymake-cc-init ()
  (let* ((temp-file   (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
         (local-file  (file-relative-name
                       temp-file
                       (file-name-directory buffer-file-name))))
    (list "g++" (list "-Wall" "-Wextra" "-fsyntax-only" local-file))))

(push '("\\.cpp$" flymake-cc-init) flymake-allowed-file-name-masks)

(add-hook 'c++-mode-hook
          '(lambda ()
             (flymake-mode t)))


;;; ; http://d.hatena.ne.jp/gan2/20080702/1214972962
;;; ;; Ruby
;;; ;; Invoke ruby with '-c' to get syntax checking
(defun flymake-ruby-init ()
  (let* ((temp-file   (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
         (local-file  (file-relative-name
                       temp-file
                       (file-name-directory buffer-file-name))))
    (list "ruby" (list "-c" local-file))))

(push '(".+\\.rb$" flymake-ruby-init) flymake-allowed-file-name-masks)
(push '("Rakefile$" flymake-ruby-init) flymake-allowed-file-name-masks)
(push '("^\\(.*\\):\\([0-9]+\\): \\(.*\\)$" 1 2 nil 3) flymake-err-line-patterns)

(add-hook 'ruby-mode-hook
	  '(lambda ()
	     ;; Don't want flymake mode for ruby regions in rhtml files
	     (if (not (null buffer-file-name)) (flymake-mode))
	     ;; エラー行で C-c d するとエラーの内容をミニバッファで表示する
	     (define-key ruby-mode-map "\C-cd" 'credmp/flymake-display-err-minibuf)))

(defun credmp/flymake-display-err-minibuf ()
  "Displays the error/warning for the current line in the minibuffer"
  (interactive)
  (let* ((line-no             (flymake-current-line-no))
         (line-err-info-list  (nth 0 (flymake-find-err-info flymake-err-info line-no)))
         (count               (length line-err-info-list))
         )
    (while (> count 0)
      (when line-err-info-list
        (let* ((file       (flymake-ler-file (nth (1- count) line-err-info-list)))
               (full-file  (flymake-ler-full-file (nth (1- count) line-err-info-list)))
               (text (flymake-ler-text (nth (1- count) line-err-info-list)))
               (line       (flymake-ler-line (nth (1- count) line-err-info-list))))
          (message "[%s] %s" line text)
          )
        )
      (setq count (1- count)))))


;;; ; http://dev.ariel-networks.com/Members/matsuyama/detect-syntax-errors-by-flymake
;;; ;; Java
;; redefine to remove "check-syntax" target
;(defun flymake-get-make-cmdline (source base-dir)
;  (list "make"
;        (list "-s"
;              "-C"
;              base-dir
;              (concat "CHK_SOURCES=" source)
;               "SYNTAX_CHECK_MODE=1")))
;
;;; specify that flymake use ant instead of make                                                                                                                
;(setcdr (assoc "\\.java\\'" flymake-allowed-file-name-masks)
;        '(flymake-simple-ant-java-init flymake-simple-java-cleanup))
;
;;; redefine to remove "check-syntax" target
;(defun flymake-get-ant-cmdline (source base-dir)
;  (list "ant"
;        (list "-buildfile"
;              (concat base-dir "/" "build.xml"))))
;
;(add-hook 'java-mode-hook
;          '(lambda ()
;             (flymake-mode)))))


;;; ;; Other
;;; ;; Other
