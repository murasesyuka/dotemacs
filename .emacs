;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-



;; OSを判別、UNIX系？
(defvar run-unix
  (or (equal system-type 'gnu/linux)
      (or (equal system-type 'usg-unix-v)
          (or  (equal system-type 'berkeley-unix)
               (equal system-type 'cygwin)))))


; OSを判別、個別判別
(defvar run-linux
  (equal system-type 'gnu/linux))
(defvar run-system-v
  (equal system-type 'usg-unix-v)); OpenSolaris2090.06
(defvar run-bsd
  (equal system-type 'berkeley-unix))
(defvar run-cygwin ;; cygwinもunixグループにしておく
  (equal system-type 'cygwin))

(defvar run-w32
  (and (null run-unix)
       (or (equal system-type 'windows-nt)
           (equal system-type 'ms-dos))))
(defvar run-darwin (equal system-type 'darwin))



;; Emacsenの種類とVerを判別
(defvar run-emacs20
  (and (equal emacs-major-version 20)
       (null (featurep 'xemacs))))
(defvar run-emacs21
  (and (equal emacs-major-version 21)
       (null (featurep 'xemacs))))
(defvar run-emacs22
  (and (equal emacs-major-version 22)
       (null (featurep 'xemacs)))); OpenSolaris2090.06
(defvar run-emacs23
  (and (equal emacs-major-version 23)
       (null (featurep 'xemacs))))
(defvar run-emacs24
  (and (equal emacs-major-version 24)
       (null (featurep 'xemacs))))


;; meadowの種類とVerを判別
(defvar run-meadow (featurep 'meadow))
(defvar run-meadow1 (and run-meadow run-emacs20))
(defvar run-meadow2 (and run-meadow run-emacs21))
(defvar run-meadow3 (and run-meadow run-emacs22))



(defvar run-xemacs (featurep 'xemacs))
(defvar run-xemacs-no-mule
  (and run-xemacs (not (featurep 'mule))))
(defvar run-carbon-emacs (and run-darwin window-system))






;; elispディレクトリをload-pathに追加
(setq load-path (append '(
			  "~/.emacs.d/elisp"
			  "~/.emacs.d/auto-install"
			  ;; "~/.emacs.d/plugin/org-mode/head/lisp";the latest org-mode
			  "~/.emacs.d/plugin/org-mode/org-7.8.10/lisp";org-mode
			  ) load-path))

;(add-to-list `load-path "~/svn2git/emacswikipages/" t) ; add to last


;;;auto-install.el
;; (install-elisp-from-emacswiki "auto-install.el")
(require 'auto-install)
(setq auto-install-directory "~/.emacs.d/auto-install/")
(auto-install-update-emacswiki-package-name t) ; EmacsWikiのページ名を保管候補に追加
(auto-install-compatibility-setup)             ; 互換性確保
(setq ediff-windows-setup-function 'ediff-setup-windowss-plain) ;ediff関連のバッファを１フレームに纏める



;;; MELPA ; http://melpa.milkbox.net/
;;; Marmalade ; http://marmalade-repo.org/
;; http://repo.or.cz/w/emacs.git/blob_plain/1a0a666f941c99882093d7bd08ced15033bc3f0c:/lisp/emacs-lisp/package.el
(add-to-list 'load-path "~/.emacs.d/elpa/") ;; package.el for emacs 23
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/")
	     '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;; 個別の設定をロードしまくりパート

;; 特定ディレクトリ以下を自動でロードするようにしてもいいけど、順番とか、
;; これやっぱ外しておこうとかいうのを調整するのが面倒。
(load "init-helm")

(load "init-face")
(load "init-e2wm")

(load "init-opensolaris")

(load "init-c_cpp")
(load "init-ruby")
(load "init-rails")
;(load "init-python") 			;commentout for update emacs24
;(load "init-scala")
(load "init-javascript")
(load "init-clojure")

(load "init-flymake")
(load "init-gnu_global")
(load "init-gdb")
(load "init-rst")
(load "init-org")
(load "init-quickrun")

(load "init-misc")





