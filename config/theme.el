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

;; My Custom Colors #################################################################################

;; Background - Tokyo Night Background
(set-background-color "#1a1b26")

;; Custom colors
;(set-face-foreground 'line-number "#a3a3a3")           ;; Light Gray

;; Comments -> Dark Gray Blue
(set-face-attribute 'font-lock-comment-face nil :foreground "#37b")

;; Strings -> Light Orange
(set-face-foreground 'font-lock-string-face "#ff9933")

;; Tabs
(set-face-attribute 'tab-bar nil
                    :foreground "#666" :background "#000")

;; Active Tab
(set-face-attribute 'tab-bar-tab nil
                    :foreground "#0ff" :background "#224444")

;; Inactive Tab
(set-face-attribute 'tab-bar-tab-inactive nil
                    :foreground "#666" :background "#000")

;; Loads Modus Theme
(load-theme 'modus-vivendi :no-confirm)

;; Doom theme #######################################################################################

;(unless (package-installed-p 'doom-themes)
;  (package-install 'doom-themes))

;(load-theme 'doom-tokyo-night t)
;(load-theme 'doom-meltbus t)
;(load-theme 'doom-ir-black t)
;(load-theme 'doom-plain-dark t)
;(load-theme 'wombat t)
