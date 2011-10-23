;; auto-complete.el
;; IDE のような入力支援をする
;; Auto Complete Mode - GNU Emacsのための最も賢い自動補完機能
;; http://cx4a.org/software/auto-complete/index.ja.html
;; Auto Complete Modeユーザーマニュアル
;; http://cx4a.org/software/auto-complete/manual.ja.html
;; Emacs テクニックバイブル P143
;; (require 'auto-complete)
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elisp/ac-dict")
(ac-config-default)
(global-auto-complete-mode t)
;; global-auto-complete-mode が有効な時に auto-complete-mode が自動的に有効になるモード
;; (describe-variable 'ac-modes)
(setq ac-auto-start t)

;; 補完の中止は C-g でも可能だが、マクロ定義中などは C-g したくないので
(define-key ac-completing-map (kbd "M-/") 'ac-stop)
(define-key ac-completing-map (kbd "C-n") 'ac-next)
(define-key ac-completing-map (kbd "C-p") 'ac-previous)

