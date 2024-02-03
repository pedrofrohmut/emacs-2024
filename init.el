;; Options ######################################################################

(setq visible-bell t)

;; Keybinds #####################################################################

(global-unset-key (kbd "C-h"))  ;; Can still use help with F1
(global-unset-key (kbd "C-l"))  ;; Can use evil zz
(global-unset-key (kbd "C-j"))  ;; Not useful before
(global-unset-key (kbd "C-k"))  ;; Not useful either

(global-set-key (kbd "<escape>") 'keyboard-escape-quit) ;; Make ESC quit prompts

;; DirEd Keys
(define-key dired-mode-map (kbd "C-c n f") 'dired-create-empty-file)
(define-key dired-mode-map (kbd "C-c n d") 'dired-create-directory)
(evil-define-key 'normal dired-mode-map (kbd "n f") 'dired-create-empty-file)
(evil-define-key 'normal dired-mode-map (kbd "n d") 'dired-create-directory)

;; Project
(define-key evil-normal-state-map (kbd "C-q") 'project-find-file)

;; Buffers
(define-key evil-normal-state-map (kbd "M-p") 'previous-buffer)
(define-key evil-normal-state-map (kbd "M-n") 'next-buffer)

;; Minibuffer
(define-key minibuffer-mode-map (kbd "C-w") 'backward-kill-word)
(define-key minibuffer-mode-map (kbd "C-u") 'backward-kill-sentence)

;; Shell Command
(define-key evil-normal-state-map (kbd "M-1") 'shell-command)

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

;; Straight.el Bootstrap #########################################################

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; Integration between straight.el and use-package
;;(straight-use-package 'use-package)

;; Theming - theme and mode line
(load "~/.config/emacs/config/theme.el")

;; Evil - Vi mode and extra evil packages
(load "~/.config/emacs/config/evil.el")
