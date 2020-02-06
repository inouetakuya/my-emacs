;; 初期設定ファイルの読み込み
(load "~/.emacs.d/init.d/keybindings.el")
(load "~/.emacs.d/init.d/view.el")

;; 起動時にロゴを表示させない
(setq inhibit-startup-message t)

;; ビープ音を消す
(setq visible-bell t)
