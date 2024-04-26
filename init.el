;; Set up package.el to work with MELPA

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("elpa" . "https://elpa.gnu.org/packages/"))
(package-initialize)
;;(package-refresh-contents)

;; NativeComp - Set the directory to store cache
(add-to-list 'native-comp-eln-load-path (expand-file-name "eln-cache/" user-emacs-directory))

;; NativeComp - Silence compiler warnings
(setq native-comp-async-report-warnings-errors nil)

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

;; Terminals
;(load "~/.config/emacs/config/terminals.el")
(load "~/.config/emacs/config/alt-terminals.el")

;; Utils: Visual Fill Column, Restart Emacs
(load "~/.config/emacs/config/utils.el")

;; Emmet
(load "~/.config/emacs/config/emmet.el")

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
(load "~/.config/emacs/config/file-tree.el")

;; Project
(load "~/.config/emacs/config/projects.el")

;; Languages
(load "~/.config/emacs/config/languages.el")

;; Eglot LSP
;(load "~/.config/emacs/config/lsp.el")
(load "~/.config/emacs/config/alt-lsp.el")

;; Debugging
(load "~/.config/emacs/config/debug.el")

;; Markdown
(load "~/.config/emacs/config/markdown.el")

;; Minibuffer
(load "~/.config/emacs/config/minibuffer.el")

;; Auto-complete
(load "~/.config/emacs/config/auto-complete.el")

;; Compile
(load "~/.config/emacs/config/compile.el")

;; Consult
(load "~/.config/emacs/config/consult.el")

;; Copy and Paste
(load "~/.config/emacs/config/copy-paste.el")

;; Helpful
(load "~/.config/emacs/config/helpful.el")

;; Theme - theme, mode line, etc
;(load "~/.config/emacs/config/theme.el")
(load "~/.config/emacs/config/alt-theme.el")

;; Git support
(load "~/.config/emacs/config/git-support.el")

;; Options ######################################################################

(setq inhibit-startup-message t)

;; Tab only indent on the correct position
(setq tab-always-indent t)

;; Insert spaces  instead of tabs (no \t)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)

;; Line Numbers (If I ever want it back is here)
(global-display-line-numbers-mode t)
(setq-default display-line-numbers-type 'relative)

;; Insert closing character like ) } ]
(setq electric-pair-mode nil)

;; Maching highlight
(show-paren-mode t)
(setq show-paren-delay 0)
(setq show-paren-style 'parenthesis)
(set-face-attribute 'show-paren-match nil
                    :foreground "#f00" :background "#000" :weight 'ultra-bold)

;; Saves your location in files for the next time you open it
(save-place-mode t)

;; Keep a Recent File List
;(recentf-mode t)

;; Files
(setq make-backup-files nil)
(setq auto-save-default nil)

;; Fill Column (Ruler)
(setq-default fill-column 121)
(global-display-fill-column-indicator-mode t)
(setq-default display-fill-column-indicator-column 81)

;; Show cursor position in statusbar
(setq column-number-mode t)

;; Dont open gui dialogs
(setq use-dialog-box nil)

;; Update emacs buffers when the files change outside (keep buffers sync)
(setq global-auto-revert-non-file-buffers t)
(global-auto-revert-mode t)

;; Stop the beep
(setq visible-bell t)

;; Setup Scroll to disable jumping default behaviour
(setq scroll-step 1)
(setq scroll-conservatively 101)
(setq scroll-margin 3)
;(setq scroll-margin 99999)
(setq hscroll-step 1)
(setq hscroll-margin 3)

;; Set no wrap lines
(set-default 'truncate-lines t)

;; Tabs
(setq tab-bar-new-tab-choice "*scratch*")
(setq tab-bar-new-tab-to 'rightmost)
(setq tab-bar-close-button-show nil)
(setq tab-bar-new-button-show nil)

;; Set root dir for project.el
(setq project-vc-extra-root-markers '(".project.el" ".projectile" ))

(setq-default buffer-file-coding-system 'utf-8-unix)

;; Set customize file
(setq custom-file "~/.config/emacs/emacs-custom.el")
(load custom-file :noerror)

;; Fonts
(set-face-font 'default "Fira Code 12")
(set-face-font 'variable-pitch "Fira Sans 12")
(set-face-font 'fixed-pitch "Fira Code 12")

;; Highlight line
(global-hl-line-mode)

;; Keybinds #####################################################################

;; Make ESC quit prompts
(keymap-global-set "<escape>" 'keyboard-escape-quit)

;; Easy change emacs current directory
(keymap-set evil-normal-state-map "C-c C-d" 'cd)

;; Better M-x
(keymap-global-set "M-SPC" 'execute-extended-command)

;; Enter do not indent everytime
(defun my/new-line ()
  (interactive)
  (call-interactively #'electric-indent-just-newline)
  (indent-for-tab-command))

(keymap-set evil-insert-state-map "M-j" #'my/new-line)

;; Buffer recent
(defun my/switch-to-recent-buffer ()
  (interactive)
  (switch-to-buffer (other-buffer (current-buffer) 1)))

(keymap-set evil-normal-state-map "C-M-i" #'my/switch-to-recent-buffer)
(keymap-set evil-normal-state-map "g b" #'my/switch-to-recent-buffer)

;; Startup Function #############################################################

(defun my/display-startup-time ()
  (message "Emacs loaded in %s with %d garbage collections."
           (format "%.2f seconds"
                   (float-time
                    (time-subtract after-init-time before-init-time)))
           gcs-done))

;; (defun my/restore-gc-threshhold ()
;;   (setq gc-cons-threshold (* 50 1000 1000))) ;; 50 Mega Bytes

;; Hooks #########################################################################

;(add-hook 'emacs-startup-hook #'my/restore-gc-threshhold)
(add-hook 'emacs-startup-hook #'my/display-startup-time)
(add-hook 'write-file-hooks    'delete-trailing-whitespace)
