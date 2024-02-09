;; Auto-Complete ####################################################################################

(unless (package-installed-p 'company)
  (package-install 'company))

(require 'company)

(add-hook 'after-init-hook 'global-company-mode)

(keymap-set evil-insert-state-map "C-f" 'company-files)

;; Possible improvements #################

;; (setq company-minimum-prefix-length 0)            ; WARNING, probably you will get perfomance issue if min len is 0!
;(setq company-tooltip-limit 20)                      ; bigger popup window
;(setq company-tooltip-align-annotations 't)          ; align annotations to the right tooltip border
;(setq company-idle-delay .3)                         ; decrease delay before autocompletion popup shows
;(setq company-begin-commands '(self-insert-command)) ; start autocompletion only after typing
;(global-set-key (kbd "C-c /") 'company-files)        ; Force complete file names on "C-c /" key
