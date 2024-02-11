;; Garbace Collection ajusted for faster startup time (reajusted after)

;(setq gc-cons-threshold 15000000)

;; Code reference from: https://emacs-lsp.github.io/lsp-mode/tutorials/CPP-guide/
;(setq gc-cons-threshold (* 100 1024 1024)
;      read-process-output-max (* 1024 1024)
;      treemacs-space-between-root-nodes nil
;      company-idle-delay 0.0
;      company-minimum-prefix-length 1
;      lsp-idle-delay 0.1)  ;; clangd is fast

;; Performance adjusts to better LSP
(setq gc-cons-threshold (* 100 1024 1024)) ;; 100mb
(setq read-process-output-max (* 1024 1024)) ;; 1mb


;; Apperance ###################################################################

;(add-to-list 'default-frame-alist '(foreground-color . "#d5d5d5"))
;; (add-to-list 'default-frame-alist '(font . "FiraMono Nerd Font 13"))
(add-to-list 'default-frame-alist '(font . "Fira Code 13"))
(add-to-list 'default-frame-alist '(alpha-background . 85))
(add-to-list 'default-frame-alist '(background-color . "#1a1b26"))

;; UI
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(set-fringe-mode 12) ;; Adds side padding to frames

;; Tranparency for Terminal #####################################################

(defun set-background-for-terminal (&optional frame)
 (or frame (setq frame (selected-frame)))
 "unsets the background color in terminal mode"
 (unless (display-graphic-p frame)
   (set-face-background 'default "unspecified-bg" frame)))

(add-hook 'after-make-frame-functions 'set-background-for-terminal)
(add-hook 'window-setup-hook          'set-background-for-terminal)
