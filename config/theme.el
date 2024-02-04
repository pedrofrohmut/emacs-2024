(unless (package-installed-p 'doom-themes)
  (package-install 'doom-themes))

(load-theme 'doom-tokyo-night t)

;; Apperance ###################################################################

;(add-to-list 'default-frame-alist '(background-color . "#1a1b26"))
;(add-to-list 'default-frame-alist '(foreground-color . "#d5d5d5"))
;(add-to-list 'default-frame-alist '(font . "FiraMono Nerd Font 12"))
;(add-to-list 'default-frame-alist '(alpha . (85 . 85)))

;(set-frame-parameter nil 'alpha-background 85)
;(set-background-color "#1a1b26"))
(set-face-foreground 'line-number "#a3a3a3")
;(set-background-color "#1a1b26")

;; UI
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(set-fringe-mode 12) ;; Adds side padding to frames

(unless (package-installed-p 'doom-modeline)
  (package-install 'doom-modeline))

;; Icons for doom modeline (uncomment to install)
;; (unless (package-installed-p 'nord-icons)
;;   (package-install 'nord-icons))

(setq doom-modeline-buffer-file-name-style 'truncate-nil) ;; Show buffer path full
(setq doom-modeline-icon nil)				              ;; Don't show icons
(setq doom-modeline-percent-position '(-3 "%p"))	      ;; Show percentage of file

;; Activate doom modeline mode
(add-hook 'after-init-hook #'doom-modeline-mode)
