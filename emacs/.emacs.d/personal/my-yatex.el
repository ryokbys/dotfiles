;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; My YaTeX setting
;;                    Last-modified: <2024-02-05 09:08:53 KOBAYASHI Ryo>
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;(prelude-require-package 'yatex)

(use-package yatex
  :ensure t
  :defer t
  :mode (("\\.tex$" . yatex-mode)
         ("\\.sty$" . yatex-mode)
         ("\\.ltx$" . yatex-mode))
  ;;...I dont know why but this :bind does not work...
  ;; :bind (("C-c c" . 'YaTeX-typeset-menu)
  ;;        ("C-c s" . 'YaTeX-make-section)
  ;;        ("C-c S" . 'YaTeX-make-section-region))
  :config
  (setq ;;tex-command "LC_ALL='en_US.UTF-8' lualatex -synctex=1 -interaction=nonstopmode"
        ;;tex-command "pdflatex -interaction=nonstopmode"
        tex-command "~/bin/tex-compile"
        dvi2-command "~/bin/tex-preview.sh"; or "~/bin/dvi2pdf"
        dviprint-command-format "/Library/Tex/texbin/dvips %s | lpr"
        YaTeX-kanji-code 4; (1 SJIS, 2 JIS, 3 EUC, 4 UTF-8)
        YaTeX-use-AMS-LaTeX t; AMS-LaTeX
        section-name "documentclass"
        makeindex-command "/Library/Tex/texbin/mendex"
        ;;YaTeX-latex-message-code 'sjis-mac
        ;;YaTeX-latex-message-code 'euc-jp-mac
        ;;YaTeX-latex-message-code 'iso-2022-jp-mac
        YaTeX-latex-message-code 'utf-8-mac
        bibtex-command "upbibtex"
        )
  ;;..... to avoid error about last-command-char
  (define-obsolete-variable-alias 'last-command-char 'last-command-event "at least 19.34")
  ;; returning
  (add-hook 'yatex-mode-hook '(lambda ()
                                (setq auto-fill-function nil)
                                (electric-indent-local-mode -1)))
  ;; RefTeX mode
  (add-hook 'yatex-mode-hook '(lambda () (reftex-mode t)))
  (setq YaTeX-latex-message-code 'utf-8 ; message as UTF-8 code.
        YaTeX-no-begend-shortcut t      ; use complement not shortcut in begin-end
        )
  ;; bibtexファイルを参照するたびに更新する？うまく働いていない？
  (add-hook 'bibtex-mode-hook '(lambda () (auto-revert-mode t)))
  (setenv "TEXINPUTS"
          (concat "./:$HOME/templates:" (getenv "TEXINPUTS")))
  ;; font-lock
  (add-hook
   'yatex-mode-hook
   '(lambda ()
      (set-face-foreground YaTeX-font-lock-formula-face "ForestGreen") ;; 数式の色
      ))
  ;; key bindings
  (add-hook 'yatex-mode-hook
            (lambda ()
              (define-key YaTeX-mode-map (kbd "C-c c") 'YaTeX-typeset-menu)
              (define-key prelude-mode-map (kbd "C-c s") nil) ;; disable minor-mode-map binding
              (define-key YaTeX-mode-map (kbd "C-c s") 'YaTeX-make-section)))
  ;; outline-minor-mode
  (add-hook
   'yatex-mode-hook
   (function
    (lambda ()
      (progn
	      (modify-syntax-entry ?% "<" (syntax-table))
	      (modify-syntax-entry 10 ">" (syntax-table))
	      (make-variable-buffer-local 'outline-level)
	      (setq outline-level 'latex-outline-level)
	      (make-variable-buffer-local 'outline-regexp)
        (setq outline-regexp
              (concat "[ \t]*\\(\\\\documentstyle\\|\\\\documentclass\\|"
				              "\\\\part\\|\\\\chapter\\|\\\\appendix\\|"
                      "\\\\section\\|\\\\subsection\\|\\\\subsubsection\\|"
                      "\\\\Paragraph\\|%%%\\)"
				              "\\*?[ \t]*[[{]"))
	      (outline-minor-mode t)
	      ))))
  (defun latex-outline-level ()
    (interactive)
    (let ((str nil))
	    (looking-at outline-regexp)
	    (setq str (buffer-substring-no-properties (match-beginning 0) (match-end 0)))
	    (cond ;; キーワード に 階層 を返す
	     ((string-match "documentclass" str) 1)
	     ((string-match "documentstyle" str) 1)
	     ((string-match "part" str) 2)
	     ((string-match "chapter" str) 3)
	     ((string-match "appendix" str) 3)
	     ((string-match "subsubsection" str) 6)
	     ((string-match "subsection" str) 5)
	     ((string-match "section" str) 4)
	     ((string-match "paragraph" str) 7)
	     ((string-match "%%%" str) 8)
	     (t (+ 6 (length str)))
	     )))
  )

(use-package reftex
  :ensure t
  :defer t
  :config
  ;; skip "SELECT A REFERECE FORMAT" when typing 'C-c )'
  (setq reftex-ref-macro-prompt nil)
  ; RefTeXで使うbibファイルの位置を指定する（原稿毎のbibファイルをローカルディレクトリに設定することはできないようだ．．．2021-06-19）
  (setq reftex-default-bibliography '("./references.bib"))
  ;;RefTeXに関する設定 (see, http://www.proton.jp/main/latex/yatex.html)
  (setq reftex-enable-partial-scans t)
  (setq reftex-save-parse-info t)
  (setq reftex-use-multiple-selection-buffers t)
  ;;RefTeXにおいて数式の引用を\eqrefにする
  (setq reftex-label-alist '((nil ?e nil "~\\eqref{%s}" nil nil)))
  ;;lookup-bufferを使用しない．遅いかもしれない．
  (setq reftex-keep-temporary-buffers nil)
  )
