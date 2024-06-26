;; Download Evil
(unless (package-installed-p 'evil)
  (package-install 'evil))

;; Evil #########################################################################

;; Behaviour
(setq evil-want-C-u-scroll t)
(setq evil-want-C-u-delete t)
(setq evil-want-C-i-jump t)
(setq evil-want-Y-yank-to-eol t)
;(setq evil-undo-system 'undo-redo)
(setq evil-undo-system 'undo-tree)
(setq evil-want-keybinding nil) ; Evil collection asks for it
(setq evil-kill-on-visual-paste t) ;; when you replace in visual mode dont change the register
(setq evil-echo-state nil) ;; Dont need this

;; Windows
(setq evil-vsplit-window-right t)
(setq evil-split-window-below t)

;; Cursor movement
(setq evil-move-beyond-eol nil)
(setq evil-cross-lines nil)

;; Indentation (setting different shift-width in ./languages.el)
(setq evil-auto-indent t)
(setq evil-shift-width 4)
(setq evil-indent-convert-tabs t)

;; Cursor
(setq evil-normal-state-cursor   '("yellow" box)
      evil-insert-state-cursor   '("white"  bar)
      evil-visual-state-cursor   '("red"    box)
      evil-replace-state-cursor  '("red"    box)
      evil-operator-state-cursor '("white"  box))

(require 'evil)
(add-hook 'after-init-hook 'evil-mode)

;; Evil Keymaps ###############################################################################

;; Leader Key Mapping
(evil-global-set-key 'normal (kbd "SPC") nil)

;; Unsets
(keymap-unset evil-normal-state-map "s")
(keymap-unset evil-normal-state-map "S")
(keymap-unset evil-normal-state-map "q")

;; Move Up/down on wrap text (more repeatable than g j and g k)
;(keymap-set evil-normal-state-map "M-j" 'evil-next-visual-line)
;(keymap-set evil-normal-state-map "M-k" 'evil-previous-visual-line)

;; Remap Visual Paste (There is a bug that using p on visual mode will replace text with the select text.
;; That means no change. With this mapping I replace visual selection with the last copied register as
;; expected in vim)
(keymap-set evil-visual-state-map "p" (lambda() (interactive) (evil-paste-from-register ?0)))

;; Tab indents
(keymap-set evil-normal-state-map "SPC SPC" 'evil-indent)
(keymap-set evil-visual-state-map "SPC SPC" 'evil-indent)

;; macro in a key you just wont type for accident
(keymap-set evil-normal-state-map "M-q" 'evil-record-macro)

;; Redo
(keymap-set evil-normal-state-map "U" 'evil-redo)

;; Easy insert linebreak in normal mode
(define-key evil-normal-state-map (kbd "RET") (kbd "i RET <escape>"))

;; Ctrl-h as backspace
(keymap-set evil-insert-state-map "C-h" 'evil-delete-backward-char-and-join)

;; Ctrl-l as delete
(keymap-set evil-insert-state-map "C-l" 'evil-delete-char)

;; Scrolling
(keymap-set evil-normal-state-map "M-j" (lambda () (interactive) (evil-scroll-line-down 12)))
(keymap-set evil-normal-state-map "M-k" (lambda () (interactive) (evil-scroll-line-up 12)))
(keymap-set evil-normal-state-map "M-l" (lambda () (interactive) (evil-scroll-column-right 4)))
(keymap-set evil-normal-state-map "M-h" (lambda () (interactive) (evil-scroll-column-left 4)))

;; Navigation
;;(keymap-set evil-normal-state-map "M-m" 'tab-recent)

;; Faster Select
(keymap-set evil-visual-state-map "v" 'evil-jump-item)

;; Change Tab normal mode
(keymap-set evil-normal-state-map "C-n" 'tab-next)
(keymap-set evil-normal-state-map "C-p" 'tab-previous)
;; (keymap-set evil-normal-state-map "C-l" 'tab-next)
;; (keymap-set evil-normal-state-map "C-h" 'tab-previous)

;; Tabs
(keymap-set evil-normal-state-map "SPC t c" 'tab-new)
(keymap-set evil-normal-state-map "SPC t q" 'tab-close)
;; (keymap-set evil-normal-state-map "SPC t o" 'tab-close-other)
(keymap-set evil-normal-state-map "SPC t u" 'tab-undo)
(keymap-set evil-normal-state-map "SPC t l" 'tab-move)
(keymap-set evil-normal-state-map "SPC t h" (lambda() (interactive) (tab-move -1)))

(keymap-set evil-normal-state-map "SPC t o" 'tab-bar-close-other-tabs)

;; Tabs by Number
;;(keymap-set evil-normal-state-map "M-1" (lambda() (interactive) (tab-select 1)))
;;(keymap-set evil-normal-state-map "M-2" (lambda() (interactive) (tab-select 2)))
;;(keymap-set evil-normal-state-map "M-3" (lambda() (interactive) (tab-select 3)))
;;(keymap-set evil-normal-state-map "M-4" (lambda() (interactive) (tab-select 4)))
;;(keymap-set evil-normal-state-map "M-5" (lambda() (interactive) (tab-select 5)))
;;(keymap-set evil-normal-state-map "M-6" (lambda() (interactive) (tab-select 6)))
;;(keymap-set evil-normal-state-map "M-7" (lambda() (interactive) (tab-select 7)))
;;(keymap-set evil-normal-state-map "M-8" (lambda() (interactive) (tab-select 8)))
;;(keymap-set evil-normal-state-map "M-9" (lambda() (interactive) (tab-select 9)))
;;(keymap-set evil-normal-state-map "M-0" (lambda() (interactive) (tab-select 0)))

;; Tabs by Number (with g)
(keymap-set evil-normal-state-map "g 1" (lambda() (interactive) (tab-select 1)))
(keymap-set evil-normal-state-map "g 2" (lambda() (interactive) (tab-select 2)))
(keymap-set evil-normal-state-map "g 3" (lambda() (interactive) (tab-select 3)))
(keymap-set evil-normal-state-map "g 4" (lambda() (interactive) (tab-select 4)))
(keymap-set evil-normal-state-map "g 5" (lambda() (interactive) (tab-select 5)))
(keymap-set evil-normal-state-map "g 6" (lambda() (interactive) (tab-select 6)))
(keymap-set evil-normal-state-map "g 7" (lambda() (interactive) (tab-select 7)))
(keymap-set evil-normal-state-map "g 8" (lambda() (interactive) (tab-select 8)))
(keymap-set evil-normal-state-map "g 9" (lambda() (interactive) (tab-select 9)))
(keymap-set evil-normal-state-map "g 0" (lambda() (interactive) (tab-select 0)))

;; Windows
(keymap-set evil-normal-state-map "C-w n" 'evil-window-vnew)
(keymap-set evil-normal-state-map "M-<left>"  'evil-window-decrease-width)
(keymap-set evil-normal-state-map "M-<right>" 'evil-window-increase-width)
(keymap-set evil-normal-state-map "M-<up>"    'evil-window-increase-height)
(keymap-set evil-normal-state-map "M-<down>"  'evil-window-decrease-height)
(keymap-set evil-normal-state-map "SPC w h" 'evil-window-move-far-left)
(keymap-set evil-normal-state-map "SPC w j" 'evil-window-move-very-bottom)
(keymap-set evil-normal-state-map "SPC w k" 'evil-window-move-very-top)
(keymap-set evil-normal-state-map "SPC w l" 'evil-window-move-far-right)

;; Windows focus
(keymap-set evil-normal-state-map "C-h" 'evil-window-left)
(keymap-set evil-normal-state-map "C-j" 'evil-window-down)
(keymap-set evil-normal-state-map "C-k" 'evil-window-up)
(keymap-set evil-normal-state-map "C-l" 'evil-window-right)

(keymap-set evil-normal-state-map "M-o"
  (lambda () (interactive) (delete-other-windows) (neotree-hide)))

;; Utils ############################################################################################

;; Buffers
(keymap-set evil-normal-state-map "SPC b b" 'ibuffer)
(keymap-set evil-normal-state-map "SPC b s" 'project-switch-to-buffer)
(keymap-set evil-normal-state-map "SPC b l" 'project-list-buffers)
(keymap-set evil-normal-state-map "SPC b n" 'next-buffer)
(keymap-set evil-normal-state-map "SPC b p" 'previous-buffer)
(keymap-set evil-normal-state-map "SPC b d" 'kill-this-buffer)

(setq project-ignore-buffer-conditions
  '("*Messages*" "*scratch*" "*Ibuffer*" (derived-mode . dired-mode) (derived-mode . helpful-mode)))

(keymap-set evil-normal-state-map "C-b" 'project-switch-to-buffer)

;; (keymap-set evil-normal-state-map "C-n" 'next-buffer)
;; (keymap-set evil-normal-state-map "C-p" 'previous-buffer)

(keymap-set evil-normal-state-map "SPC b u"
  (lambda () (interactive) (set-buffer-file-coding-system 'unix)))

;; Restart Emacs
;(keymap-set evil-normal-state-map "SPC h r r" 'restart-emacs)

;; Toggle wrap lines
(keymap-set evil-normal-state-map "SPC h l" 'global-visual-line-mode)
;; Toggle whitespace
(keymap-set evil-normal-state-map "SPC h w" 'global-whitespace-mode)
;; Toggle Tabbar
(keymap-set evil-normal-state-map "SPC h t" 'tab-bar-mode)

;; Set wombat theme (in case of error)
;(keymap-set evil-normal-state-map "SPC h t" (lambda() (interactive) (load-theme 'wombat t)))

;; Text Scale
(keymap-set evil-normal-state-map "C-0" 'text-scale-adjust)
(keymap-set evil-normal-state-map "C-=" 'text-scale-increase)
(keymap-set evil-normal-state-map "C--" 'text-scale-decrease)

(defun my/find-file-home ()
  (interactive)
  (let ((default-directory (expand-file-name "~/")))
    (call-interactively #'find-file)))

;; Find my home
(keymap-set evil-normal-state-map "SPC f h" #'my/find-file-home)

;; TODO accept optional argument and have 81 as default
(defun my/fill-paragraph ()
  "Fill paragraph with fill-column set to 100. Just to have a different and custom
paragraph size that does not care of default fill-column value"
  (interactive)
  (let* ((fill-column 81))
    (call-interactively #'evil-fill-and-move)))

(keymap-set evil-normal-state-map "g q" #'my/fill-paragraph)

;; Config (find my config)
(keymap-set evil-normal-state-map "SPC f m c"
	    (lambda() (interactive) (find-file "~/.config/emacs/init.el")))

;; Dotfiles
(keymap-set evil-normal-state-map "SPC f m d"
	    (lambda() (interactive) (find-file "~/dotfiles/")))

;; Shell Command
(keymap-set evil-normal-state-map "M-;" 'shell-command)

;; Close all windows and tabs but the focused one
(keymap-set evil-normal-state-map "SPC w o"
            (lambda()
              (interactive)
              (delete-other-windows)
              (tab-bar-close-other-tabs)))

;; Easier to press: move focused window to a new tab
(define-key evil-normal-state-map (kbd "SPC w t") (kbd "C-w T"))

;; Eval
(keymap-set evil-normal-state-map "SPC h b e" 'eval-buffer)
(keymap-set evil-normal-state-map "SPC h e e" 'eval-last-sexp)

;; Better use of Cursor Jump Keys
(keymap-set evil-normal-state-map "H" 'evil-first-non-blank)
(keymap-set evil-normal-state-map "L" 'evil-end-of-line)
;;(keymap-set evil-normal-state-map "M" 'evil-jump-item)
(keymap-set evil-normal-state-map "M" 'evilmi-jump-items)

;; Better use of Cursor Jump Keys (Visual Mode)
(keymap-set evil-visual-state-map "H" 'evil-first-non-blank)
(keymap-set evil-visual-state-map "L" 'evil-end-of-line)
(keymap-set evil-visual-state-map "M" 'evil-jump-item)
;;(keymap-set evil-normal-state-map "M" 'evilmi-jump-items)

;; Replace / Query-Replace
(keymap-set evil-normal-state-map "SPC s s" 'replace-regexp)
(keymap-set evil-visual-state-map "SPC s s" 'replace-regexp)
(keymap-set evil-normal-state-map "SPC s q" 'query-replace-regexp)
(keymap-set evil-visual-state-map "SPC s q" 'query-replace-regexp)

;; Format on visual
;; (keymap-set evil-normal-state-map "SPC SPC" 'evil-indent)
;; (keymap-set evil-visual-state-map "SPC SPC" 'evil-indent)

;; Move on insert mode for japanese typing (Vim users lol)
;;(keymap-set evil-insert-state-map "M-h" 'left-char)
;;(keymap-set evil-insert-state-map "M-j" 'next-line)
;;(keymap-set evil-insert-state-map "M-k" 'previous-line)
;;(keymap-set evil-insert-state-map "M-l" 'right-char)

;; Extra Evil Packages #############################################################

;; Makes evil keys consistent in more places than just evil mode default
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
(unless (package-installed-p 'evil-surround)
  (package-install 'evil-surround))

(keymap-set evil-visual-state-map "s" 'evil-surround-region)

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

(set-face-attribute 'evil-goggles-default-face nil
                    :foreground "#fff"
                    :background "#f00"
                    :inherit nil)

;; Matchit (better %. works with tags)
(unless (package-installed-p 'evil-matchit)
  (package-install 'evil-matchit))

;; (with-eval-after-load 'evil
;;   (require 'evil-matchit)
;;   (global-evil-matchit-mode t))
