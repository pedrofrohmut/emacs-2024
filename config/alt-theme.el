(unless (package-installed-p 'monokai-pro-theme)
  (package-install 'monokai-pro-theme))

(load-theme 'monokai-pro t)

;; Tokyo Night Bg
(set-background-color "#1a1b26")

;; Color for selected text
(set-face-attribute 'region nil :foreground "#fff" :background "#552")

;; Comments (old value #727072)
(defvar my-dark-gray-blue "#58a")
(set-face-foreground 'font-lock-comment-face my-dark-gray-blue)
