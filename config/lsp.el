;; LSP ##########################################################################

(unless (package-installed-p 'eglot)
  (package-install 'eglot))

(require 'eglot)

;; To keep eldoc from displaying documentation at point
(add-to-list 'eglot-ignored-server-capabilites :hoverProvider)
(add-to-list 'eglot-ignored-server-capabilites :inlayHintProvider)
(add-to-list 'eglot-ignored-server-capabilites :documentFormatting)

;; Servers ######################################################################

(add-to-list 'eglot-server-programs
	    '(js-ts-mode . ("typescript-language-server" "--stdio")))

(add-to-list 'eglot-server-programs
	    `(csharp-mode . ("omnisharp" "-lsp")))

(add-hook 'eglot-managed-mode-hook
	  (lambda()
	    (keymap-set evil-normal-state-map "SPC r n" 'eglot-rename)
	    (keymap-set evil-normal-state-map "SPC c a" 'eglot-code-actions)
	    (keymap-set evil-normal-state-map "K" 'eldoc-box-help-at-point)
	    ))

;; Eldoc ########################################################################

(require 'eldoc)

;; Prefer show in the doc buffer over echo area
(setq eldoc-echo-area-prefer-doc-buffer t)

;; Always make it one line
(setq eldoc-echo-area-use-multiline-p nil)

;; Eldoc Box ####################################################################

(unless (package-installed-p 'eldoc-box)
  (package-install 'eldoc-box))

(require 'eldoc-box)

;(keymap-set eglot-mode-map "M-k" 'eldoc-box-help-at-point)
;(keymap-set eglot-mode-map "M-k" 'eldoc-box-help-at-point)
;(keymap-set evil-normal-state-map "M-k" 'eldoc-box-help-at-point)

;; (evil-define-key 'normal 'eldoc-box-mode-map (kbd "K") 'eldoc-box-help-at-point)
;; (with-eval-after-load 'eldoc-box
;;   (define-key global-map (kbd "K") 'eldoc-box-help-at-point))

;; (add-hook 'eglot-managed-mode-hook #'eldoc-box-hover-mode t)

;; (keymap-unset evil-collection-eldoc-doc-buffer-mode-map)
;; (keymap-set evil-normal-state-map "K" 'eldoc-box-help-at-point)

;; Flycheck #####################################################################

(unless (package-installed-p 'flycheck)
  (package-install 'flycheck))

(unless (package-installed-p 'flycheck-eglot)
  (package-install 'flycheck-eglot))

;; (add-hook 'eglot-managed-mode-hook 'global-flycheck-mode)
;; (add-hook 'eglot-managed-mode-hook 'global-flycheck-eglot-mode)
;;(add-hook 'eglot-managed-mode-hook '(global-flycheck-eglot-mode . t))

;; (keymap-set evil-normal-state-map "[ d" 'flycheck-previous-error)
;; (keymap-set evil-normal-state-map "] d" 'flycheck-next-error)

;; Flymake ######################################################################

(add-hook 'eglot-managed-mode-hook 'flymake-mode)

;(keymap-set evil-normal-state-map "SPC c p" 'flymake-goto-prev-error)
;(keymap-set evil-normal-state-map "SPC c n" 'flymake-goto-next-error)
(keymap-set evil-normal-state-map "[ d" 'flymake-goto-prev-error)
(keymap-set evil-normal-state-map "] d" 'flymake-goto-next-error)
