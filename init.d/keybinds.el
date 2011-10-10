;; キーバインド（グローバル）
(global-set-key "\C-h" 'delete-backward-char)
(global-set-key "\C-c>" 'comment-region)
(global-set-key "\C-c<" 'uncomment-region)
(global-set-key "\C-xg" 'goto-line)

;; カーソル位置から行頭まで削除する
(defun backward-kill-line (arg)
  "Kill chars backward until encountering the end of a line."
  (interactive "p")
  (kill-line 0))
(global-set-key (kbd "C-u") 'backward-kill-line)

;; リドゥ
(require 'redo)
(global-set-key "\C-\\" 'redo)

;; シフト + 矢印で範囲選択
(setq pc-select-selection-keys-only t)
(pc-selection-mode t) 

