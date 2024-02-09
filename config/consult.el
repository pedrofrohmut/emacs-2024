;; Consult ##########################################################################################

(unless (package-installed-p 'consult)
  (package-install 'consult))

(keymap-set evil-normal-state-map "C-f" 'consult-line)
(keymap-set evil-normal-state-map "M-f" 'consult-line-multi)

(keymap-set evil-normal-state-map "SPC f g" 'consult-ripgrep)
(keymap-set evil-normal-state-map "SPC f f" 'consult-fd)
(keymap-set evil-normal-state-map "SPC f m" 'consult-minor-mode-menu)
