;; Snippets ####################################################################

(unless (package-installed-p 'yasnippet)
  (package-install 'yasnippet))

(require 'yasnippet)

(yas-global-mode t)

(keymap-unset yas-minor-mode-map "TAB")

(keymap-set evil-insert-state-map "C-k" 'yas-expand)

;; TODO: add snippets packages
