;; Dired ####################################################################################

(require 'dired)

(keymap-unset dired-mode-map "SPC")

(evil-define-key 'normal dired-mode-map (kbd "SPC") nil)

(evil-define-key 'normal dired-mode-map (kbd "o") 'dired-subtree-toggle)

;; Global mapping
(keymap-set evil-normal-state-map "SPC f e" (lambda() (interactive) (dired ".")))
(keymap-set evil-normal-state-map "SPC ." 'dired)

;; DirEd Only Mappings
(evil-define-key 'normal dired-mode-map (kbd "SPC n f") 'dired-create-empty-file)
(evil-define-key 'normal dired-mode-map (kbd "SPC n d") 'dired-create-directory)
(evil-define-key 'normal dired-mode-map (kbd "SPC r n") 'dired-do-rename)

;; Dired as sidebar
;(unless (package-installed-p 'dired-sidebar)
;  (package-install 'dired-sidebar))
;
;(keymap-set evil-normal-state-map "SPC f s" 'dired-sidebar-toggle-sidebar)
;(keymap-set evil-normal-state-map "C-b" 'dired-sidebar-toggle-sidebar)
