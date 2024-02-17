;; Helpful ######################################################################

(unless (package-installed-p 'helpful)
  (package-install 'helpful))

(keymap-set evil-normal-state-map "SPC h h" 'helpful-at-point)
