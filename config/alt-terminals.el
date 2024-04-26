;; Terminals ####################################################################

(defun my/project-terminal ()
  (interactive)
  (let ((project-root (project-root (project-current))))
    (if project-root
      (progn
        (setq default-directory project-root)
        (ansi-term "/usr/bin/zsh"))
      (message "No project found"))))

(keymap-set evil-normal-state-map "SPC x x" #'my/project-terminal)

(keymap-set evil-normal-state-map "SPC x o"
  (lambda ()
    (interactive)
    (split-window-horizontally)
    (other-window 1)
    (my/project-terminal)))
