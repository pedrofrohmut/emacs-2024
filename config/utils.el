;; Fill Column ##################################################################

(unless (package-installed-p 'visual-fill-column)
  (package-install 'visual-fill-column))

(setq-default visual-fill-column-center-text t)

(add-hook 'after-init-hook 'global-visual-fill-column-mode)

(with-eval-after-load 'evil
  (keymap-set evil-normal-state-map "SPC z z" 'global-visual-fill-column-mode))

;; Editor config ################################################################

(unless (package-installed-p 'editorconfig)
  (package-install 'editorconfig))

(editorconfig-mode)

;; Electric Pairs ###############################################################

;; TODO: check if this function of chat gpt works
;; My text:i want to type " in front of a work and insert a single " but electric pairs always
;; inserts "". When i'm editing, i always have to keep deleting the extra ".

;;(defun my-electric-pair-inhibit-double-quote-predicate (char)
;;  "Inhibit insertion of closing character if the previous character is a word character."
;;  (if (eq char ?\")                   ; Check if the character is a double quote
;;      (and (not (looking-back "\\w" 1)) ; Check if the previous character is not a word character
;;           (not (looking-at-p "\\s\""))))) ; Check if the next character is not a quote
;;
;;(add-hook 'emacs-lisp-mode-hook
;;          (lambda ()
;;            (setq-local electric-pair-inhibit-predicate #'my-electric-pair-inhibit-double-quote-predicate)))
;;
;;(add-hook 'text-mode-hook
;;          (lambda ()
;;            (setq-local electric-pair-inhibit-predicate #'my-electric-pair-inhibit-double-quote-predicate)))
