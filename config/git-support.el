;; Diff Hl ######################################################################

;(unless (package-installed-p 'diff-hl)
;  (package-install 'diff-hl))
;
;(set-face-attribute 'diff-hl-insert nil
;		    :background "#060"
;		    :foreground "#fff"
;		    :inherit nil)
;
;(set-face-attribute 'diff-hl-change nil
;		    :background "#006"
;		    :inherit nil)
;
;(global-diff-hl-mode)

;; Git Gutter ###################################################################

(unless (package-installed-p 'git-gutter-fringe)
  (package-install 'git-gutter-fringe))

(require 'git-gutter-fringe)

(global-git-gutter-mode)

(setq git-gutter-fr:side 'left-fringe)

;; Please adjust fringe width if your own sign is too big.
(setq-default left-fringe-width  20)
(setq-default right-fringe-width 20)

;; (set-face-foreground 'git-gutter-fr:modified "#333")
;; (set-face-foreground 'git-gutter-fr:added    "#333")
;; (set-face-foreground 'git-gutter-fr:deleted  "#888")

;; (set-face-background 'git-gutter-fr:modified "#666")
;; (set-face-background 'git-gutter-fr:added    "#060")
;; (set-face-background 'git-gutter-fr:deleted  "#800")

(set-face-foreground 'git-gutter-fr:modified "#00f")
(set-face-foreground 'git-gutter-fr:added    "#0a0")
(set-face-foreground 'git-gutter-fr:deleted  "#f00")

(set-face-background 'git-gutter-fr:modified "#222")
(set-face-background 'git-gutter-fr:added    "#222")
(set-face-background 'git-gutter-fr:deleted  "#222")
