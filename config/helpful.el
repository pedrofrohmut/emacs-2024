;; Helpful ######################################################################

(unless (package-installed-p 'helpful)
  (package-install 'helpful))

(keymap-set evil-normal-state-map "SPC h h" 'helpful-at-point)

;; Help
(keymap-set evil-normal-state-map "SPC h f" 'helpful-function)
(keymap-set evil-normal-state-map "SPC h v" 'helpful-variable)
(keymap-set evil-normal-state-map "SPC h k" 'helpful-key)
