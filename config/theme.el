(unless (package-installed-p 'doom-themes)
  (package-install 'doom-themes))

(load-theme 'doom-tokyo-night t)
;(load-theme 'doom-meltbus t)
;(load-theme 'doom-ir-black t)
;(load-theme 'doom-plain-dark t)
;(load-theme 'wombat t)

;; Apperance ###################################################################

;(add-to-list 'default-frame-alist '(background-color . "#1a1b26"))
;(add-to-list 'default-frame-alist '(foreground-color . "#d5d5d5"))
;(add-to-list 'default-frame-alist '(font . "FiraMono Nerd Font 12"))
;(add-to-list 'default-frame-alist '(alpha . (85 . 85)))

;(set-frame-parameter nil 'alpha-background 85)

;; Background - Tokyo Night Background
;(set-background-color "#1a1b26")

;; Custom colors
;(set-face-foreground 'line-number "#a3a3a3")           ;; Light Gray

;; Comments -> Dark Gray Blue
(set-face-attribute 'font-lock-comment-face nil :foreground "#369")

;; Strings -> Light Orange
(set-face-foreground 'font-lock-string-face "#ff9933")

(unless (package-installed-p 'doom-modeline)
  (package-install 'doom-modeline))

;; Icons for doom modeline (uncomment to install)
;; (unless (package-installed-p 'nord-icons)
;;   (package-install 'nord-icons))

;(setq doom-modeline-buffer-file-name-style 'truncate-nil) ;; Show buffer path full
(setq doom-modeline-icon nil)				              ;; Don't show icons
(setq doom-modeline-percent-position '(-3 "%p"))	      ;; Show percentage of file

;; Activate doom modeline mode
;(add-hook 'after-init-hook #'doom-modeline-mode)
