;; Minibuffer #######################################################################################

;; Keybinds #########################################################################################

(define-key minibuffer-mode-map (kbd "C-w") 'backward-kill-word)
(define-key minibuffer-mode-map (kbd "C-u") 'backward-kill-sentence)

;; Vertico ##########################################################################################

(unless (package-installed-p 'vertico)
  (package-install 'vertico))

(vertico-mode)

(require 'vertico)

(keymap-set vertico-map "C-f" 'vertico-exit)
;; (keymap-set vertico-map "C-i" 'vertico-insert)

;; Defaults if vertico is not working
(keymap-set vertico-map "M-TAB" #'minibuffer-complete)
(keymap-set vertico-map "M-RET" #'minibuffer-force-complete-and-exit)


;; Del and backspace in vertico
(keymap-set vertico-map "C-h" #'delete-backward-char)
(keymap-set vertico-map "C-l" #'delete-char)

;; Easy move in vertico
(keymap-set vertico-map "M-h" #'backward-char)
(keymap-set vertico-map "M-l" #'forward-char)

;; Colors
(set-face-attribute 'vertico-current nil :foreground "#fff" :background "#552")

;; Marginalia #######################################################################################

(unless (package-installed-p 'marginalia)
  (package-install 'marginalia))

(with-eval-after-load 'vertico
  (marginalia-mode))

(setq marginalia-align 'left)

;; Orderless ########################################################################################

(unless (package-installed-p 'orderless)
  (package-install 'orderless))

(with-eval-after-load 'vertico
  (require 'orderless)
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
        completion-category-overrides '((file (styles basic partial-completion)))))
