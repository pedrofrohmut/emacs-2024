;; Git Gutter ###################################################################

(unless (package-installed-p 'git-gutter-fringe)
  (package-install 'git-gutter-fringe))

(require 'git-gutter-fringe)

(with-eval-after-load 'git-gutter-fringe
  (setq git-gutter-fr:side 'left-fringe)

  (set-face-background 'fringe "#1a1b26")

  (set-face-foreground 'git-gutter-fr:modified "#00a")
  (set-face-foreground 'git-gutter-fr:added    "#0a0")
  (set-face-foreground 'git-gutter-fr:deleted  "#a00")

  (set-face-background 'git-gutter-fr:modified "#00f")
  (set-face-background 'git-gutter-fr:added    "#0a0")
  (set-face-background 'git-gutter-fr:deleted  "#f00")

  ;; (defvar tokyo-night-bg "#1a1b26")

  ;; (set-face-background 'git-gutter-fr:modified tokyo-night-bg)
  ;; (set-face-background 'git-gutter-fr:added    tokyo-night-bg)
  ;; (set-face-background 'git-gutter-fr:deleted  tokyo-night-bg)

  (global-git-gutter-mode))
