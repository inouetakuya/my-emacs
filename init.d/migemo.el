;; migemo.el
;; ローマ字のまま日本語をインクリメンタルサーチする
;; Emacs テクニックバイブル P113
;; Carbon Emacs に Migemo をインストールする - Secondary Storage
;; http://d.hatena.ne.jp/zqwell-ss/20091129/1259489661

;; $ cd ~/.emacs.d

;; $ wget http://0xcc.net/migemo/migemo-0.40.tar.gz
;; $ tar xvfz migemo-0.40.tar.gz

;; $ wget http://0xcc.net/ruby-bsearch/ruby-bsearch-1.5.tar.gz
;; $ tar xvfz ruby-bsearch-1.5.tar.gz

;; $ wget http://0xcc.net/ruby-romkan/ruby-romkan-0.4.tar.gz
;; $ tar xvfz ruby-romkan-0.4.tar.gz

;; $ cp ruby-romkan-0.4/romkan.rb migemo-0.40
;; $ cp ruby-romkan-0.4/romkan.rb /Library/Ruby/Site/
;; $ cp ruby-bsearch-1.5/bsearch.rb migemo-0.40
;; $ cp ruby-bsearch-1.5/bsearch.rb /Library/Ruby/Site/

;; $ cd migemo-0.40
;; （下記の方がよい）$ ./configure --with-emacs=/Applications/Emacs.app/Contents/MacOS/Emacs --with-lispdir=/Applications/Emacs.app/Contents/Resources/site-lisp

;; （こちらがベター）$ ./configure --with-emacs=/Applications/Emacs.app/Contents/MacOS/Emacs --with-lispdir=~/.emacs.d/elisp

;; $ make
;; $ sudo make install

