;; Which-Key ####################################################################

(unless (package-installed-p 'which-key)
  (package-install 'which-key))

(require 'which-key)

;; Delay to show
(setq which-key-idle-delay 2)
(setq which-key-idle-secondary-delay 0.05)

;; Make it right popup
(setq which-key-popup-type 'side-window)
(setq which-key-side-window-location 'right)
(setq which-key-side-window-max-width 0.43)

(which-key-mode)
