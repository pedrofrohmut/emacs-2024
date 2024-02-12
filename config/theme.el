;; Tokyo Night Colors ###############################################################################

(defvar tokyo-night-bg         "#1a1b26")
(defvar tokyo-night-bg-alt     "#13141c")
(defvar tokyo-night-base0      "#414868") ;; black
(defvar tokyo-night-base1      "#51587a") ;; brightblack
(defvar tokyo-night-base2      "#61698b") ;; brightblack
(defvar tokyo-night-base3      "#71799d") ;; brightblack
(defvar tokyo-night-base4      "#8189af") ;; brightblack
(defvar tokyo-night-base5      "#9099c0") ;; brightblack
(defvar tokyo-night-base6      "#a0aad2") ;; brightblack
(defvar tokyo-night-base7      "#b0bae3") ;; brightblack
(defvar tokyo-night-base8      "#c0caf5") ;; white
(defvar tokyo-night-fg-alt     "#c0caf5") ;; brightwhite
(defvar tokyo-night-fg         "#a9b1d6") ;; white
(defvar tokyo-night-grey       "#8189af") ;; brightblack
(defvar tokyo-night-red        "#f7768e") ;; red
(defvar tokyo-night-orange     "#ff9e64") ;; brightred
(defvar tokyo-night-green      "#73daca") ;; green
(defvar tokyo-night-teal       "#2ac3de") ;; brightgreen
(defvar tokyo-night-yellow     "#e0af68") ;; yellow
(defvar tokyo-night-blue       "#7aa2f7") ;; brightblue
(defvar tokyo-night-dark-blue  "#565f89") ;; blue
(defvar tokyo-night-magenta    "#bb9af7") ;; magenta
(defvar tokyo-night-violet     "#9aa5ce") ;; brightmagenta
(defvar tokyo-night-cyan       "#b4f9f8") ;; brightcyan"
(defvar tokyo-night-dark-cyan  "#7dcfff") ;; cyan
(defvar tokyo-night-dark-green "#9ece6a") ;; green
(defvar tokyo-night-brown      "#cfc9c2") ;; yellow

;; Wombat Colors ####################################################################################

(defvar wombat-fg       "#f6f3e8")
(defvar wombat-bg       "#242424")
(defvar wombat-green    "#95e454")
(defvar wombat-green+1  "#cae682")
(defvar wombat-green+2  "#4BC98A")
(defvar wombat-red-1    "#e5786d")
(defvar wombat-red      "#95e454")
(defvar wombat-blue-2   "#2e3436")
(defvar wombat-blue-1   "#64a8d8")
(defvar wombat-blue     "#8ac6f2")
(defvar wombat-magenta  "#cc99cc")
(defvar wombat-orange-1 "#f57900")
(defvar wombat-orange   "#e65c00")
(defvar wombat-orange+1 "#e9b96e")
(defvar wombat-orange+2 "#ffc125")
(defvar wombat-purple-1 "#ad7fa8")
(defvar wombat-purple   "#cc99cc")
(defvar wombat-pink-1   "#f283b6")
(defvar wombat-pink     "#F6B3DF")
(defvar wombat-gray-1   "#444444")
(defvar wombat-gray     "#424242")
(defvar wombat-gray+1   "#99968b")

;; Modus theme ##################################################################

;; All variables must be set before load-theme

;; Modeline
(setq modus-themes-mode-line '(accented borderless (padding . 4)))

;; Minibuffer Completion - Example
(setq modus-themes-completions
      (quote ((selection . (intense accented))
              (popup . (intense accented)))))

;; Typography
(setq modus-themes-bold-constructs nil)

;; Override the theme colors
(setq modus-themes-vivendi-color-overrides
      '((bg-main . "#1a1b26"))) ;; Tokyo Night Background

;; My Custom Colors #################################################################################

(defvar my-dark-gray-blue "#38a")
(defvar my-light-orange "#f93")

;; Custom colors
(set-face-foreground 'line-number "#a3a3a3")           ;; Light Gray

;; Comments
(set-face-attribute 'font-lock-comment-face nil :foreground my-dark-gray-blue)

;; Strings
(set-face-foreground 'font-lock-string-face my-light-orange)

;; TODO: Remove border from tabs
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
