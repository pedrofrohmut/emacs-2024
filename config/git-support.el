;; Git Gutter ###################################################################

(unless (package-installed-p 'git-gutter-fringe)
  (package-install 'git-gutter-fringe))

(require 'git-gutter-fringe)

(global-git-gutter-mode)

(setq git-gutter-fr:side 'left-fringe)

(set-face-foreground 'git-gutter-fr:modified "#00f")
(set-face-foreground 'git-gutter-fr:added    "#0a0")
(set-face-foreground 'git-gutter-fr:deleted  "#f00")

;; (set-face-background 'git-gutter-fr:modified "#222")
;; (set-face-background 'git-gutter-fr:added    "#222")
;; (set-face-background 'git-gutter-fr:deleted  "#222")
