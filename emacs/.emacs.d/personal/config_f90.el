;;; config_f90.el -- a supplement file for f90.el.
;;; $Id: EmacsConf,v 1.4 2006/11/13 14:51:36 takagi Exp $

(require 'f90)

;;-----------------------------------------------------------------
;; 「;」で始まる abbreviation を追加
;;-----------------------------------------------------------------
(modify-syntax-entry ?\; "w" f90-mode-syntax-table)

(define-key f90-mode-map ";" 'f90-abbrev-start)
(define-key f90-mode-map "\M-\r" 'f90-break-line)

(let (abbrevs-changed)
  (mapcar
   (function (lambda (element)
	       (condition-case nil
		   (apply 'define-abbrev f90-mode-abbrev-table
			  (append element '(nil 0 t)))
		 (wrong-number-of-arguments
		  (apply 'define-abbrev f90-mode-abbrev-table
			 (append element '(nil 0)))))))
   '((";al"  "allocate"     )
     (";ab"  "allocatable"  )
     (";as"  "assignment"   )
     (";ba"  "backspace"    )
     (";bd"  "block data"   )
     (";c"   "character"    )
     (";cl"  "close"        )
     (";cm"  "common"       )
     (";co"  "continue"     )
     (";cx"  "complex"      )
     (";cn"  "contains"     )
     (";cy"  "cycle"        )
     (";de"  "deallocate"   )
     (";df"  "define"       )
     (";di"  "dimension"    )
     (";dw"  "do while"     )
     (";el"  "else"         )
     (";eli" "else if"      )
     (";elw" "elsewhere"    )
     (";eq"  "equivalence"  )
     (";ex"  "external"     )
     (";ey"  "entry"        )
     (";fl"  "forall"       )
     (";fo"  "format"       )
     (";fu"  "function"     )
     (";fa"  ".false."      )
     (";im"  "implicit none")
     ;; (";in"  "include"      )
     (";ia"  "integer,allocatable::")
     (";in"  "integer::"      )
     (";ii"  "integer,intent(in)::")
     (";ip"  "integer,parameter::")
     (";it"  "intent"       )
     (";if"  "interface"    )
     (";lo"  "logical"      )
     (";mo"  "module"       )
     (";na"  "namelist"     )
     (";nu"  "nullify"      )
     (";op"  "optional"     )
     (";pa"  "parameter"    )
     (";po"  "pointer"      )
     (";pr"  "print"        )
     (";pi"  "private"      )
     (";pm"  "program"      )
     (";pu"  "public"       )
     (";re"  "real(8)::"       )
     (";ra"  "real(8),allocatable::")
     (";ri"  "real(8),intent(in)::")
     (";rp"  "real(8),parameter::")
     (";rc"  "recursive"    )
     (";rt"  "return"       )
     (";rw"  "rewind"       )
     (";se"  "select"       )
     (";sq"  "sequence"     )
     (";su"  "subroutine"   )
     (";ta"  "target"       )
     (";tr"  ".true."       )
     (";t"   "type"         )
     (";wh"  "where"        )
     (";wr"  "write"        )
     (";w"   "write(6,'()')")
     ;; append new abbreviations
     (";dc"  "complex(8)"   )
     (";dp"  "real(8)"      )
     (";i8"  "integer(8)"   )
     (";uf"  "\"unformatted\""  )
     )))


;;-----------------------------------------------------------------
;; コメント用の関数
;;-----------------------------------------------------------------
(defun f90-comment-line72-1 ()
  "Inserts a comment line which starts with !."
  (interactive)
  (insert "!-----------------------------------------------------------------------"))

(defun f90-comment-line72-2 ()
  "Inserts a comment line which starts with !."
  (interactive)
  (insert "!======================================================================="))

(defun f90-comment-line72-3 ()
  "Inserts a comment line which starts with !."
  (interactive)
  (insert "! - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "))

(defun f90-my-comment-line ()
  "Inserts a comment line which starts with !."
  (interactive)
  (insert "!....."))

(define-key f90-mode-map "\C-c-" 'f90-comment-line72-1)
(define-key f90-mode-map "\C-c=" 'f90-comment-line72-2)
(define-key f90-mode-map "\C-c." 'f90-comment-line72-3)
(define-key f90-mode-map "\M-;" 'f90-my-comment-line)


;;=================================================================
(provide 'config_f90)
