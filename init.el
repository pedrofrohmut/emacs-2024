;; Set up package.el to work with MELPA
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("elpa" . "https://elpa.gnu.org/packages/"))
(package-initialize)
;;(package-refresh-contents)

;; Options ######################################################################

(setq inhibit-startup-message t)

;; Insert spaces  instead of tabs (no \t)
(setq tab-width 4)
(setq indent-tabs-mode nil)
;(setq indent-line-function 'insert-tab)

;; Tab only indent on the correct position
(setq tab-always-indent nil)

;; Line Numbers (If I ever want it back is here)
(global-display-line-numbers-mode t)
(setq-default display-line-numbers-type 'relative)

;; Insert closing character like ) } ]
(electric-pair-mode t)

;; Maching highlight
(show-paren-mode t)
(setq show-paren-delay 0)
(setq show-paren-style 'parenthesis)
(set-face-attribute 'show-paren-match nil
                    :foreground "#f00" :background "#000" :weight 'ultra-bold)

;; Saves your location in files for the next time you open it
(save-place-mode t)

;; Keep a Recent File List
(recentf-mode t)

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

;; Tabs
(setq tab-bar-new-tab-choice "*scratch*")
(setq tab-bar-new-tab-to 'rightmost)
(setq tab-bar-close-button-show nil)
(setq tab-bar-new-button-show nil)

;; Set root dir for project.el
(setq project-vc-extra-root-markers '(".project.el" ".projectile" ))

;; Set customize file
(setq custom-file "~/.config/emacs/emacs-custom.el")
(load custom-file)

;; Fonts
(set-face-attribute 'default nil
                    :family "Fira Code" :height 120 :weight 'regular)
(set-face-attribute 'variable-pitch nil
                    :family "Fira Sans" :height 120 :weight 'regular)
(set-face-attribute 'fixed-pitch nil
                    :family "Fira Code" :height 120 :weight 'regular)

;; NativeComp - Silence compiler warnings
(setq native-comp-async-report-warnings-errors nil)

;; NativeComp - Set the directory to store cache
(add-to-list 'native-comp-eln-load-path (expand-file-name "eln-cache/" user-emacs-directory))

;; Unset Keybinds ###################################################################################

(global-unset-key (kbd "C-h"))  ;; Can still use help with F1
(global-unset-key (kbd "C-l"))  ;; Can use evil zz
(global-unset-key (kbd "C-j"))  ;; Not useful before
(global-unset-key (kbd "C-k"))  ;; Not useful either
(global-unset-key (kbd "C-SPC")) ;; For emmet
(global-unset-key (kbd "M-k")) ;; To tab-recent
(global-unset-key (kbd "M-j")) ;; To next-window

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
;(load "~/.config/emacs/config/tabs.el")

;; Witchkey
;(load "~/.config/emacs/config/which-key.el")

;; Navigation (Jumping)
(load "~/.config/emacs/config/navigation.el")

;; Dired
(load "~/.config/emacs/config/dired.el")

;; File Tree
;(load "~/.config/emacs/config/file-tree.el")

;; Project
(load "~/.config/emacs/config/projects.el")

;; Languages
(load "~/.config/emacs/config/languages.el")

;; Eglot LSP
(load "~/.config/emacs/config/lsp.el")

;; Markdown
(load "~/.config/emacs/config/markdown.el")

;; Minibuffer
(load "~/.config/emacs/config/minibuffer.el")

;; Auto-complete
(load "~/.config/emacs/config/auto-complete.el")

;; Consult
(load "~/.config/emacs/config/consult.el")

;; Copy and Paste
(load "~/.config/emacs/config/copy-paste.el")

;; Helpful
(load "~/.config/emacs/config/helpful.el")

;; Keybinds #####################################################################

;; Make ESC quit prompts
(keymap-global-set "<escape>" 'keyboard-escape-quit)

;; Easy change emacs current directory
(keymap-set evil-normal-state-map "C-c C-d" 'cd)

;; Better M-x
(keymap-global-set "M-SPC" 'execute-extended-command)

;; Startup Function #############################################################

(defun my/display-startup-time ()
  (message "Emacs loaded in %s with %d garbage collections."
           (format "%.2f seconds"
                   (float-time
                    (time-subtract after-init-time before-init-time)))
           gcs-done))

(defun my/restore-gc-threshhold ()
  (setq gc-cons-threshold (* 50 1000 1000))) ;; 50 Mega Bytes

;; Hooks #########################################################################

;(add-hook 'emacs-startup-hook #'my/restore-gc-threshhold)
(add-hook 'emacs-startup-hook #'my/display-startup-time)
(add-hook 'write-file-hooks    'delete-trailing-whitespace)
