;; Emacs に問い合わせする
;; Emacs テクニックバイブル P54
;; (describe-bindings)          ;; キーに割り当てられているコマンド一覧
;; (describe-key (kbd "C-h"))   ;; キーに割り当てられているコマンド
;; (describe-key "\C-h")        ;; キーに割り当てられているコマンド

;; コマンドメモ
;; Emacs テクニックバイブル P69
;; (describe-key (kbd "C-x TAB"))   ;; リージョン範囲をインデントする
;; (describe-key (kbd "C-x C-w"))   ;; 別の名前でバッファを保存する
;; (describe-key (kbd "C-x C-x"))   ;; ポイントとマークを入れ替える
;; (describe-key (kbd "C-x C-0"))   ;; 現在のウィンドウを消す

;; プレフィクスキーメモ
;; "C-x r"  ;; レジスタ（Register）、矩形（Rectangle）関連
;; "C-x v"  ;; バージョン管理（Version control）関連
;; "C-c"    ;; C-c に続くキー列はグローバルキーマップには登録されていない
            ;; C-c の後にコントロール文字（C-a から C-z）、
            ;;     数字、[ ] < > ; : が続くキー列はメジャーモードが使う
            ;;     その他はユーザが自由に定義してよい

;; define-key
;; Emacs テクニックバイブル P73
;; 端末上の Emacs では使えないキー
;; C-; C-: C-@ C-, C-.
;; C-t はカーソル前後の文字を入れ替える transpose-chars コマンドに
;;     割り当てられているが、このコマンドを使わない人にとっては準特等席

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
(global-set-key (kbd "C-x g") 'goto-line)

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

;; カーソル位置から行頭まで削除する
(defun backward-kill-line (arg)
  "Kill chars backward until encountering the end of a line."
  (interactive "p")
  (kill-line 0))
(global-set-key (kbd "C-u") 'backward-kill-line)

;; リドゥ
(require 'redo)
(global-set-key (kbd "C-\\") 'redo)

;; シフト + 矢印で範囲選択
(setq pc-select-selection-keys-only t)
(pc-selection-mode t) 

;; タブではなくスペースを挿入する
(setq-default indent-tabs-mode nil)

;; 論理行ではなく物理行で移動する
(require 'physical-line)
(setq-default physical-line-mode t)
