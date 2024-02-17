;; File Tree ##################################################################

(unless (package-installed-p 'neotree)
  (package-install 'neotree))

(keymap-set evil-normal-state-map "<f8>" 'neotree-toggle)

;; Use with evil mode
(add-hook 'neotree-mode-hook
              (lambda ()
                ;; (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
                (define-key evil-normal-state-local-map (kbd "SPC") 'neotree-quick-look)
                (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
                ;; (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)
                (define-key evil-normal-state-local-map (kbd "o") 'neotree-enter)
                (define-key evil-normal-state-local-map (kbd "g") 'neotree-refresh)
                (define-key evil-normal-state-local-map (kbd "A") 'neotree-stretch-toggle)
                (define-key evil-normal-state-local-map (kbd "H") 'neotree-hidden-file-toggle)))

(defun neotree-project-dir ()
  "Open a vterm at the project root directory."
  (interactive)
  (let ((project-root (project-root (project-current))))
    (if project-root
        (progn
          (neotree-dir project-root)
          (neotree))
      (message "No project found."))))

(keymap-set evil-normal-state-map "C-b" #'neotree-project-dir)
