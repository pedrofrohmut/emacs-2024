;; Garbace Collection ajusted for faster startup time (reajusted after)

;; Performance adjusts to better LSP
(setq gc-cons-threshold (* 100 1024 1024)) ;; 100mb
(setq read-process-output-max (* 1024 1024)) ;; 1mb


;; Apperance ###################################################################

(add-to-list 'default-frame-alist '(font . "Fira Code 13"))
(add-to-list 'default-frame-alist '(foreground-color . "#ddd"))
(add-to-list 'default-frame-alist '(alpha-background . 90))
(add-to-list 'default-frame-alist '(background-color . "#1a1b26"))
(add-to-list 'default-frame-alist '(cursor-color . "#ff0"))


;; UI
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(set-fringe-mode 20) ;; Adds side padding to frames

;; Tranparency for Terminal #####################################################

(defun set-background-for-terminal (&optional frame)
 (or frame (setq frame (selected-frame)))
 "unsets the background color in terminal mode"
 (unless (display-graphic-p frame)
   (set-face-background 'default "unspecified-bg" frame)))

(add-hook 'after-make-frame-functions 'set-background-for-terminal)
(add-hook 'window-setup-hook          'set-background-for-terminal)
