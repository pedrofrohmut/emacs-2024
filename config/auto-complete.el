;; Auto-Complete ####################################################################################

;; Corfu #######################################################################

;; Manual completion example (Does not show automatically)

(unless (package-installed-p 'corfu)
  (package-install 'corfu))

(require 'corfu)

(keymap-set evil-insert-state-map "C-j" 'completion-at-point)

(evil-define-key 'insert corfu-map (kbd "C-j") 'corfu-insert)
(evil-define-key 'insert corfu-map (kbd "C-k") 'corfu-quit)
(evil-define-key 'insert corfu-map (kbd "SPC") 'corfu-insert-separator)

(global-corfu-mode)

;; Dabbrev ########################################################################

(keymap-set evil-insert-state-map "C-p" 'dabbrev-completion)
(keymap-set evil-insert-state-map "C-n" 'dabbrev-completion)

;; Cape ########################################################################

(unless (package-installed-p 'cape)
  (package-install 'cape))

(add-to-list 'completion-at-point-functions #'cape-dabbrev)
(add-to-list 'completion-at-point-functions #'cape-file)

(require 'cape)

(keymap-set evil-insert-state-map "C-f" 'cape-file)

;; Cape control completion table refreshes
(advice-add 'eglot-completion-at-point :around #'cape-wrap-buster)

;; Making a Cape Super Capf for Eglot
;; add eglot-completion-at-point to default completion at point function
(defun my/eglot-capf ()
  (setq-local completion-at-point-functions
	      (list (cape-capf-super
		     #'eglot-completion-at-point
		     #'cape-dabbrev
		     #'cape-file))))

(add-hook 'eglot-managed-mode-hook #'my/eglot-capf)

;; Prescient.el #################################################################

(unless (package-installed-p 'prescient)
  (package-install 'prescient))

(unless (package-installed-p 'corfu-prescient)
  (package-install 'corfu-prescient))

(corfu-prescient-mode 1)
