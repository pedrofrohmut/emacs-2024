;; Fill Column ##################################################################

(unless (package-installed-p 'visual-fill-column)
  (package-install 'visual-fill-column))

(setq-default visual-fill-column-center-text t)

(add-hook 'after-init-hook 'global-visual-fill-column-mode)

(keymap-set evil-normal-state-map "SPC z z" 'global-visual-fill-column-mode)

;; Restart Emacs ################################################################

(unless (package-installed-p 'restart-emacs)
  (package-install 'restart-emacs))
