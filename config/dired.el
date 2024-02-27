;; Dired ####################################################################################

(require 'dired)

(setq dired-listing-switches "-lhAF --color=auto")

(keymap-unset dired-mode-map "SPC")

(evil-define-key 'normal dired-mode-map (kbd "SPC") nil)
(evil-define-key 'normal dired-mode-map (kbd "g o") nil)

(defun my/dired-find-home ()
  ;; Find home broh
  (interactive)
  (dired "~/"))

;; Global mapping
(keymap-set evil-normal-state-map "SPC ." 'dired)
(keymap-set evil-normal-state-map "SPC f e" 'dired-jump)
(keymap-set evil-normal-state-map "SPC f m h" #'my/dired-find-home)

;; DirEd Only Mappings
(evil-define-key 'normal dired-mode-map (kbd "SPC n f") 'dired-create-empty-file)
(evil-define-key 'normal dired-mode-map (kbd "SPC n d") 'dired-create-directory)
(evil-define-key 'normal dired-mode-map (kbd "SPC r n") 'dired-do-rename)

(evil-define-key 'normal dired-mode-map (kbd "h") 'dired-up-directory)
(evil-define-key 'normal dired-mode-map (kbd "l") 'dired-find-file)
(evil-define-key 'normal dired-mode-map (kbd "g o") 'dired-find-file-other-window)

;; TODO: check out % commands of dired

;; Dired as sidebar
;(unless (package-installed-p 'dired-sidebar)
;  (package-install 'dired-sidebar))
;
;(keymap-set evil-normal-state-map "SPC f s" 'dired-sidebar-toggle-sidebar)
;(keymap-set evil-normal-state-map "C-b" 'dired-sidebar-toggle-sidebar)

;; Divish ######################################################################

(unless (package-installed-p 'dired-subtree)
  (package-install 'dired-subtree))

(evil-define-key 'normal dired-mode-map (kbd "o") 'dired-subtree-toggle)

;; Divish ######################################################################

;(unless (package-installed-p 'dirvish)
;  (package-install 'dirvish))
;
;(dirvish-override-dired-mode)

;(evil-define-key 'normal dired-mode-map (kbd "o") 'dirvish-subtree-toggle)
