;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-

;;;http://d.hatena.ne.jp/syohex/20111201/1322665378

(require 'quickrun)

;; 結果の出力バッファと元のバッファを行き来したい場合は
;; ':stick t'の設定をするとよいでしょう
;(push '("*quickrun*") popwin:special-display-config)

;; よく使うならキーを割り当てるとよいでしょう
(global-set-key (kbd "<f5>") 'quickrun)
(global-set-key (kbd "M-<f5>") 'quickrun-compile-only)

;; Add C++ command for C11 and set it default in C++ file.
(quickrun-add-command "c++/clang++"
                      '((:command . "clang++")
                        (:exec . ("%c -x c++ -std=c++11 -lstdc++ %o -o %e %s" "%e %a"))
                        (:remove . ("%e")))
                      :default "c++")

(quickrun-add-command "c++/g++"
                      '((:command . "g++")
                        (:exec . ("%c -x c++ -std=c++11 -lstdc++ %o -o %e %s" "%e %a"))
                        (:remove . ("%e")))
                      :default "c++")

(quickrun-set-default "c++" "c++/g++")
(quickrun-set-default "ruby" "ruby/mruby")

