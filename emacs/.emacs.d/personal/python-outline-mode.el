(defun python-mode-outline-hook ()
  (setq outline-level 'python-outline-level)

  (setq outline-regexp
	(rx (or
	     ;; Commented outline heading
	     (group
	      (* space)	 ; 0 or more spaces
	      (one-or-more (syntax comment-start))
	      (one-or-more space)
	      ;; Heading level
	      (group (repeat 1 8 "\*"))  ; Outline stars
	      (one-or-more space))

	     ;; Python keyword heading
	     (group
	      ;; Heading level
	      (group (* space))	; 0 or more spaces
	      bow
	      ;; Keywords
	      ;;(or "class" "def" "else" "elif" "except" "for" "if" "try" "while")
        (or "class" "def")
	      eow)))))

(defun python-outline-level ()
  (or
   ;; Commented outline heading
   (and (string-match (rx
		       (* space)
		       (one-or-more (syntax comment-start))
		       (one-or-more space)
		       (group (one-or-more "\*"))
		       (one-or-more space))
		      (match-string 0))
	(- (match-end 0) (match-beginning 0)))

   ;; Python keyword heading, set by number of indentions
   ;; Add 8 (the highest standard outline level) to every Python keyword heading
   (+ 8 (- (match-end 0) (match-beginning 0)))))

(add-hook 'python-mode-hook 'python-mode-outline-hook)
