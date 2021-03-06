;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-

(require 'haskell-mode)
(require 'haskell-cabal)

(add-to-list 'auto-mode-alist '("\\.hs$" . haskell-mode))
(add-to-list 'auto-mode-alist '("\\.lhs$" . literate-haskell-mode))
(add-to-list 'auto-mode-alist '("\\.cabal\\'" . haskell-cabal-mode))

(custom-set-variables
 '(haskell-mode-hook '(turn-on-haskell-indentation))
 )

