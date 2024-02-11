
;; Copy/Paste  ######################################################################################

(unless (package-installed-p 'simpleclip)
  (package-install 'simpleclip))

(require 'simpleclip)

(simpleclip-mode t)

;; Copy And Paste do not use System Clipboard (nil is the default in VIM)
(setq select-enable-clipboard t)
(setq select-enable-primary nil)

;; Clipboard Copy/Paste
(define-key evil-normal-state-map (kbd "SPC s y") 'simpleclip-copy)
(define-key evil-normal-state-map (kbd "SPC s p") 'simpleclip-paste)
(define-key evil-normal-state-map (kbd "SPC s d") 'simpleclip-cut)
