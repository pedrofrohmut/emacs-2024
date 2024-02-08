;; Markdown ########################################################################################

;; Github: https://github.com/ancane/markdown-preview-mode
(unless (package-installed-p 'markdown-mode)
  (package-install 'markdown-mode))

;; Run
;; - markdown-preview-mode - start mode and open preview window.
;; - markdown-preview-open-browser - open preview window for current buffer.
;; - markdown-preview-cleanup - cleanup running processes (close websocket and http servers).
