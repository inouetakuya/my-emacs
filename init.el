;; ============================================================
;; Emacs ビギナーに贈る、これからバリバリ使い隊!!人のための設定講座 その1。 - 日々、とんは語る。
;; http://d.hatena.ne.jp/tomoya/20090121/1232536106
(setq load-path (cons "~/.emacs.d/elisp" load-path))

;; install-elisp
(require 'install-elisp)

;; インストールする場所
(setq install-elisp-repository-directory "~/.emacs.d/elisp/")

;; 次からは、インストールしたい Elisp ファイルがあれば、
;; M-x install-elisp というコマンドを実行して、流れのままに、
;; Elisp ファイルの URL を入力して、流れのままに C-c C-c とタイプして、
;; インストールを完了して下さい。

;; その後は、.emacs に設定を書くだけです。
;; なので、今後は、ほぼ設定を書くという作業だけに集中できる様になりました

;; 参考: install-elisp で使えるコマンド
;; M-x install-elisp
;;   URL を入力して、Elisp をインストールするコマンド
;; M-x install-elisp-from-emacswiki
;;   EmacsWikiで公開されている Elisp の名前を入力するだけでインストールできるコマンド
;; M-x dired-install-elisp-from-emacswiki
;;   dired(Emacs 組み込みのファイラー)で選択しているファイルをEmacsWikiからインストールするコマンド 

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

;; タブではなくスペースを挿入する
(setq-default indent-tabs-mode nil)

;; ============================================================
;;【コラム】OS X ハッキング! (79) Carbon Emacsの設定(1) | パソコン | マイコミジャーナル
;; http://journal.mycom.co.jp/column/osx/079/index.html

;; 110718 MacPorts から Homebrew に乗り換えたので不要となった
;; ;; MacPorts のパスを優先させる
;; (setenv "PATH"
;;         (concat '"/opt/local/bin:"    ;; MacPorts へのパス
;;                 '"/usr/local/bin:"    ;; Django の django-admin.py へのシンボリックリンク
;;                 (getenv "PATH")))

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

;; 論理行ではなく物理行で移動する
(require 'physical-line)
(setq-default physical-line-mode t)

;; 初期ファイルの読み込み
;; (setq load-path (cons "~/.emacs.d/init.d" load-path))
(load "~/.emacs.d/init.d/keybinds.el")
(load "~/.emacs.d/init.d/view.el")

;; ビープ音を消す
(setq visible-bell t)

;; ============================================================
;; Elscreen
(when (eq window-system 'mac)
  (load "elscreen" "ElScreen" t))

;; Usage
;; -----
;; You may use following sequences on ElScreen:
;; 
;;   C-z c
;;   C-z C-c  Create a new screen and switch to it.
;;   C-z C    Create a new screen with the window-configuration of the
;;            current screen.
;;   C-z k
;;   C-z C-k  Kill current screen.
;;   C-z M-k  Kill current screen and buffers.
;;   C-z K    Kill other screens.
;;   C-z n
;;   C-z C-n  Switch to the "next" screen in a cyclic order.
;;   C-z p
;;   C-z C-p  Switch to the "previous" screen in a cyclic order.
;;   C-z a
;;   C-z C-a  Toggle to the screen selected previously.
;;   C-z '    Prompt for a screen number to switch to.
;;   C-z "    Present a list of all screens for selection.
;;   C-z 0
;;     :      Jump to the screen number 0-9.
;;   C-z 9
;;   C-z C-s  Swap current screen with previous one.
;;   C-z w
;;   C-z C-w  Show a list of screen.
;;   C-z A    Allow the user to enter a name for the current screen.
;;   C-z m
;;   C-z C-m  Repeat the last message displayed in the mini-buffer.
;;   C-z t
;;   C-z C-t  Show system information.
;;   C-z b    Switch to the screen in which specified buffer is displayed.
;;   C-z C-f  Create new screen and open file.
;;   C-z C-r  Create new screen and open file but don't allow changes.
;;   C-z d    Create new screen and run dired.
;;   C-z M-x  Read function name, then call it with new screen.
;;   C-z i    Show/hide the screen number in the mode line.
;;   C-z T    Show/hide the tab on the top of each frame.
;;   C-z v    Display ElScreen version.
;;   C-z ?    Show key bindings of ElScreen and Add-On softwares.


