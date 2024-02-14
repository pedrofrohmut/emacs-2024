;; Language Support #####################################################################

;; Tree Sitter
(unless (package-installed-p 'tree-sitter)
  (package-install 'tree-sitter))
(require 'tree-sitter)

;; Tree Sitter Langs
(unless (package-installed-p 'tree-sitter-langs)
  (package-install 'tree-sitter-langs))
(with-eval-after-load 'tree-sitter
  (require 'tree-sitter-langs))

(global-tree-sitter-mode)

(add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)

;; (setq tree-sitter-load-path '("/home/pedro/.config/emacs/elpa/tree-sitter-langs-20240212.1005/bin/"))

;; (tree-sitter-require 'javascript)
;; (tree-sitter-require 'typescript)
;; (tree-sitter-require 'tsx)

;; (add-to-list 'auto-mode-alist '("\\.jsx\\'" . rjsx-mode))
;; (add-to-list 'auto-mode-alist '("\\.tsx\\'" . typescript-tsx-mode))

(unless (package-installed-p 'treesit-auto)
  (package-install 'treesit-auto))
(require 'treesit-auto)

(setq treesit-auto-install 'prompt)

(treesit-auto-add-to-auto-mode-alist 'all)

(global-treesit-auto-mode)

;; Typescript
(setq-default typescript-ts-mode-indent-offset 4)

;; JSON
(setq-default json-ts-mode-indent-offset 4)

;; C/C++
(setq-default c-basic-offset 4)
