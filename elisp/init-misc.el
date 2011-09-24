;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-

;;; キーバインド
(global-set-key (kbd "C-h") 'delete-backward-char) ; 削除
(global-set-key (kbd "M-?") 'help-for-help)        ; ヘルプ
(global-set-key (kbd "C-z") 'undo)                 ; undo
(global-set-key (kbd "C-M-z") 'redo)                 ; redo
;(global-set-key (kbd "C-c i") 'indent-region)       ; インデント
;(global-set-key (kbd "C-c C-i") 'dabbrev-expand)   ; 補完
;(global-set-key (kbd "C-c ;") 'comment-region)      ; コメントアウト
;(global-set-key (kbd "C-c :") 'uncomment-region)    ; コメント解除
(global-set-key (kbd "C-o") 'toggle-input-method)  ; 日本語入力切替
(global-set-key (kbd "C-\\") nil) ; \C-\の日本語入力の設定を無効にする
;(global-set-key (kbd "C-c ") 'other-frame)         ; フレーム移動
(global-set-key (kbd "M-g") 'goto-line)             ; goto-line


;;; バッファ移動
(setq windmove-wrap-around t)
;; Shift + ↓ or → or ← or ↑
(windmove-default-keybindings)
;; C-M-{h,j,k,l}でウィンドウ間を移動
(define-key global-map (kbd "C-M-k") 'windmove-up)
(define-key global-map (kbd "C-M-j") 'windmove-down)
(define-key global-map (kbd "C-M-l") 'windmove-right)
(define-key global-map (kbd "C-M-h") 'windmove-left)


;;; 日本語の設定 ; Localeに合わせた環境の設定
(set-locale-environment nil)



;;; ホイールマウス
(mouse-wheel-mode t)
(setq mouse-wheel-follow-mofasluse t)

;;; 色を付ける
(global-font-lock-mode t)
;(setq font-lock-support-mode 'fast-lock-mode)
(setq font-lock-maximum-decoration t)
(setq fast-lock-cache-directories '("~/.emacs-flc" "."))

;;; 対応する括弧を光らせる。
(show-paren-mode 1)

;;; ツールバーを消す
(tool-bar-mode 0)



;;; 補完時に大文字小文字を区別しない
(setq completion-ignore-case t)

;;; 強力な補完機能を使う
;;; p-bでprint-bufferとか
;;(load "complete")
(partial-completion-mode 1)

;;; 補完可能なものを随時表示
;;; 少しうるさい
(icomplete-mode 1)



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

;; (install-elisp "http://homepage3.nifty.com/oatu/emacs/archives/auto-save-buffers.el")
(require 'auto-save-buffers)
(run-with-idle-timer 2 t 'auto-save-buffers) 




;;;
;;; chapter05
;;;

;(setq transient-mark-mode t)  ;常に有効にする場合 ;Emacs23ではデフォルト有効


;; migemo.el
(require 'migemo)
; use ruby-migemo
(setq migemo-command "/usr/bin/ruby")
; use cmigemo
;; (setq migemo-command "cmigemo")
;; (setq migemo-options '("-q" "--emacs"))
;; ;; migemo-dictのパスを指定
;; (setq migemo-dictionary "/usr/local/share/euc-jp/migemo-dict")
;; (setq migemo-user-dictionary nil)
;; (setq migemo-regex-dictionary nil)


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
(global-set-key (kbd "C-M-/") 'redo)
;(define-key global-map "\C-\M-/" 'redo)
(setq undo-no-redo t) ; 過去のundoがredoされないようにする
;; 大量のundoに耐えられようにする
(setq undo-limit 600000)
(setq undo-strong-limit 900000)

;; (install-elisp "http://taiyaki.org/elisp/sense-region/src/sense-region.el")
;(require 'sense-region)
;(sense-region-on)



;;;
;;; chapter08
;;;

;; w3m.el
(require 'w3m-load)

;; twittering-mode.el
; git clone git://github.com/hayamiz/twittering-mode.git
(add-to-list 'load-path "~/.emacs.d/elisp/twittering-mode")
(require 'twittering-mode)

;(autoload 'twit "twittering-mode" nil t)
(setq twittering-username "murase_syuka")
; ;;(setq twittering-password "twitter_passwd")  ;must not use

;(setq twittering-icon-mode t)   ; iconの表示



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


