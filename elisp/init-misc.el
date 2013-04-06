;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-

;;; scrollバー
;; http://d.hatena.ne.jp/m2ym/20110401/1301617991
(require 'yascroll)
(global-yascroll-bar-mode 1)

;;; キーバインド
(global-set-key (kbd "C-h") 'delete-backward-char) ; 削除
(global-set-key (kbd "M-?") 'help-for-help)        ; ヘルプ
;(global-set-key (kbd "C-z") 'undo)                 ; undo
;(global-set-key (kbd "C-M-z") 'redo)                 ; redo
;(global-set-key (kbd "C-c i") 'indent-region)       ; インデント
;(global-set-key (kbd "C-c C-i") 'dabbrev-expand)   ; 補完
;(global-set-key (kbd "C-c ;") 'comment-region)      ; コメントアウト
;(global-set-key (kbd "C-c :") 'uncomment-region)    ; コメント解除
(global-set-key (kbd "C-o") 'toggle-input-method)  ; 日本語入力切替
(global-set-key (kbd "C-\\") nil) ; \C-\の日本語入力の設定を無効にする
;(global-set-key (kbd "C-c ") 'other-frame)         ; フレーム移動
(global-set-key (kbd "M-g") 'goto-line)             ; goto-line


;; ;;; バッファ移動
;; (setq windmove-wrap-around t)
;; ;; Shift + ↓ or → or ← or ↑
;; (windmove-default-keybindings)
;; ;; C-M-{h,j,k,l}でウィンドウ間を移動
;; (define-key global-map (kbd "C-M-k") 'windmove-up)
;; (define-key global-map (kbd "C-M-j") 'windmove-down)
;; (define-key global-map (kbd "C-M-l") 'windmove-right)
;; (define-key global-map (kbd "C-M-h") 'windmove-left)

;; C-tで分割時移動、分割されていない場合は左右分割して移動
(defun other-window-or-split ()
  (interactive)
  (when (one-window-p) (split-window-horizontally))
  (other-window 1))
(global-set-key (kbd "C-t") 'other-window-or-split)

;;; http://d.hatena.ne.jp/genshou/20101013/1286976810
;;; C-wで分割時に逆移動
;; (defun kill-region-or-other-prewindow ()
;;   (interactive)
;;   (if (or (not transient-mark-mode) (region-active-p))
;;       (kill-region (region-beginning) (region-end))
;;     (other-window -1)))
;; (global-set-key (kbd "C-w") 'kill-region-or-other-prewindow)

;; C-x pでC-x oの逆動作
(global-set-key (kbd "C-x p")
		(lambda () (interactive) (other-window -1)))

(defun backward-kill-word-or-kill-region ()
  (interactive)
  (if (or (not transient-mark-mode) (region-active-p))
      (kill-region (region-beginning) (region-end))
    (backward-kill-word 1)))
(global-set-key (kbd "C-w") 'backward-kill-word-or-kill-region)



;;; 日本語の設定 ; Localeに合わせた環境の設定
(set-locale-environment nil)



;;; ホイールマウス
(mouse-wheel-mode t)
(setq mouse-wheel-follow-mofasluse t)

;; ; http://www.geocities.jp/tamiyagi2/emacs.html
;; ;; Ctrl+マウススクロールでズーム
;; (if (and (>= emacs-major-version 23) (window-system))
;;     (progn
;;       (global-set-key
;;        (vector (list 'control mouse-wheel-down-event))
;;        'text-scale-increase)
;;       (global-set-key
;;        (vector (list 'control mouse-wheel-up-event))
;;        'text-scale-decrease)))


;;; 色を付ける
(global-font-lock-mode t)
;(setq font-lock-support-mode 'fast-lock-mode)
(setq font-lock-maximum-decoration t)
(setq fast-lock-cache-directories '("~/.emacs-flc" "."))

;;; ツールバーを消す
(tool-bar-mode 0)



;;; 補完時に大文字小文字を区別しない
(setq completion-ignore-case t)

;;; 強力な補完機能を使う
;;; p-bでprint-bufferとか
;;(load "complete")
;(partial-completion-mode 1)

;;; 補完可能なものを随時表示
;;; 少しうるさい
;(icomplete-mode 1)

;;; http://d.hatena.ne.jp/khiker/20070129/nyumon_gnu_emacs
;;; 少し使いやすいファイラ
(setq dired-dwim-target t)

;;; ; http://d.hatena.ne.jp/peccu/20100202/1265088619
;;; 矩形選択と連番挿入
; (setq cua-enable-cua-key nil)
; (cua-mode t)


;;; (install-elisp-from-emacswiki "sticky.el")
;(require 'sticky)
;(use-sticky-key ";" sticky-alist:ja)	;英語キーボードでは、sticky-alist:en

;;; 日本語マニュアル
;(add-to-list 'Info-directory-list "~/info") ;Symbol's value as variable is void: Info-directory-list



;;;
;;; Emacs lisp テクニックバイブル
;;;

;;; 試行錯誤用ファイルを開くための設定
(require 'open-junk-file)
;; C-x C-zで試行錯誤ファイルを開く
(global-set-key (kbd "C-x C-z") 'open-junk-file)
(setq open-junk-file-format "~/Dropbox/junk/%Y-%m-%d-%H%M%S.")

;;; 式の評価結果を注釈するために設定
(require 'lispxmp)
;; emacs-lisp-modeでC-c C-dを押すと注釈される
(define-key emacs-lisp-mode-map (kbd "C-c C-d") 'lispxmp)
;;; 括弧の対応を保持して変種する設定
(require 'paredit)
(dolist (hook (list
               ;; 'c-mode-hook
               ;; 'c++-mode-hook
               ;; 'java-mode-hook
               ;; 'haskell-mode-hook
               'emacs-lisp-mode-hook
               'lisp-interaction-mode-hook
               'lisp-mode-hook
               ;; 'maxima-mode-hook
               'ielm-mode-hook
               ))
  (add-hook hook '(lambda () (paredit-mode 1))))
(require 'auto-async-byte-compile)
;; 自動バイトコンパイルを無効化にするファイル名の正規表現
(setq auto-async-byte-compile-exclude-files-regexp "/junk/")
(add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-compile-mode)
;; (add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
;; (add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
;; (add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)
;; (setq eldoc-idle-delay 0.2)            ; すぐに表示したい
;; (setq eldoc-minor-mode-string "")      ; モードラインにElDocと表示しない
;; 釣り合いのとれる括弧をハイライトする
(show-paren-mode 1)
;; 改行と同時にインデントも行う
(global-set-key "\C-m" 'newline-and-indent)
;; find-functionをキー割当する
(find-function-setup-keys)



;;;
;;; chapter04
;;;

;;; ffap.el
(ffap-bindings)


;;; uniquify.el
(require 'uniquify)
;; filename<dif> 形式バッファ名にする
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
;; *で囲まれたバッファ名は対象外
(setq uniquify-ignore-buffres-re "*[^*]+*")


;;; iswitchb.el
(iswitchb-mode 1)
;; バッファ読み取り関数を iswitchb にする
(setq read-buffer-function 'iswitchb-read-buffer)
;; 部分文字列の代わりに正規表現を使う場合は t に設定する
(setq iswitchb-regexp nil)
;; 新しいバッファを作成するときにいちいち聞いてこない
(setq iswitchb-prompt-newbuffer nil)


;; (install-elisp-from-emacswiki "recentf-ext.el")
;; 最近のファイルを500個を保存する
(setq recentf-max-saved-items 3000)
;; 最近使ったファイルを加えないでファイルを正規表現でしてする
(setq recentf-exclude '("/TAGS$" "/var/tmp/"))
(require 'recentf-ext)


;; emacsclient
(require 'server)
(unless (server-running-p)
  (server-start))
(defun iconify-emacs-when-server-is-done ()
  (unless server-clients (iconify-frame)))
;; 編集が終了したらEmacsをアイコン化する（好みに応じて）
(add-hook 'server-done-hook 'iconify-emacs-when-server-is-done)
;; C-x C-cに割り当てる（好みに応じて）
(global-set-key (kbd "C-x C-c") 'server-edit)
;; M-x exitでEmacsを終了できるようにする
(defalias 'exit 'save-buffers-kill-emacs)
;;; http://d.hatena.ne.jp/h_iijima/20110401/1301620545
;; emacsclient でアクセスした時の文字コード設定
;; バグ: "emacsclient -c" で起動すると実行されない
(add-hook 'server-visit-hook
          (lambda ()
            (set-terminal-coding-system 'utf-8)
            (set-keyboard-coding-system 'utf-8)))


;; (install-elisp "http://homepage3.nifty.com/oatu/emacs/archives/auto-save-buffers.el")
(require 'auto-save-buffers)
(run-with-idle-timer 2 t 'auto-save-buffers) 




;;;
;;; chapter05
;;;

;(setq transient-mark-mode t)  ;常に有効にする場合 ;Emacs23ではデフォルト有効


;; ;; migemo.el
;; (require 'migemo)
;; ; use ruby-migemo
;; (setq migemo-command "/usr/bin/ruby")
;; ; use cmigemo
;; ;; (setq migemo-command "cmigemo")
;; ;; (setq migemo-options '("-q" "--emacs"))
;; ;; ;; migemo-dictのパスを指定
;; ;; (setq migemo-dictionary "/usr/local/share/euc-jp/migemo-dict")
;; ;; (setq migemo-user-dictionary nil)
;; ;; (setq migemo-regex-dictionary nil)


;; (install-elisp-from-emacswiki "point-undo.el")
(require 'point-undo)
(define-key global-map (kbd "<f7>") 'point-undo)
(define-key global-map (kbd "S-<f7>") 'point-redo)


;; (install-elisp "http://cvs.savannah.gnu.org/viewvc/*checkout*/bm/bm/bm.el")
;; save bookmarks
(setq-default bm-buffer-persistence nil)
(setq bm-restore-repository-on-load t)
(require 'bm)
;; Restoring bookmarks when on file find.
(add-hook 'find-file-hooks 'bm-buffer-restore)
(add-hook 'after-revert-hook 'bm-buffer-restore)
;; Saving bookmark data on killing and saving a buffer
(add-hook 'kill-buffer-hook 'bm-buffer-save)
(add-hook 'after-save-hook 'bm-buffer-save)
(add-hook 'vc-before-checkin-hook 'bm-buffer-save)
;; ;; Loading the repository from file when on start up.
;; (add-hook' after-init-hook 'bm-repository-load)
(global-set-key (kbd "C-M-SPC") 'bm-toggle)
(global-set-key (kbd "M-[") 'bm-previous)
(global-set-key (kbd "M-]") 'bm-next)




;;;
;;; chapter06
;;;

(global-set-key (kbd "C-/") 'undo)                 ; undo
;; (install-elisp-from-emacswiki "redo+.el")
(require 'redo+)
(global-set-key (kbd "C-_") 'redo)
;(global-set-key (kbd "C-M-/") 'redo)
;(define-key global-map "\C-\M-/" 'redo)
(setq undo-no-redo t) ; 過去のundoがredoされないようにする
;; 大量のundoに耐えられようにする
(setq undo-limit 600000)
(setq undo-strong-limit 900000)

;; (install-elisp "http://taiyaki.org/elisp/sense-region/src/sense-region.el")
;(require 'sense-region)
;(sense-region-on)


;; ;;; http://www.nomtats.com/2010/11/auto-completeelemacs.html
;; ;; auto-complete.el
;; (require 'auto-complete-config)
;; ;; (ac-config-default)
;; (add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-20121022.2254/dict/")
;; (require 'auto-complete-clang)
(defun my-ac-cc-mode-setup ()
  ;; 読み込むプリコンパイル済みヘッダ
  (setq ac-clang-prefix-header "stdafx.pch")
  ;; 補完を自動で開始しない
  (setq ac-auto-start nil)
  (setq ac-clang-flags '("-w" "-ferror-limit" "1"))
  (setq ac-sources (append '(ac-source-clang
                             ac-source-yasnippet
                             ac-source-gtags)
                           ac-sources)))

;; (defun my-ac-config ()
;;   (global-set-key "\M-/" 'ac-start)
;;   ;; C-n/C-p で候補を選択
;;   (define-key ac-complete-mode-map "\C-n" 'ac-next)
;;   (define-key ac-complete-mode-map "\C-p" 'ac-previous)
;;   (add-hook 'emacs-lisp-mode-hook 'ac-emacs-lisp-mode-setup)
;;   (add-hook 'c-mode-common-hook 'my-ac-cc-mode-setup)
;;   (add-hook 'ruby-mode-hook 'ac-css-mode-setup)
;;   (add-hook 'auto-complete-mode-hook 'ac-common-setup)
;;   (global-auto-complete-mode t))

;; (my-ac-config)

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-20121022.2254/dict/")
;; (ac-config-default)
    
(require 'auto-complete-clang)
    
;;(setq ac-auto-start nil)
(setq ac-quick-help-delay 0.5)
;; (ac-set-trigger-key "TAB")
;; (define-key ac-mode-map  [(control tab)] 'auto-complete)
(define-key ac-mode-map  [(control tab)] 'auto-complete)
(defun my-ac-config ()
  (setq-default ac-sources '(ac-source-abbrev
			     ac-source-dictionary
			     ac-source-words-in-same-mode-buffers))
  (global-set-key "\M-/" 'ac-start)
  ;; ;; C-n/C-p で候補を選択
  ;; (define-key ac-complete-mode-map "\C-n" 'ac-next)
  ;; (define-key ac-complete-mode-map "\C-p" 'ac-previous)
  ;; C-n/C-p で候補を選択
  (setq ac-use-menu-map t)
  (define-key ac-menu-map "\C-n" 'ac-next)
  (define-key ac-menu-map "\C-p" 'ac-previous)
  (add-hook 'emacs-lisp-mode-hook 'ac-emacs-lisp-mode-setup)
  (add-hook 'c++-mode-common-hook 'ac-cc-mode-setup)
  (add-hook 'c-mode-common-hook 'my-ac-cc-mode-setup)
  (add-hook 'ruby-mode-hook 'ac-ruby-mode-setup)
  (add-hook 'css-mode-hook 'ac-css-mode-setup)
  (add-hook 'auto-complete-mode-hook 'ac-common-setup)
  (global-auto-complete-mode t))

;; ac-source-gtags
(my-ac-config)

;; ;;;
;; ;;; chapter08
;; ;;;

;; ;; w3m.el
;; (require 'w3m-load)

;; ;; twittering-mode.el
;; ; git clone git://github.com/hayamiz/twittering-mode.git
;; (add-to-list 'load-path "~/.emacs.d/elisp/twittering-mode")
;; (require 'twittering-mode)

;; ;(autoload 'twit "twittering-mode" nil t)
;; (setq twittering-username "murase_syuka")
;; ; ;;(setq twittering-password "twitter_passwd")  ;must not use

;; ;(setq twittering-icon-mode t)   ; iconの表示



;;;
;;; chapter12
;;;

;; (install-elisp-from-emacswiki "eldoc-extension.el")
(require 'eldoc-extension)
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)
(setq eldoc-idle-delay 0.2)       ; すぐに表示
(setq eldoc-minor-mode-string "") ; モードラインにElDocと表示しない


;;;
;;; chapter13
;;;


;; (install-elisp-from-emacswiki "summarye.el")
(require 'summarye)
(global-set-key (kbd "C-7") 'se/make-summary-buffer)


;; (auto-install-batch translator)
(require 'text-translator)
(setq text-translator-auto-selection-func
      'text-translator-translate-by-auto-selection-enja)


