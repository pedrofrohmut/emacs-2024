;; Auto-Complete ####################################################################################

;; Manual completion example (Does not show automatically)

(unless (package-installed-p 'corfu)
  (package-install 'corfu))

(require 'corfu)

(keymap-set evil-insert-state-map "C-j" 'completion-at-point)

(evil-define-key 'insert corfu-map (kbd "C-j") 'corfu-insert)
(evil-define-key 'insert corfu-map (kbd "C-k") 'corfu-quit)
(evil-define-key 'insert corfu-map (kbd "SPC") 'corfu-insert-separator)

(global-corfu-mode)
