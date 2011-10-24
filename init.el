;; Emacs ビギナーに贈る、これからバリバリ使い隊!!人のための設定講座 その1。 - 日々、とんは語る。
;; http://d.hatena.ne.jp/tomoya/20090121/1232536106
(setq load-path (cons "~/.emacs.d/elisp" load-path))

;; 初期設定ファイルの読み込み
;; (setq load-path (cons "~/.emacs.d/init.d" load-path))
(load "~/.emacs.d/init.d/keybinds.el")
(load "~/.emacs.d/init.d/view.el")
(load "~/.emacs.d/init.d/auto-complete.el")
(load "~/.emacs.d/init.d/migemo.el")
(load "~/.emacs.d/init.d/anything.el")

;; auto-install.el
;; Emacs Lisp インストーラを利用する
;; Emacs テクニックバイブル P49
;; (install-elisp-from-emacswiki "auto-install.el")
(require 'auto-install)
;; 起動時に EmacsWiki のページ名を補完候補に加える
;; wget が必要 >> $ brew install wget
;; (auto-install-update-emacswiki-package-name t)
;; install-elisp.el 互換モードにする
(auto-install-compatibility-setup)
;; Emacs Lisp ファイルの保存場所
(setq auto-install-directory "~/.emacs.d/elisp/")
;; ediff 関連のバッファを 1つのフレームにまとめる
(setq ediff-window-setup-function 'ediff-setup-windows-plain)

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
;; (describe-function '関数名)    ;; 関数の説明
;; (describe-variable '変数名)    ;; 変数の説明
;; (find-function '関数名)        ;; 関数定義
;; (find-variable '変数名)        ;; 変数定義
;; (describe-bindings)            ;; キーに割り当てられているコマンド一覧
;; (describe-key (kbd "C-h"))     ;; キーに割り当てられているコマンド
;; (describe-key "\C-h")          ;; キーに割り当てられているコマンド

;; ELPA
;; パッケージを簡単にインストールする
;; Emacs テクニックバイブル P52
;; (install-elisp "http://tromey.com/elpa/package-install.el")

;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))

;; 日本語 info
;; Emacs テクニックバイブル P56
;; http://www.rubyist.net/~rubikitch/archive/emacs-elisp-info-ja.tgz
;; $ sudo -e /usr/share/info/dir
;; M-x info で Emacs-ja が表示されないため保留
;; (add-to-list 'Info-default-directory-list "~/info/")

;; Carbon Emacsのinfoの再設定 - Secondary Storage
;; http://d.hatena.ne.jp/zqwell-ss/20091129/1259500395
;; Carbon Emacsにelisp, emacsの日本語マニュアルをインストールする - Secondary Storage
;; http://d.hatena.ne.jp/zqwell-ss/20091206/1260119701
;; (setenv "INFOPATH"
;;         (concat '"/Users/inouetakuya/info:"
;;                 (getenv "INFOPATH")))

;; iswitchb.el
;; バッファ切替を強化する
;; Emacs テクニックバイブル P85
;; C-s で次候補を選択部分文字列に一致する候補を並べてくれる
(iswitchb-mode t)
;; バッファ読み取り関数を iswitchb にする
(setq read-buffer-function 'iswitchb-read-buffer)

;; recentf.el
;; 最近使ったファイルを開く
;; Emacs テクニックバイブル P87
(require 'recentf-ext)
(setq recentf-max-saved-items 500)
(global-set-key (kbd "C-;") 'recentf-open-files)

;; bookmark.el
;; ファイル内の特定の位置をブックマークする
;; Emacs テクニックバイブル P89
;; C-x r m（bookmark-set）
;; C-x r l（bookmark-bmenu-list）
;; d または k で削除マークを付けて x で削除
;; ブックマークを変更したら即保存する
(setq bookmark-save-flag t)
;; 超整理法
(progn
  (setq bookmark-sort-flag nil)
  (defun bookmark-arrange-latest-top ()
    (let ((latest (bookmark-get-bookmark bookmark)))
      (setq bookmark-alist (cons latest (delq latest bookmark-alist))))
    (bookmark-save))
  (add-hook 'bookmark-after-jump-hook 'bookmark-arrange-latest-top))

;; emacsclient
;; シェルから現在の Emacs にアクセスする
;; Emacs テクニックバイブル P91
;; emacsclientを使おう - Life is very short
;; http://d.hatena.ne.jp/syohex/20101224/1293206906
;; Gitのcore.editorにEmacsを指定する試行錯誤(Macの場合) (Kanasansoft Web Lab.)
;; http://www.kanasansoft.com/weblab/2010/03/git_core_editor_emacs_mac.html
(when (eq window-system 'mac)
  (require 'server)
  (server-start)
  ;; 終了コマンド（デフォルトは C-x #）
  (global-set-key (kbd "C-x C-c") 'server-edit))
;; M-x exit で Emacs を終了できるようにする
(defalias 'exit 'save-buffers-kill-emacs)

;; wdired.el
;; ディレクトリ内のファイル名を自由自在に編集する
;; Emacs テクニックバイブル P102
;; r で Editable Dired モードにする
;; 書き換えが終了したら、C-c C-c か C-x C-s
;; 変更を反映しない場合は C-c C-k
(define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)

;; color-moccur.el
;; バッファ内（複数可）を検索する
;; Emacs テクニックバイブル P155
;; (M-x install-elisp-from-emacswiki color-moccur.el)
(require 'color-moccur)
(setq moccur-split-word t)

;; moccur-edit.el
;; color-moccur.el の結果を編集する
;; Emacs テクニックバイブル P157
;; (M-x install-elisp-from-emacswiki moccur-edit.el)
;; M-x moccur または M-x occur-by-moccur の検索結果表示中に
;; r（または C-c C-i）で編集状態になる
;; C-c C-c（moccur-edit-finish-edit） で変更をファイルに反映させる
;; C-c C-k（moccur-edit-kill-all-change）で変更を破棄
(require 'moccur-edit)

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

;; ============================================================
;; 起動時にロゴを表示させない
(setq inhibit-startup-message t)

;; ビープ音を消す
(setq visible-bell t)

;; Elscreen
(when (eq window-system 'mac)
  (load "elscreen" "ElScreen" t))

