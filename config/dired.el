;; Dired ####################################################################################

(keymap-set evil-normal-state-map "SPC f e" (lambda() (interactive) (dired ".")))
(keymap-set evil-normal-state-map "SPC ." 'dired)

;; DirEd Keys
(evil-define-key 'normal dired-mode-map (kbd "n f") 'dired-create-empty-file)
(evil-define-key 'normal dired-mode-map (kbd "n d") 'dired-create-directory)
