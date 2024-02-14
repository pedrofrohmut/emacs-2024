;; Navigation #######################################################################################

(unless (package-installed-p 'ace-jump-mode)
  (package-install 'ace-jump-mode))

(keymap-set evil-normal-state-map "s" 'evil-ace-jump-word-mode)

(eval-after-load "ace-jump-mode"
  '(ace-jump-mode-enable-mark-sync))
(keymap-set evil-normal-state-map "S" 'ace-jump-mode-pop-mark)
