;;=== fortran mode
(column-number-mode t)  ; not only fortran?
(add-hook 'fortran-mode-hook
     '(lambda ()
        (require 'config_fortran)
        (setq abbrev-mode t)
        (fortran-auto-fill-mode 1)         ; wrap lines in 72 columns
        (setq fortran-do-indent 2)              ;
        (setq fortran-if-indent 2)              ;
        (setq fortran-structure-indent 2)       ;
        (setq fortran-continuation-string "&")  ;
        (setq fortran-comment-line-start "c")  ;
        (setq fortran-comment-region "c")  ; comment character
        ;;(setq fortran-comment-indent-style nil) ; define comment line indentation
        (setq fortran-comment-indent-char ".") ; define comment indent character
        ))
;;=== outline-minor-mode add hooks (FORTRAN)
(add-hook
 'fortran-mode-hook
 '(lambda ()
    (progn
      (make-variable-buffer-local 'outline-regexp)
      ;;(setq outline-regexp "\\([ \t0-9]+program\\|[ \t0-9]+subroutine\\|[ \t0-9]+function\\|[ \t0-9]+module\\)")
      (setq outline-regexp "[ \t0-9]*\\(program\\|subroutine\\|function\\|module\\)")
      (make-variable-buffer-local 'outline-level)
      (setq outline-level 'outline-level)
      (outline-minor-mode t))))

;;=== f90-mode =========================================================
(add-hook 'f90-mode-hook
          '(lambda ()
             (require 'config_f90)
             (setq f90-do-indent 2)
             (setq f90-if-indent 2)
             (setq f90-type-indent 2)
             (setq f90-comment-region "!!$")
             (setq f90-indented-comment-re "!!!")
             (setq comment-column 0)
             (setq f90-beginning-ampersand nil)
             (setq abbrev-mode t)
             (setq f90-auto-fill-mode t)
             (setq fill-column 72)
             ;;(setq fortran-comment-indent-style nil) ; define comment line indentation
             ))
;; outline-minor-mode (f90)
(add-hook
 'f90-mode-hook
 '(lambda ()
    (setq outline-regexp "[ \t]*\\(program\\|subroutine\\|module\\|function\\)")
    ;; make new outline-level setting
    (make-variable-buffer-local 'outline-level)
    ;;(setq-default outline-level 'outline-level)
    (defun f90-outline-level ()
      (save-excursion
   (looking-at outline-regexp)
   (let
       ((ca (char-to-string (char-before (match-end 0)))))
     (cond
      ((equal ca "m") 1) ; program to top
      ((equal ca "e") 1) ; subroutine to top
      (t (- (match-end 0) (match-beginning 0)))))))
    (setq outline-level 'f90-outline-level)
    (outline-minor-mode t))
 )

;;=== compilation ======================================================
(setq compilation-ask-about-save nil)
(setq compilation-scroll-output t)