;; $ cp migemo.el ~/.emacs.d/elisp/
;; $ cp migemo.elc ~/.emacs.d/elisp/
(require 'migemo)



;; ------------------------------------------------------------
;; （以下、インストールログ）
;;
;; bash-3.2$ cd ~/.emacs.d
;; bash-3.2$ wget http://0xcc.net/migemo/migemo-0.40.tar.gz
;; --2011-10-24 16:47:24--  http://0xcc.net/migemo/migemo-0.40.tar.gz
;; Resolving 0xcc.net... 182.48.49.14
;; Connecting to 0xcc.net|182.48.49.14|:80... connected.
;; HTTP request sent, awaiting response... 200 OK
;; Length: 1674941 (1.6M) [application/x-tar]
;; Saving to: `migemo-0.40.tar.gz'

;; 100%[======================================>] 1,674,941    496K/s   in 3.7s    

;; 2011-10-24 16:47:29 (441 KB/s) - `migemo-0.40.tar.gz' saved [1674941/1674941]

;; bash-3.2$ tar xvfz migemo-0.40.tar.gz
;; x migemo-0.40/
;; x migemo-0.40/Makefile.in
;; x migemo-0.40/README
;; x migemo-0.40/AUTHORS
;; x migemo-0.40/COPYING
;; x migemo-0.40/ChangeLog
;; x migemo-0.40/INSTALL
;; x migemo-0.40/Makefile.am
;; x migemo-0.40/NEWS
;; x migemo-0.40/acinclude.m4
;; x migemo-0.40/aclocal.m4
;; x migemo-0.40/configure
;; x migemo-0.40/configure.in
;; x migemo-0.40/elisp-comp
;; x migemo-0.40/install-sh
;; x migemo-0.40/migemo.rb.in
;; x migemo-0.40/missing
;; x migemo-0.40/mkinstalldirs
;; x migemo-0.40/migemo
;; x migemo-0.40/migemo-grep
;; x migemo-0.40/migemo-server
;; x migemo-0.40/migemo-client
;; x migemo-0.40/migemo-dict.rb
;; x migemo-0.40/migemo-regex.rb
;; x migemo-0.40/migemo-convert.rb
;; x migemo-0.40/migemo-index.rb
;; x migemo-0.40/migemo-cache.rb
;; x migemo-0.40/migemo.el.in
;; x migemo-0.40/genchars.sh
;; x migemo-0.40/ngram.sh
;; x migemo-0.40/frequent-chars
;; x migemo-0.40/migemo-dict
;; x migemo-0.40/migemo-dict.idx
;; x migemo-0.40/migemo-dict.cache
;; x migemo-0.40/migemo-dict.cache.idx
;; x migemo-0.40/user-dict.sample
;; x migemo-0.40/regex-dict.sample
;; x migemo-0.40/migemo.ja.rd
;; x migemo-0.40/tests/
;; x migemo-0.40/tests/Makefile.in
;; x migemo-0.40/tests/Makefile.am
;; x migemo-0.40/tests/test-dict
;; x migemo-0.40/tests/sample.rb
;; x migemo-0.40/tests/ruby-syntax.sh
;; x migemo-0.40/tests/migemo.sh
;; x migemo-0.40/tests/convert.sh
;; x migemo-0.40/tests/cache.sh
;; x migemo-0.40/tests/regex.sh
;; x migemo-0.40/tests/emacs-type.sh
;; x migemo-0.40/tests/insertion.sh
;; x migemo-0.40/tests/regex-dict.sh
;; x migemo-0.40/tests/user-dict.sh
;; x migemo-0.40/tests/symbols.sh
;; x migemo-0.40/tests/test.txt


;; bash-3.2$ wget http://0xcc.net/ruby-bsearch/ruby-bsearch-1.5.tar.gz
;; --2011-10-24 16:48:40--  http://0xcc.net/ruby-bsearch/ruby-bsearch-1.5.tar.gz
;; Resolving 0xcc.net... 182.48.49.14
;; Connecting to 0xcc.net|182.48.49.14|:80... connected.
;; HTTP request sent, awaiting response... 200 OK
;; Length: 14836 (14K) [application/x-tar]
;; Saving to: `ruby-bsearch-1.5.tar.gz'

;; 100%[======================================>] 14,836      56.7K/s   in 0.3s    

;; 2011-10-24 16:48:41 (56.7 KB/s) - `ruby-bsearch-1.5.tar.gz' saved [14836/14836]

;; bash-3.2$ tar xvfz ruby-bsearch-1.5.tar.gz
;; x ruby-bsearch-1.5/
;; x ruby-bsearch-1.5/ChangeLog
;; x ruby-bsearch-1.5/bsearch.rb
;; x ruby-bsearch-1.5/bsearch.en.rd
;; x ruby-bsearch-1.5/bsearch.ja.rd
;; x ruby-bsearch-1.5/tests/
;; x ruby-bsearch-1.5/tests/0-dict
;; x ruby-bsearch-1.5/tests/1-dict
;; x ruby-bsearch-1.5/tests/2-dict
;; x ruby-bsearch-1.5/tests/tmp.dict.test
;; x ruby-bsearch-1.5/tests/Makefile
;; x ruby-bsearch-1.5/tests/sample.rb
;; x ruby-bsearch-1.5/tests/test.rb
;; x ruby-bsearch-1.5/tests/test.sh
;; x ruby-bsearch-1.5/tests/tmp.dict.egrep
;; x ruby-bsearch-1.5/tests/1000-dict
;; x ruby-bsearch-1.5/bsearch.png


;; bash-3.2$ wget http://0xcc.net/ruby-romkan/ruby-romkan-0.4.tar.gz
;; --2011-10-24 16:49:45--  http://0xcc.net/ruby-romkan/ruby-romkan-0.4.tar.gz
;; Resolving 0xcc.net... 182.48.49.14
;; Connecting to 0xcc.net|182.48.49.14|:80... connected.
;; HTTP request sent, awaiting response... 200 OK
;; Length: 4653 (4.5K) [application/x-tar]
;; Saving to: `ruby-romkan-0.4.tar.gz'

;; 100%[======================================>] 4,653       28.9K/s   in 0.2s    

;; 2011-10-24 16:49:45 (28.9 KB/s) - `ruby-romkan-0.4.tar.gz' saved [4653/4653]

;; bash-3.2$ tar xvfz ruby-romkan-0.4.tar.gz
;; x ruby-romkan-0.4/
;; x ruby-romkan-0.4/romkan.rb
;; x ruby-romkan-0.4/test.rb
;; x ruby-romkan-0.4/test.sh
;; x ruby-romkan-0.4/ChangeLog
;; x ruby-romkan-0.4/romkan.en.rd
;; x ruby-romkan-0.4/romkan.ja.rd


;; bash-3.2$ cp ruby-bsearch-1.5/bsearch.rb migemo-0.40
;; bash-3.2$ cp ruby-bsearch-1.5/bsearch.rb /Library/Ruby/Site/
;; bash-3.2$ cp ruby-romkan-0.4/romkan.rb /Library/Ruby/Site/
;; bash-3.2$ cp ruby-romkan-0.4/romkan.rb migemo-0.40
;; bash-3.2$ cd migemo-0.40


;; bash-3.2$ ./configure --with-emacs=/Applications/Emacs.app/Contents/MacOS/Emacs --with-lispdir=/Applications/Emacs.app/Contents/Resources/site-lisp
;; loading cache ./config.cache
;; checking for a BSD compatible install... (cached) /usr/bin/install -c
;; checking whether build environment is sane... yes
;; checking whether make sets ${MAKE}... (cached) yes
;; checking for working aclocal... found
;; checking for working autoconf... found
;; checking for working automake... found
;; checking for working autoheader... found
;; checking for working makeinfo... found
;; checking for ruby... (cached) /usr/bin/ruby
;; checking where emacs files are in... $(datadir)/emacs
;; checking where .elc files should go... /Applications/Emacs.app/Contents/Resources/site-lisp
;; checking where emacs files are in... 
;; checking where .rb files should go... /Library/Ruby/Site
;; -n checking Ruby/Bsearch... 
;; found
;; -n checking Ruby/Romkan... 
;; found
;; creating ./config.status
;; creating Makefile
;; creating tests/Makefile
;; creating migemo.rb


;; bash-3.2$ make
;; Making all in tests
;; make[1]: Nothing to be done for `all'.
;; WARNING: Warnings can be ignored. :-)
;; if test /Applications/Emacs.app/Contents/MacOS/Emacs != no; then \
;; 	  EMACS=/Applications/Emacs.app/Contents/MacOS/Emacs /bin/sh ./elisp-comp migemo.el; \
;; 	fi
;; Loading subst-ksc...
;; Loading subst-gb2312...
;; Loading subst-big5...
;; Loading subst-jis...
;; PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11R6/bin
;; PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11R6/bin
;; Loading /Applications/Emacs.app/Contents/Resources/site-lisp/site-start.d/auctex-fix.el (source)...
;; Loading /Applications/Emacs.app/Contents/Resources/site-lisp/site-start.d/auctex.el (source)...
;; Loading /Applications/Emacs.app/Contents/Resources/site-lisp/site-start.d/builtin-aspell.el (source)...
;; Loading /Applications/Emacs.app/Contents/Resources/site-lisp/site-start.d/extra-autoloads.el (source)...
;; Loading haskell-site-file...
;; Loading /Applications/Emacs.app/Contents/Resources/site-lisp/site-start.d/japanese-init.el (source)...
;; Loading /Applications/Emacs.app/Contents/Resources/site-lisp/site-start.d/preview-latex.el (source)...
;; Carbon Emacs Package (Winter, 2010)

;; In toplevel form:
;; migemo.el:73:25:Warning: reference to free variable `*euc-japan*unix'

;; In migemo-init:
;; migemo.el:157:10:Warning: `process-kill-without-query' is an obsolete function
;;     (as of Emacs 22.1); use `process-query-on-exit-flag' or
;;     `set-process-query-on-exit-flag'.

;; In end of data:
;; migemo.el:681:1:Warning: the following functions are not known to be defined:
;;     set-process-input-coding-system, set-process-output-coding-system
;; Wrote /Users/inouetakuya/.emacs.d/migemo-0.40/elc.1216/migemo.elc


;; bash-3.2$ sudo make install
;; Password:
;; Making install in tests
;; make[2]: Nothing to be done for `install-exec-am'.
;; make[2]: Nothing to be done for `install-data-am'.
;; /bin/sh ./mkinstalldirs /usr/local/bin
;;  /usr/bin/install -c  migemo /usr/local/bin/migemo
;;  /usr/bin/install -c  migemo-grep /usr/local/bin/migemo-grep
;;  /usr/bin/install -c  migemo-server /usr/local/bin/migemo-server
;;  /usr/bin/install -c  migemo-client /usr/local/bin/migemo-client
;;  /usr/bin/install -c -m 644 migemo.el /Applications/Emacs.app/Contents/Resources/site-lisp/migemo.el
;;  /usr/bin/install -c -m 644 migemo.elc /Applications/Emacs.app/Contents/Resources/site-lisp/migemo.elc
;; /bin/sh ./mkinstalldirs /usr/local/share/migemo
;; mkdir /usr/local/share/migemo
;;  /usr/bin/install -c -m 644 ./migemo-dict /usr/local/share/migemo/migemo-dict
;;  /usr/bin/install -c -m 644 ./migemo-dict.idx /usr/local/share/migemo/migemo-dict.idx
;;  /usr/bin/install -c -m 644 ./migemo-dict.cache /usr/local/share/migemo/migemo-dict.cache
;;  /usr/bin/install -c -m 644 ./migemo-dict.cache.idx /usr/local/share/migemo/migemo-dict.cache.idx
;;  /usr/bin/install -c -m 644 ./user-dict.sample /usr/local/share/migemo/user-dict.sample
;;  /usr/bin/install -c -m 644 ./regex-dict.sample /usr/local/share/migemo/regex-dict.sample
;;  /usr/bin/install -c -m 644 ./migemo.ja.rd /usr/local/share/migemo/migemo.ja.rd
;; /bin/sh ./mkinstalldirs /Library/Ruby/Site
;;  /usr/bin/install -c -m 644 ./migemo.rb /Library/Ruby/Site/migemo.rb
;;  /usr/bin/install -c -m 644 ./migemo-dict.rb /Library/Ruby/Site/migemo-dict.rb
;;  /usr/bin/install -c -m 644 ./migemo-regex.rb /Library/Ruby/Site/migemo-regex.rb
;;  /usr/bin/install -c -m 644 ./migemo-convert.rb /Library/Ruby/Site/migemo-convert.rb
;;  /usr/bin/install -c -m 644 ./migemo-index.rb /Library/Ruby/Site/migemo-index.rb
;;  /usr/bin/install -c -m 644 ./migemo-cache.rb /Library/Ruby/Site/migemo-cache.rb

;; bash-3.2$ 

;; ------------------------------------------------------------
;; configure のところで、
;; --with-lispdir=/Applications/Emacs.app/Contents/Resources/site-lisp
;; としたが、

;; lisp は ~/.emacs.d/elisp で一元管理したいので、
;; /Applications/Emacs.app/Contents/Resources/site-lisp 内の
;; megemo.el と migemo.elc を ~/.emacs.d/elisp 内に移動させた


