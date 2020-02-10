;; 起動時のフレームサイズ
(when (equal system-name "GISELE.local")
  (setq initial-frame-alist
        (append (list
                 '(width . 120)
                 '(height . 40)
                 '(top . 800)
                 '(left . 1200)
                 )
                initial-frame-alist)))

;; デフォルトのフレームサイズを、起動時のフレームサイズと同一にする
(setq default-frame-alist initial-frame-alist)

;; カラー
(if window-system (progn
    (set-background-color "Black")
    (set-foreground-color "LightGray")
    (set-cursor-color "Gray")
    (set-frame-parameter nil 'alpha 80)
    )
)

;; 行番号を表示
(require 'linum)
(global-linum-mode t)

;; 列番号を表示
(column-number-mode t)

;; リージョンのハイライト
(setq transient-mark-mode t)

;; C-x 3 とかしたときにも行の折り返しをする
(setq truncate-partial-width-windows nil)

;; 対応する括弧を光らせる
(show-paren-mode t)
