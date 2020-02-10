;; Emacs ビギナーに贈る、これからバリバリ使い隊!!人のための設定講座 その1。 - 日々、とんは語る。
;; http://d.hatena.ne.jp/tomoya/20090121/1232536106
(setq load-path (cons "~/.emacs.d/elisp" load-path))

;; 初期設定ファイルの読み込み
(load "~/.emacs.d/init.d/keybindings.el")
(load "~/.emacs.d/init.d/view.el")

;; 起動時にロゴを表示させない
(setq inhibit-startup-message t)

;; ビープ音を消す
(setq visible-bell t)
