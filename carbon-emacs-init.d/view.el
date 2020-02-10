;; フォント
;; Carbon 版 Emacs 22.1 のフォント設定
;; http://macemacsjp.sourceforge.jp/matsuan/FontSettingJp.html
(when (eq window-system 'mac)
  (setq mac-print-font-size 10) ;; 印刷のフォントサイズは、フォント設定よりも上部に書く
  (require 'carbon-font)
  (fixed-width-set-fontset "hiramaru" 14))

;; jaspace
(require 'jaspace)
(add-hook 'text-mode-hook 'jaspace-mode)

;; 改行記号を表示させる
(setq jaspace-alternate-eol-string "↓\n")

;; 全角空白を表示させる
(setq jaspace-alternate-jaspace-string "□")

;; タブを表示
(setq jaspace-highlight-tabs t)
