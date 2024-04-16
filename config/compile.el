;; Compile ######################################################################

;; Set compile initial command
(setq compile-command "")

;; Override for easier window navigation
(evil-define-key 'normal compilation-mode-map (kbd "C-k") 'evil-window-up)
(evil-define-key 'normal compilation-mode-map (kbd "C-j") 'evil-window-down)

(evil-define-key 'normal compilation-mode-map (kbd "g n") 'compilation-next-error)
(evil-define-key 'normal compilation-mode-map (kbd "g p") 'compilation-previous-error)

;; Compile my code
(keymap-set evil-normal-state-map "SPC r c" 'project-compile)
(keymap-set evil-normal-state-map "SPC r r"
  (lambda ()
    (interactive)
    (if (string-empty-p compile-command)
      (error "Compile command is empty")
      (compile compile-command))))

;; Hook that focus the Compilation window than jump the cursor to the first error
(add-hook 'compilation-mode-hook
  (lambda ()
    (pop-to-buffer (get-buffer "*compilation*"))
    ;; Add delay so the jump to error can work
    (run-at-time 0.3 nil
      (lambda ()
        (if (> compilation-num-errors-found 0)
          (compilation-next-error 1))))))
