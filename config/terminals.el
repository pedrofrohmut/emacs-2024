;; Terminals ########################################################################################

(unless (package-installed-p 'vterm)
  (package-install 'vterm))

(setq vterm-shell "/usr/bin/bash")
(setq vterm-kill-buffer-on-exit t)

;; Open a terminal in a vertical split window
(define-key evil-normal-state-map (kbd "SPC t t") 'vterm-other-window)

;; Open Vterm curr buffer
(define-key evil-normal-state-map (kbd "SPC x x") 'vterm)
