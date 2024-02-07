(unless (package-installed-p 'avy)
  (package-install 'avy))

(require 'avy)

(keymap-set evil-normal-state-map "s" 'avy-goto-word-1)
(keymap-set evil-normal-state-map "SPC j c" 'avy-goto-char-2)
(keymap-set evil-normal-state-map "SPC j w" 'avy-goto-word-1)
(keymap-set evil-normal-state-map "SPC j l" 'avy-goto-line)
