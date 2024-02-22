;; Fill Column #################################################################

(unless (package-installed-p 'visual-fill-column)
  (package-install 'visual-fill-column))

(setq-default visual-fill-column-center-text t)

(add-hook 'after-init-hook 'global-visual-fill-column-mode)

(with-eval-after-load 'evil
  (keymap-set evil-normal-state-map "SPC z z" 'global-visual-fill-column-mode))

;; Editor config ###############################################################

(unless (package-installed-p 'editorconfig)
  (package-install 'editorconfig))

(editorconfig-mode)

;; Undo Tree ###################################################################

;(unless (package-installed-p 'undo-tree)
;  (package-install 'undo-tree))
;
;(global-undo-tree-mode)
