;; Modus theme ##################################################################

;; All variables must be set before load-theme

;; Modeline
(setq modus-themes-mode-line '(accented borderless (padding . 4)))

;; Text Selection (Visual Mode)
(setq modus-themes-region '(accented))

;; Minibuffer Completion - Example
(setq modus-themes-completions
      (quote ((selection . (intense accented))
              (popup . (intense accented)))))

;; Typography
(setq modus-themes-bold-constructs nil)

;; Match paren coloring
(setq modus-themes-paren-match '(intense))

;; Syntax
(setq modus-themes-syntax '(yellow-comments))

;; Background - Tokyo Night Background
(set-background-color "#1a1b26")

;; Comments -> Dark Gray Blue
(set-face-attribute 'font-lock-comment-face nil :foreground "#37b")

;; Strings -> Light Orange
(set-face-foreground 'font-lock-string-face "#ff9933")

(load-theme 'modus-vivendi :no-confirm)

;; Doom theme ###################################################################

;(unless (package-installed-p 'doom-themes)
;  (package-install 'doom-themes))

;(load-theme 'doom-tokyo-night t)
;(load-theme 'doom-meltbus t)
;(load-theme 'doom-ir-black t)
;(load-theme 'doom-plain-dark t)
;(load-theme 'wombat t)

;; Apperance ####################################################################

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
;(set-face-attribute 'font-lock-comment-face nil :foreground "#37b")

;; Strings -> Light Orange
;(set-face-foreground 'font-lock-string-face "#ff9933")
