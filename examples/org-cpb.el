;;; org-cpb.el --- Example for commonplace book configuration -*- lexical-binding: t -*-

;;;; Basic

(require 'org-starter)

(org-starter-def "cpb.org"
  :key "c")

;;;; Refile

(defun org-cpb-refile (arg)
  (interactive "P")
  (org-reverse-datetree-refile-to-file
   (org-starter-locate-file "cpb.org" nil t) nil
   :ask-always arg :prefer '("CREATED_TIME" "CREATED_AT" "CLOSED")))

(add-to-list 'org-starter-extra-refile-map
             '("c" org-cpb-refile "cpb"))

;;;; Capture

(org-starter-def-capture "c" "cpb.org: Plain entry"
  entry (file+function "cpb.org" org-reverse-datetree-goto-date-in-file)
  "* %^{Heading}
:PROPERTIES:
:CREATED_TIME: %U
:END:

%(unless (string-empty-p \"%i\") \"%i\n\n\")%?"
  :clock-in t :clock-resume t :empty-lines 1)

(provide 'org-cpb)
;;; org-cpb.el ends here
