;; Options ######################################################################

(setq inhibit-startup-message t)

;; Insert spaces  instead of tabs (no \t)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)

;; Tab only indent on the correct position
(setq-default tab-always-indent nil)

;; Line Numbers
;(global-display-line-numbers-mode t)
;(setq-default display-line-numbers-type 'relative)

;; Insert closing character like ) } ]
(electric-pair-mode t)
(show-paren-mode t)

;; Saves your location in files for the next time you open it
(save-place-mode t)

;; Files
(setq make-backup-files nil)
(setq auto-save-default nil)

;; Fill Column (Ruler)
(setq-default fill-column 121)
(global-display-fill-column-indicator-mode t)
(setq-default display-fill-column-indicator-column 101)

;; Show cursor position in statusbar
(setq column-number-mode t)

;; Dont open gui dialogs
(setq use-dialog-box nil)

;; Update emacs buffers when the files change outside (keep buffers sync)
(setq global-auto-revert-non-file-buffers t)
(global-auto-revert-mode t)

;; Stop the beep
(setq visible-bell t)

;; Set no wrap lines
(set-default 'truncate-lines t)

;; Set root dir for project.el
(setq project-vc-extra-root-markers '(".project.el" ".projectile" ))

;; Config Files #####################################################################################

;; Set up package.el to work with MELPA
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("elpa" . "https://elpa.gnu.org/packages/"))
(package-initialize)
;;(package-refresh-contents)

;; Keybinds #####################################################################

(global-unset-key (kbd "C-h"))  ;; Can still use help with F1
(global-unset-key (kbd "C-l"))  ;; Can use evil zz
(global-unset-key (kbd "C-j"))  ;; Not useful before
(global-unset-key (kbd "C-k"))  ;; Not useful either
(global-unset-key (kbd "C-SPC")) ;; For emmet
(global-unset-key (kbd "M-k")) ;; To tab-recent
(global-unset-key (kbd "M-j")) ;; To next-window

(global-set-key (kbd "<escape>") 'keyboard-escape-quit) ;; Make ESC quit prompts

(keymap-global-set "C-c C-d" 'cd) ;; Easy change emacs current directory

;; Minibuffer
(define-key minibuffer-mode-map (kbd "C-w") 'backward-kill-word)
(define-key minibuffer-mode-map (kbd "C-u") 'backward-kill-sentence)

;; Config Files #####################################################################################

;; Evil - Vi mode and extra evil packages
(load "~/.config/emacs/config/evil.el")

;; Theme - theme, mode line, etc
(load "~/.config/emacs/config/theme.el")

;; Terminals
(load "~/.config/emacs/config/terminals.el")

;; Utils: Visual Fill Column, Restart Emacs
(load "~/.config/emacs/config/utils.el")

;; Snippets
(load "~/.config/emacs/config/snippets.el")

;; Tabs
(load "~/.config/emacs/config/tabs.el")

;; Startup Function #############################################################

(defun my/display-startup-time ()
  (message "Emacs loaded in %s with %d garbage collections."
           (format "%.2f seconds"
                   (float-time
                    (time-subtract after-init-time before-init-time)))
           gcs-done))
(defun my/restore-gc-threshhold ()
  (setq gc-cons-threshold '1600000))

;; Hooks #########################################################################

(add-hook 'emacs-startup-hook #'my/display-startup-time)
(add-hook 'emacs-startup-hook #'my/restore-gc-threshhold)
(add-hook 'write-file-hooks    'delete-trailing-whitespace)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("4594d6b9753691142f02e67b8eb0fda7d12f6cc9f1299a49b819312d6addad1d" "88f7ee5594021c60a4a6a1c275614103de8c1435d6d08cc58882f920e0cec65e" "34cf3305b35e3a8132a0b1bdf2c67623bc2cb05b125f8d7d26bd51fd16d547ec" default))
 '(package-selected-packages
   '(emmet-mode restart-emacs visual-fill-column evil-lion evil-numbers evil-surround evil-commentary evil-collection evil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(tab-bar ((t (:box nil :foreground "#13141c" :background "#13141c"))))
 '(tab-bar-tab ((t (:box nil :foreground "#ff0000" :background "#13141c")))))
