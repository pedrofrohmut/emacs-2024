(unless (package-installed-p 'monokai-pro-theme)
  (package-install 'monokai-pro-theme))

(load-theme 'monokai-pro t)

;; Tokyo Night Bg
(set-background-color "#1a1b26")
