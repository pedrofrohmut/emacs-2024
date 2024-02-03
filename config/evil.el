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

;; Evil Unbind ##################################################################
(define-key evil-normal-state-map (kbd "C-p") nil)
(define-key evil-normal-state-map (kbd "C-n") nil)
(define-key evil-normal-state-map (kbd "<normal-state> C-b") nil)
(define-key evil-normal-state-map (kbd "<normal-state> C-f") nil)
(define-key evil-normal-state-map (kbd "s")   nil)
(define-key evil-normal-state-map (kbd "S")   nil)

;; Redo
(define-key evil-normal-state-map (kbd "U") 'evil-redo)

;; Easy insert linebreak in normal mode
(define-key evil-normal-state-map (kbd "RET") (kbd "i RET <escape>"))

;; Ctrl-h as backspace
(define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)

;; Ctrl-l as delete
(define-key evil-insert-state-map (kbd "C-l") 'evil-delete-char)

;; Scroll down
(define-key evil-normal-state-map (kbd "C-j")
  (lambda ()
    (interactive)
    (evil-scroll-line-down 12)))

;; Scroll up
(define-key evil-normal-state-map (kbd "C-k")
  (lambda ()
    (interactive)
    (evil-scroll-line-up 12)))

;; Shell Command
(define-key evil-normal-state-map (kbd "M-1") 'shell-command)

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

;; Find File
(define-key evil-normal-state-map (kbd "C-q") 'project-find-file)
(define-key evil-normal-state-map (kbd "SPC f e") 'dired)

;; Buffers
(define-key evil-normal-state-map (kbd "SPC b e") 'eval-buffer)
(define-key evil-normal-state-map (kbd "SPC b b") 'ibuffer)

;; DirEd Keys
(evil-define-key 'normal dired-mode-map (kbd "n f") 'dired-create-empty-file)
(evil-define-key 'normal dired-mode-map (kbd "n d") 'dired-create-directory)

;; Utils ########################################################################

;; Close all windows and tabs but the focused one
(define-key evil-normal-state-map (kbd "SPC w o")
            (lambda()
              (interactive)
              (delete-other-windows)
              (tab-bar-close-other-tabs)))

;; Easier to press: move focused window to a new tab
(define-key evil-normal-state-map (kbd "SPC w t") (kbd "C-w T"))

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

;; Evil Increase hovered number
(define-key evil-normal-state-map (kbd "C-x") 'evil-numbers/dec-at-pt)
;; Evil Decrease hovered number
(define-key evil-normal-state-map (kbd "C-a") 'evil-numbers/inc-at-pt)

;; Evil Lion Align stuff by stuff gl= gL, gl; gL(
(unless (package-installed-p 'evil-lion)
  (package-install 'evil-lion))
(with-eval-after-load 'evil
  (require 'evil-lion)
  (evil-lion-mode t))
