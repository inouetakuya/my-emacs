;; Emacs ビギナーに贈る、これからバリバリ使い隊!!人のための設定講座 その1。 - 日々、とんは語る。
;; http://d.hatena.ne.jp/tomoya/20090121/1232536106
(setq load-path (cons "~/.emacs.d/elisp" load-path))

;; 初期設定ファイルの読み込み
;; (setq load-path (cons "~/.emacs.d/init.d" load-path))
(load "~/.emacs.d/init.d/keybinds.el")
(load "~/.emacs.d/init.d/view.el")

;; install-elisp
(require 'install-elisp)
(setq install-elisp-repository-directory "~/.emacs.d/elisp/")

;; M-x install-elisp
;; URL を入力して、Elisp をインストールするコマンド

;; M-x install-elisp-from-emacswiki
;; EmacsWikiで公開されている Elisp の名前を入力するだけでインストールできるコマンド
;; M-x dired-install-elisp-from-emacswiki
;; dired（Emacs 組み込みのファイラー）で選択しているファイルをEmacsWikiからインストールするコマンド 

;; C-x C-e
;; テキストに埋め込まれた Emacs Lips 式を評価する
;; Emacs テクニックバイブル P43
;; 役立つハイパーリンク関数
;; (find-file "ファイル名")
;; (shell-command "シェルコマンド")
;; (man "プログラム名")
;; (info "(ファイル名)ノード名")
;; (install-elisp "URL")
;; (install-elisp-from-emacswiki "ファイル名")
;; (describe-function '関数名)
;; (describe-variable '変数名)
;; (find-function '関数名)
;; (find-variable '変数名)

;; ELPA
;; パッケージを簡単にインストールする
;; Emacs テクニックバイブル P52
;; (install-elisp "http://tromey.com/elpa/package-install.el")

;; recentf.el
;; 最近使ったファイルを開く
;; Emacs テクニックバイブル P87
(require 'recentf-ext)
(setq recentf-max-saved-items 500)
(global-set-key (kbd "C-c C-r") 'recentf-open-files)

;; ============================================================
;; Emacs(中略)設定講座 その2「elisp のインストールと設定編」。 - 日々、とんは語る。
;; http://d.hatena.ne.jp/tomoya/20090124/1232822594

;; auto-complete
(require 'auto-complete)
(global-auto-complete-mode t)
(setq ac-auto-start t)
;; (setq ac-auto-start 3)
(global-set-key "\M-/" 'ac-start)
(define-key ac-complete-mode-map "\M-/" 'ac-stop)
(define-key ac-complete-mode-map "\C-n" 'ac-next)
(define-key ac-complete-mode-map "\C-p" 'ac-previous)

;; ============================================================
;; Git を使うときに日本語でも文字化けしないようにする
(setenv "LANG" "ja_JP.UTF-8")

;; ansi-term でも日本語が文字化けしないようにする
;; 一時的な設定変更は（C-c 押した後）M-x set-locale-environment >> utf-8
;; ただし、Emacs 22.3 だと、部分的に文字化けする。Emacs 23.3 なら、文字化けしない
(setq locale-coding-system 'utf-8)

;; Emacs 上で快適に Bash や Zsh を利用する設定 : 紹介マニア
;; http://sakito.jp/emacs/emacsshell.html
;; multi-term は term を拡張したモードになります。
;; term は確かに優れたモードですがいくつかの問題も存在しています。
;;     * 複数起動ができません
;;     * Emacs の標準的なキーを多数奪ってしまいます
;;     * exit してもバッファが消えません
;;     * Emacs 終了時に term 内の shell を終了していないと自動で終了してくれません
;;     * デバッグプログラムのための専用ウィンドウを持ちません
;; これらを解決するために multi-term.el を利用します。
(require 'multi-term)
(setq multi-term-program shell-file-name)

;; Emacs テクニックバイブル P189
;; M-x shell にもエスケープシーケンスによる色が付くようにする
;; >> git diff してもカラー表示されない
;; 下記の記事とかみたら、いろいろと大変そうだったので見送った
;; Emacs の shell-mode で zsh を有効活用 - mooz deceives you
;; http://d.hatena.ne.jp/mooz/20090613/p1
;; (add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; ============================================================
;; git-commit-modeの導入 - Life is very short
;; http://d.hatena.ne.jp/syohex/20110308/1299596133
(require 'git-commit)
(set-face-foreground 'git-commit-summary-face nil)
(set-face-bold-p     'git-commit-summary-face nil)
(set-face-foreground 'git-commit-nonempty-second-line-face nil)

;; emacsclientを使おう - Life is very short
;; http://d.hatena.ne.jp/syohex/20101224/1293206906

;; Gitのcore.editorにEmacsを指定する試行錯誤(Macの場合) (Kanasansoft Web Lab.)
;; http://www.kanasansoft.com/weblab/2010/03/git_core_editor_emacs_mac.html
(when (eq window-system 'mac)
  (require 'server)
  (server-start))

;; ============================================================
;; 起動時にロゴを表示させない
(setq inhibit-startup-message t)

;; ビープ音を消す
(setq visible-bell t)

;; Elscreen
(when (eq window-system 'mac)
  (load "elscreen" "ElScreen" t))





;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))
