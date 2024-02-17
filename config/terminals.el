;; Terminals ########################################################################################

(unless (package-installed-p 'vterm)
  (package-install 'vterm))

(setq vterm-shell "/usr/bin/bash")
(setq vterm-kill-buffer-on-exit t)

(defun open-vterm-at-project-root ()
  "Open a vterm at the project root directory."
  (interactive)
  (let ((project-root (project-root (project-current))))
    (if project-root
        (progn
          (setq default-directory project-root)
          (vterm))
      (message "No project found."))))

(keymap-set evil-normal-state-map "SPC x x" #'open-vterm-at-project-root)

;; Multi Vterm ######################################################################################

(unless (package-installed-p 'multi-vterm)
  (package-install 'multi-vterm))

;; New instance
(keymap-set evil-normal-state-map "SPC x c" 'multi-vterm)

;; Navigate between instances
(keymap-set evil-normal-state-map "SPC x n" 'multi-vterm-next)
(keymap-set evil-normal-state-map "SPC x p" 'multi-vterm-prev)

(defun open-dedicated-at-project-root ()
  "Open a dedicated vterm at the project root directory."
  (interactive)
  (let ((project-root (project-root (project-current))))
    (if project-root
        (progn
          (setq default-directory project-root)
          (multi-vterm-dedicated-toggle))
      (message "No project found."))))

;; Toggle split window dedicated term
(keymap-set evil-normal-state-map "SPC x t" #'open-dedicated-at-project-root)
