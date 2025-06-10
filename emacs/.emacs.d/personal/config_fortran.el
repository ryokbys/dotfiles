;;; config_fortran.el -- a supplement file for fortran.el.

(require 'fortran)

;; mode-map
(define-key fortran-mode-map "\M-\r" 'fortran-split-line)


;;-----------------------------------------------------------------
;; コメント用の関数
;;-----------------------------------------------------------------
(defun fortran-comment-line72-1 ()
  "Inserts a comment line which starts with !."
  (interactive)
  (insert "c-----------------------------------------------------------------------"))

(defun fortran-comment-line72-2 ()
  "Inserts a comment line which starts with !."
  (interactive)
  (insert "c======================================================================="))

(defun fortran-comment-line72-3 ()
  "Inserts a comment line which starts with !."
  (interactive)
  (insert "c - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "))

(define-key fortran-mode-map "\C-c-" 'fortran-comment-line72-1)
(define-key fortran-mode-map "\C-c=" 'fortran-comment-line72-2)
(define-key fortran-mode-map "\C-c." 'fortran-comment-line72-3)


;;=================================================================
(provide 'config_fortran)
