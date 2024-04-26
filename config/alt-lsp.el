;; LSP ##########################################################################

(unless (package-installed-p 'lsp-mode)
  (package-install 'lsp-mode))

(add-hook 'lsp-mode-hook
  (lambda ()
    (keymap-set evil-normal-state-map "SPC r n" 'lsp-rename)
    (keymap-set evil-normal-state-map "SPC c a" 'lsp-execute-code-action)
    (keymap-set evil-normal-state-map "g r" 'lsp-find-references)
    (keymap-set evil-normal-state-map "K" 'lsp-ui-doc-show)
    (keymap-set evil-normal-state-map "M-7" 'lsp-ui-imenu)))

(require 'lsp-mode)

;; Hover Color
(set-face-attribute 'lsp-face-highlight-read nil
  :background "#552"
  :foreground "#fff"
  :underline nil
  :inherit nil)

;; LSP UI #######################################################################

(unless (package-installed-p 'lsp-ui)
  (package-install 'lsp-ui))

(add-hook 'lsp-mode-hook 'lsp-ui-mode)

;; Disable noise UI
(setq lsp-lens-enable nil)
(setq lsp-enable-symbol-highlighting nil)
(setq lsp-headerline-breadcrumb-enable nil)

;; Config Lsp UI
(setq lsp-ui-doc-position 'at-point)
(setq lsp-ui-imenu-window-width 33)

;; Eldoc ########################################################################

;; (require 'eldoc)
;;
;; ;; Prefer show in the doc buffer over echo area
;; (setq eldoc-echo-area-prefer-doc-buffer t)
;;
;; ;; Always make it one line
;; (setq eldoc-echo-area-use-multiline-p nil)

;; Flymake ######################################################################

(add-hook 'lsp-mode-hook 'flymake-mode)

(keymap-set evil-normal-state-map "[ d" 'flymake-goto-prev-error)
(keymap-set evil-normal-state-map "] d" 'flymake-goto-next-error)
