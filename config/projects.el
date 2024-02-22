;; Projects ##############################################################################

(require 'project)

(setq project-vc-ignores '("node_modules/" ".next/" ".docker_volume/"))

(keymap-set evil-normal-state-map "C-M-;" 'project-shell-command)

;; Find File
;(keymap-set evil-normal-state-map "C-q" 'project-find-file)
