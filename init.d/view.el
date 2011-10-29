;; 起動時のフレームサイズ
(when (equal system-name "ANGELINA.local")
  (setq initial-frame-alist
        (append (list
                 '(width . 120)
                 '(height . 50)
                 '(top . 50)
                 '(left . 50)
                 )
                initial-frame-alist)))

(when (equal system-name "MATHILDA.local")
  (setq initial-frame-alist
        (append (list
                 '(width . 120)
                 '(height . 34)
                 '(top . 50)
                 '(left . 100)
                 )
                initial-frame-alist)))

;; デフォルトのフレームサイズを、起動時のフレームサイズと同一にする
(setq default-frame-alist initial-frame-alist)

;; フォント
;; Carbon 版 Emacs 22.1 のフォント設定
;; http://macemacsjp.sourceforge.jp/matsuan/FontSettingJp.html
(when (eq window-system 'mac)
  (setq mac-print-font-size 10) ;; 印刷のフォントサイズは、フォント設定よりも上部に書く
  (require 'carbon-font)
  (fixed-width-set-fontset "hiramaru" 14))

;; カラー
(if window-system (progn
    (set-background-color "Black")
    (set-foreground-color "LightGray")
    (set-cursor-color "Gray")
    (set-frame-parameter nil 'alpha 80)
    )
)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
)
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
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

;; jaspace
(require 'jaspace)
(add-hook 'text-mode-hook 'jaspace-mode)

;; 改行記号を表示させる
(setq jaspace-alternate-eol-string "↓\n")

;; 全角空白を表示させる
(setq jaspace-alternate-jaspace-string "□")

;; タブを表示
(setq jaspace-highlight-tabs t)

