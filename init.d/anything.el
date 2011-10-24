;; anything.el
;; Emacs テクニックバイブル P302
;; M-x auto-install-batch anything
(require 'anything-startup)

;; C-o 次の情報源へ移動する
;; Tab アクションリストを表示する
;; C-z ファイル・バッファを「チラ見」する
;; C-g で anything セッションを中断

;; M-x anything-for-files
;; ファイルを開くコマンドをまとめる
;; Emacs テクニックバイブル P311
(global-set-key (kbd "C-'") 'anything-for-files)

;; describe-bindings >> descbinds-anything.el
;; キーバインドを調べる
;; Emacs テクニックバイブル P319
;; <f1> b

;; M-x anything-comlete-shell-history
;; シェルコマンドの履歴から補完する
;; Emacs テクニックバイブル P321
;; (anything-complete-shell-history-setup-key (kbd "C-o"))

;; M-x anything-show-kill-ring
;; 過去の kill-ring の内容を取り出す
;; Emacs テクニックバイブル P323
(global-set-key (kbd "M-y") 'anything-show-kill-ring)

;; anything-c-moccur.el
;; インクリメンタルサーチと occur を合体する
;; Emacs テクニックバイブル P326
;; (install-elisp "http://svn.coderepos.org/share/lang/elisp/anything-c-moccur/trunk/anything-c-moccur.el")
(require 'anything-c-moccur)
(global-set-key (kbd "M-s") 'anything-c-moccur-occur-by-moccur)
;; インクリメンタルサーチから移行できるように
(define-key isearch-mode-map (kbd "C-o") 'anything-c-moccur-from-isearch)

