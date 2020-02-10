;; 新しいウィンドウに移る
;; 分割していないときは、左右分割して、新しいウィンドウに移る
(defun other-window-or-split ()
  (interactive)
  (when (one-window-p)
    (split-window-horizontally))
  (other-window 1))
(global-set-key (kbd "C-t") 'other-window-or-split)

;; キーバインド（グローバル）
(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "C-c >") 'comment-region)
(global-set-key (kbd "C-c <") 'uncomment-region)

;; sequential-command.el
;; 同じコマンドを連続実行したときの振舞いを変更する
;; Emacs テクニックバイブル P76
(require 'sequential-command-config)
(sequential-command-setup-keys)

;; 文字列を置換する
;; Emacs テクニックバイブル P151
(global-set-key (kbd "C-c r") 'query-replace)

;; 正規表現置換をする
;; Emacs テクニックバイブル P153
(defalias 'qrr 'query-replace-regexp)

;; リドゥ
(require 'redo)
(global-set-key (kbd "C-\\") 'redo)
