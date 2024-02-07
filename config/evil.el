;; Download Evil
(unless (package-installed-p 'evil)
  (package-install 'evil))

;; Evil #########################################################################

(setq evil-want-C-u-scroll t)
(setq evil-want-C-u-delete t)
(setq evil-want-C-i-jump t)
(setq evil-want-Y-yank-to-eol t)
(setq evil-vsplit-window-right t)
(setq evil-split-window-below t)
(setq evil-cross-lines t)
(setq evil-move-beyond-eol t)
(setq evil-undo-system 'undo-redo)
(setq evil-want-keybinding nil) ; Evil collection asks for it

(require 'evil)
(add-hook 'after-init-hook 'evil-mode)

;; Evil Keymaps ###############################################################################

;; Unsets
(keymap-unset evil-normal-state-map "C-p")
(keymap-unset evil-normal-state-map "C-n")
(keymap-unset evil-normal-state-map "s")
(keymap-unset evil-normal-state-map "S")

;; Redo
(define-key evil-normal-state-map (kbd "U") 'evil-redo)

;; Easy insert linebreak in normal mode
(define-key evil-normal-state-map (kbd "RET") (kbd "i RET <escape>"))

;; Ctrl-h as backspace
(define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)

;; Ctrl-l as delete
(define-key evil-insert-state-map (kbd "C-l") 'evil-delete-char)

;; Scroll down
(define-key evil-normal-state-map (kbd "C-j") (lambda () (interactive) (evil-scroll-down 12)))

;; Scroll up
(define-key evil-normal-state-map (kbd "C-k") (lambda () (interactive) (evil-scroll-up 12)))

;; Shell Command
(keymap-set evil-normal-state-map "M-;" 'shell-command)

;; Navigation
(keymap-set evil-normal-state-map "M-j" 'evil-window-next)
(keymap-set evil-normal-state-map "M-k" 'tab-recent)

;; Change Tab normal mode
(define-key evil-normal-state-map (kbd "C-l") 'tab-next)
(define-key evil-normal-state-map (kbd "C-h") 'tab-previous)

;; Tabs
(define-key evil-normal-state-map (kbd "SPC t c") 'tab-new)
(define-key evil-normal-state-map (kbd "SPC t q") 'tab-close)
(define-key evil-normal-state-map (kbd "SPC t o") 'tab-close-other)
(define-key evil-normal-state-map (kbd "SPC t u") 'tab-undo)
(define-key evil-normal-state-map (kbd "SPC t l") 'tab-move)
(define-key evil-normal-state-map (kbd "SPC t h") (lambda() (interactive) (tab-move -1)))

;; Tabs by Number
(keymap-set evil-normal-state-map "M-1" (lambda() (interactive) (tab-select 1)))
(keymap-set evil-normal-state-map "M-2" (lambda() (interactive) (tab-select 2)))
(keymap-set evil-normal-state-map "M-3" (lambda() (interactive) (tab-select 3)))
(keymap-set evil-normal-state-map "M-4" (lambda() (interactive) (tab-select 4)))
(keymap-set evil-normal-state-map "M-5" (lambda() (interactive) (tab-select 5)))
(keymap-set evil-normal-state-map "M-6" (lambda() (interactive) (tab-select 6)))
(keymap-set evil-normal-state-map "M-7" (lambda() (interactive) (tab-select 7)))
(keymap-set evil-normal-state-map "M-8" (lambda() (interactive) (tab-select 8)))
(keymap-set evil-normal-state-map "M-9" (lambda() (interactive) (tab-select 9)))
(keymap-set evil-normal-state-map "M-0" (lambda() (interactive) (tab-select 0)))

;; Windows
(keymap-set evil-normal-state-map "C-w n" 'evil-window-vnew)

;; Find File
(define-key evil-normal-state-map (kbd "C-q") 'project-find-file)
(define-key evil-normal-state-map (kbd "SPC f e") 'dired)

;; Config
(keymap-set evil-normal-state-map "SPC f c" (lambda() (interactive) (find-file "~/.config/emacs/init.el")))

;; Buffers
(keymap-set evil-normal-state-map "SPC b b" 'ibuffer)
(keymap-set evil-normal-state-map "SPC b s" 'switch-to-buffer)
(keymap-set evil-normal-state-map "SPC b n" 'next-buffer)
(keymap-set evil-normal-state-map "SPC b p" 'previous-buffer)
(keymap-set evil-normal-state-map "SPC b d" 'kill-this-buffer)

;; Help
(keymap-set evil-normal-state-map "SPC h f" 'describe-function)
(keymap-set evil-normal-state-map "SPC h v" 'describe-variable)
(keymap-set evil-normal-state-map "SPC h k" 'describe-key)

;; DirEd Keys
(evil-define-key 'normal dired-mode-map (kbd "n f") 'dired-create-empty-file)
(evil-define-key 'normal dired-mode-map (kbd "n d") 'dired-create-directory)

;; Text Scale
(keymap-set evil-normal-state-map "C-0" 'text-scale-adjust)
(keymap-set evil-normal-state-map "C-=" 'text-scale-increase)
(keymap-set evil-normal-state-map "C--" 'text-scale-decrease)

;; Utils ############################################################################################

;; Close all windows and tabs but the focused one
(define-key evil-normal-state-map (kbd "SPC w o")
            (lambda()
              (interactive)
              (delete-other-windows)
              (tab-bar-close-other-tabs)))

;; Easier to press: move focused window to a new tab
(define-key evil-normal-state-map (kbd "SPC w t") (kbd "C-w T"))

;; Eval
(define-key evil-normal-state-map (kbd "SPC b e") 'eval-buffer)
(define-key evil-normal-state-map (kbd "SPC e e") 'eval-last-sexp)

;; Better use of Cursor Jump Keys
(define-key evil-normal-state-map (kbd "H") 'evil-first-non-blank)
(define-key evil-normal-state-map (kbd "L") 'evil-end-of-line)
(define-key evil-normal-state-map (kbd "M") 'evil-jump-item)

;; Replace / Query-Replace
(keymap-set evil-normal-state-map "SPC s s" 'replace-regexp)
(keymap-set evil-visual-state-map "SPC s s" 'replace-regexp)
(keymap-set evil-normal-state-map "SPC s q" 'query-replace-regexp)
(keymap-set evil-visual-state-map "SPC s q" 'query-replace-regexp)

;; Evil - Must Have #############################################################

;; ;; Makes evil keys consistent in more places than just evil mode default
(unless (package-installed-p 'evil-collection)
  (package-install 'evil-collection))

(with-eval-after-load 'evil
  (require 'evil-collection)
  (evil-collection-init)
  (message "evil-collection loaded"))

;; Evil Commentary gcc gc<object>
(unless (package-installed-p 'evil-commentary)
  (package-install 'evil-commentary))

(with-eval-after-load 'evil
  (require 'evil-commentary)
  (evil-commentary-mode t))

;; Evil Surround (emulate tim pope)
(unless (package-installed-p 'evil-surrond)
  (package-install 'evil-surround))

(with-eval-after-load 'evil
  (require 'evil-surround)
  (global-evil-surround-mode t))

;; Evil-numbers
(unless (package-installed-p 'evil-numbers)
  (package-install 'evil-numbers))

(with-eval-after-load 'evil
  (require 'evil-numbers))

(keymap-set evil-normal-state-map "C-x" 'evil-numbers/dec-at-pt)
(keymap-set evil-visual-state-map "C-x" 'evil-numbers/dec-at-pt)
(keymap-set evil-normal-state-map "C-a" 'evil-numbers/inc-at-pt)
(keymap-set evil-visual-state-map "C-a" 'evil-numbers/inc-at-pt)

(keymap-set evil-visual-state-map "g C-x" 'evil-numbers/dec-at-pt-incremental)
(keymap-set evil-visual-state-map "g C-a" 'evil-numbers/inc-at-pt-incremental)

;; Evil Lion Align stuff by stuff gl= gL, gl; gL(
(unless (package-installed-p 'evil-lion)
  (package-install 'evil-lion))

(with-eval-after-load 'evil
  (require 'evil-lion)
  (evil-lion-mode t))

;; Evil Google (visual hint)
(unless (package-installed-p 'evil-goggles)
  (package-install 'evil-goggles))

(with-eval-after-load 'evil
  (require 'evil-goggles)
  (evil-goggles-mode))

(custom-set-faces
 '(evil-goggles-default-face
   ((t (:background "#f00" :foreground "#fff")))))
