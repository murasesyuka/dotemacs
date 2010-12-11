;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-

;;; キーバインド
(define-key global-map "\C-h" 'delete-backward-char) ; 削除
(define-key global-map "\M-?" 'help-for-help)        ; ヘルプ
(define-key global-map "\C-z" 'undo)                 ; undo
(define-key global-map "\C-ci" 'indent-region)       ; インデント
;(define-key global-map "\C-c\C-i" 'dabbrev-expand)   ; 補完
;(define-key global-map "\C-c;" 'comment-region)      ; コメントアウト
;(define-key global-map "\C-c:" 'uncomment-region)    ; コメント解除
(define-key global-map "\C-o" 'toggle-input-method)  ; 日本語入力切替
(define-key global-map "\C-\\" nil) ; \C-\の日本語入力の設定を無効にする
;(define-key global-map "\C-c " 'other-frame)         ; フレーム移動
(define-key global-map "\M-g" 'goto-line)             ; goto-line


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


;;; M-x install-elisp-from-emacswiki sticky.el
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


;;;
;;; chapter06
;;;

;; (install-elisp-from-emacswiki "redo+.el")
(require 'redo+)
(global-set-key (kbd "C-M-/") 'redo)
;(define-key global-map "\C-\M-/" 'redo)
(setq undo-no-redo t) ; 過去のundoがredoされないようにする
;; 大量のundoに耐えられようにする
(setq undo-limit 600000)
(setq undo-strong-limit 900000)

;; (install-elisp "http://taiyaki.org/elisp/sense-region/src/sense-region.el")
(require 'sense-region)
(sense-region-on)


