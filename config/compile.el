;; Compile ######################################################################

;; Set compile initial command
(setq compile-command "")

;; Override for easier window navigation
(evil-define-key 'normal compilation-mode-map (kbd "C-k") 'evil-window-up)
(evil-define-key 'normal compilation-mode-map (kbd "C-j") 'evil-window-down)

(evil-define-key 'normal compilation-mode-map (kbd "g n") 'compilation-next-error)
(evil-define-key 'normal compilation-mode-map (kbd "g p") 'compilation-previous-error)

(defun my/project-compile ()
  (let ((default-directory (project-root (project-current t)))
         (compilation-buffer-name-function
           (or project-compilation-buffer-name-function
             compilation-buffer-name-function)))
    (compile compile-command)))

(defun my/project-compile-saved-command ()
  (interactive)
  (if (string-empty-p compile-command)
    (error "Compile command is empty")
    (my/project-compile)))

;; Compile my code
(keymap-set evil-normal-state-map "SPC r c" 'project-compile)
(keymap-set evil-normal-state-map "SPC r r" #'my/project-compile-saved-command)

;; Hook that focus the Compilation window than jump the cursor to the first error
(add-hook 'compilation-mode-hook
  (lambda ()
    (pop-to-buffer (get-buffer "*compilation*"))
    ;; Add delay (in seconds: float) so the jump to error can work
    ;; * doesnt work on slow compilations but is great for fast stuff
    (run-at-time 1.0 nil
      (lambda ()
        (if (> compilation-num-errors-found 0)
          (compilation-next-error 1))))))
