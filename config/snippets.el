;; Emmet ########################################################################

(unless (package-installed-p 'emmet-mode)
  (package-install 'emmet-mode))

(setq emmet-move-cursor-between-quotes t)
(setq emmet-self-closing-tag-style " /")
(require 'emmet-mode)

;; TODO: Review emmet docs for JSX Support
;;(add-to-list 'emmet-jsx-major-modes 'your-jsx-major-mode)

;; Unsetting keys
(keymap-unset emmet-mode-keymap "C-j")
(keymap-unset emmet-mode-keymap "C-M-<left>")
(keymap-unset emmet-mode-keymap "C-M-<right>")
(keymap-unset emmet-mode-keymap "C-<return>")
(keymap-unset emmet-mode-keymap "C-c C-c w")

;; Setting keys
(keymap-set evil-insert-state-map "C-j" 'emmet-expand-line)
(keymap-set evil-visual-state-map "C-j" 'emmet-wrap-with-markup)

(add-hook 'emmet-mode-hook (lambda () (setq emmet-indent-after-insert nil)))
(add-hook 'emmet-mode-hook (lambda () (setq emmet-indentation 2))) ;; indent 2 spaces.

;; Hooks
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.
