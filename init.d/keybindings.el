;; キーバインド（グローバル）
(global-set-key (kbd "C-h") 'delete-backward-char)

;; sequential-command.el
;; 同じコマンドを連続実行したときの振舞いを変更する
;; Emacs テクニックバイブル P76
(require 'sequential-command-config)
(sequential-command-setup-keys)
