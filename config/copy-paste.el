;; Copy/Paste  ##################################################################

;; Old behaviour of emacs (prior to 24)
(setq select-enable-clipboard nil) ;; Prevent kill and yank commands from accessing the clipboard,
(setq select-enable-primary t)
(setq mouse-drag-copy-region t)

;; Emacs doesnt transferm kill-ring to system clipboard
(setq x-select-enable-clipboard-manager nil)

;; XClip ########################################################################

(unless (package-installed-p 'xclip)
  (package-install 'xclip))

(xclip-mode t)

(defun my/clipboard-replace-region ()
  (interactive)
  (kill-region evil-visual-beginning evil-visual-end)
  (clipboard-yank))

;; Clipboard Copy/Paste (Normal)
(define-key evil-normal-state-map (kbd "SPC s p") 'clipboard-yank)

;; Clipboard Copy/Paste (Visual)
(define-key evil-visual-state-map (kbd "SPC s y") 'clipboard-kill-ring-save)
(define-key evil-visual-state-map (kbd "SPC s d") 'clipboard-kill-region)
(define-key evil-visual-state-map (kbd "SPC s p") #'my/clipboard-replace-region)
