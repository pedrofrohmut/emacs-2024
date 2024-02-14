(unless (package-installed-p 'eglot)
  (package-install 'eglot))

(require 'eglot)

;; (add-to-list 'eglot-server-programs '(css-mode . ("css-languageserver" "--stdio")))
;; (add-to-list 'eglot-server-programs '(html-mode . ("html-languageserver" "--stdio")))

(add-to-list 'eglot-server-programs '(js-mode . '(typescript-language-server)))
