;; Terminals ########################################################################################

(unless (package-installed-p 'vterm)
  (package-install 'vterm))

(setq vterm-shell "/usr/bin/bash")
(setq vterm-kill-buffer-on-exit t)

;; Open Vterm curr buffer
(define-key evil-normal-state-map (kbd "SPC x x") 'vterm)

;; Open a terminal in a vertical split window
(define-key evil-normal-state-map (kbd "SPC x o") 'vterm-other-window)
