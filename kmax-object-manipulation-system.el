(global-set-key "\C-ckotos" 'koms-object-handler-top-of-stack)

;; ;; write an argt like mechanism, or read how lisp does this normally

;; (koms-object-handler "top-of-stack")

(defun koms-object-handler-top-of-stack ()
 ""
 (interactive)
 (koms-object-handler "top-of-stack"))
(defun koms-object-handler (context)
 ""
 (interactive)
 (let* ((object (koms-get-object context))
	(possible-duck-types (koms-duck-type context object))
	(args (list :object object :possible-duck-types possible-duck-types))
	(available-actions-results (funcall 'koms-list-possible-actions-for-objects-of-possible-types-in-contexts args)))
	;; (chosen-actions (koms-choose-from-available-actions available-actions-results)))
  (koms-execute-chosen-actions chosen-actions)))

;; (kmax-case-equal "top-of-stack" ("top-of-stack" (freekbs2-get-top-of-stack)))

(defun koms-get-object (context)
 ""
 (interactive)
 (let* ((object
	 (kmax-case-equal context
	  ("top-of-stack" (freekbs2-get-top-of-stack))
	  )))
  object))

(list
 (koms-possible-duck-types-naive "top-of-stack" "https://www.google.com")
 (koms-possible-duck-types-naive "top-of-stack" "#$Dog")
 )

(defun koms-duck-type (context object)
 ""
 (interactive)
 (let* ((possible-types (koms-possible-duck-types-naive context object)))
  possible-types))

(defun koms-possible-duck-types-naive (context object)
 ""
 (interactive)
 (let* ((possible-types nil))
  ;; (if (url-https-file-readable-p object)  (push "live-url" possible-types))
  (if (cmh-cyclified-constant-p object)  (push "cyc-constant" possible-types))
  ;; (if (kmax-string-match-p "^\\(\\(ht\\|f\\)tps?://.*?\\)$" object)  (push "URL" possible-types))
  ;; (if (kmax-string-match-p "^\\(\\(ht\\|f\\)tps?://.*?\\)$" string)  (push "URL" possible-types))
  possible-types))

;; (defun koms-possible-duck-types-flp (context object)
;;  ""
;;  (interactive)
;;  ;; 
;;  (let* ((results (formalog-query  (list var-X) (list "possibleDuckTypes" var-X))))
;;   (nth1 1 results)))

(setq possible-actions-for-objects
 '(("URL" . 'browse-url-firefox)))

(defun koms-list-possible-actions-for-objects-of-possible-types-in-contexts (args)
 ""
 (interactive)
 (funcall (nth 1 (cdr (assoc (car possible-duck-types) possible-actions-for-objects))) object))

(defun koms-choose-from-available-actions ()
 ""
 (interactive)
 (see args)
 (kmax-not-yet-implemented))

(defun koms-execute-chosen-actions (args)
 ""
 (interactive)
 (see args)
 (kmax-not-yet-implemented))

;; Use sayer / nlu etc to store things like, for instance, if the item
;; is the name of a debian package, or a particular word from the
;; dictionary, then upon inspection, it takes takes that.  maybe it
;; asks what kind of object the thing is, if there isn't a taxonomy
;; entry that it falls into, or if you want to give it another type as
;; well, you can add the type with completing-read.  Then, it gives
;; you all the kinds of actions you can do on that object.

;; it also has the ability to record new dictionary entries.

;; look into using Cyc's English phrase glosses for this as well

;; in lieu of using the NLU based system which will augment, we can
;; either just use thing-at-point for now, or even top-of-stack

;; don't actually use sayer for things like the dictionary or the
;; debian entries, because of the overhead of it - use a wrapper
