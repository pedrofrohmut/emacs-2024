;; Dired ####################################################################################

(require 'dired)

(keymap-unset dired-mode-map "SPC")

(evil-define-key 'normal dired-mode-map (kbd "SPC") nil)

;; Global mapping
(keymap-set evil-normal-state-map "SPC f e" (lambda() (interactive) (dired ".")))
(keymap-set evil-normal-state-map "SPC ." 'dired)

;; DirEd Only Mappings
(evil-define-key 'normal dired-mode-map (kbd "SPC n f") 'dired-create-empty-file)
(evil-define-key 'normal dired-mode-map (kbd "SPC n d") 'dired-create-directory)
