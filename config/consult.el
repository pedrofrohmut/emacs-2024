;; Consult ##########################################################################################

(unless (package-installed-p 'consult)
  (package-install 'consult))

(defun my/consult-fd-only-files ()
  "Uses `consult-fd` with custom args set to type 'file only' on
   current project-root or in the default-directory if root not found"
  (interactive)
  (let* ((current-root (project-root (project-current)))
	 (default-directory (if current-root current-root default-directory))
	 (consult-fd-args '((if (executable-find "fdfind" 'remote) "fdfind" "fd")
			    "--full-path --color=never --type file")))
    (call-interactively #'consult-fd)))

(keymap-set evil-normal-state-map "C-q" #'my/consult-fd-only-files)

(keymap-set evil-normal-state-map "C-f" 'consult-line)
(keymap-set evil-normal-state-map "M-f" 'consult-line-multi)

;; Paste from register (from mini buffer)
(keymap-set evil-normal-state-map "M-p" 'consult-yank-from-kill-ring)
(keymap-set evil-insert-state-map "M-p" 'consult-yank-from-kill-ring)

(keymap-set evil-normal-state-map "SPC f g" 'consult-ripgrep)
(keymap-set evil-normal-state-map "SPC f f" 'consult-fd)
(keymap-set evil-normal-state-map "SPC f b" 'consult-project-buffer)
(keymap-set evil-normal-state-map "SPC f m m" 'consult-minor-mode-menu)

;(keymap-set evil-normal-state-map "SPC f r" 'consult-recent-file)

;; Consult Dir #################################################################

;;(unless (package-installed-p 'consult-dir)
;;  (package-install 'consult-dir))
;;
;;;; Cancel bookmark behaviour
;;(setq consult-dir-project-list-function nil)
;;
;;(keymap-set evil-normal-state-map "SPC f d" 'consult-dir)
;;
;;(keymap-set vertico-map "C-d" 'consult-dir)
;;(keymap-set vertico-map "M-d" 'consult-dir-jump)
