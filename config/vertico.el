;; Vertico ##########################################################################################

(unless (package-installed-p 'vertico)
  (package-install 'vertico))

(vertico-mode)

(keymap-set vertico-map "C-f" 'vertico-exit)

;; Defaults if vertico is not working
(keymap-set vertico-map "M-TAB" #'minibuffer-complete)
(keymap-set vertico-map "M-RET" #'minibuffer-force-complete-and-exit)

(add-hook 'minibuffer-setup-hook
          (lambda ()
            (make-local-variable 'face-remapping-alist)
            (add-to-list 'face-remapping-alist '(default (:foreground "green")))))

;; Marginalia #######################################################################################

(unless (package-installed-p 'marginalia)
  (package-install 'marginalia))

(with-eval-after-load 'vertico
  (marginalia-mode))

;; Orderless ########################################################################################

(unless (package-installed-p 'orderless)
  (package-install 'orderless))

(with-eval-after-load 'vertico
  (require 'orderless)
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
	completion-category-overrides '((file (styles basic partial-completion)))))

;; Consult ##########################################################################################

(unless (package-installed-p 'consult)
  (package-install 'consult))

(keymap-set evil-normal-state-map "C-f" 'consult-line)
(keymap-set evil-normal-state-map "M-f" 'consult-line-multi)

(keymap-set evil-normal-state-map "SPC f g" 'consult-ripgrep)
(keymap-set evil-normal-state-map "SPC f f" 'consult-fd)
(keymap-set evil-normal-state-map "SPC f m" 'consult-minor-mode-menu)
