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

;;; (setq tree-sitter-load-path '("/home/pedro/.config/emacs/elpa/tree-sitter-langs-20240212.1005/bin/"))

;; Tree Sitter Auto Installer
(unless (package-installed-p 'treesit-auto)
  (package-install 'treesit-auto))

(with-eval-after-load 'tree-sitter
  (require 'treesit-auto))

(setq treesit-auto-install 'prompt)

(treesit-auto-add-to-auto-mode-alist 'all)

(global-treesit-auto-mode)

;; ELisp ########################################################################
(setq-default lisp-indent-offset 2)

(add-hook 'emacs-lisp-mode-hook
  (lambda () (setq evil-shift-width lisp-indent-offset)))

;; HTML #########################################################################
(setq-default sgml-basic-offset 2)

(add-hook 'sgml-mode-hook
  (lambda () (setq evil-shift-width sgml-basic-offset)))

;; (evil-define-key 'normal html-mode-map (kbd "M-b") 'sgml-skip-tag-backward)
;; (evil-define-key 'normal html-mode-map (kbd "M-f") 'sgml-skip-tag-forward)
;; (evil-define-key 'normal html-mode-map (kbd "C-c p") 'sgml-skip-tag-backward)
;; (evil-define-key 'normal html-mode-map (kbd "C-c n") 'sgml-skip-tag-forward)

;; Javascript ###################################################################
(add-to-list 'auto-mode-alist '("\\.cjs\\'" . js-mode))
(add-to-list 'auto-mode-alist '("\\.mjs\\'" . js-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . js-mode))

(setq js-indent-level 4)
(setq js-switch-indent-offset 4)

(unless (package-installed-p 'prettier-js)
  (package-install 'prettier-js))

(require 'prettier-js)

;; Typescript ###################################################################
(setq-default typescript-ts-mode-indent-offset 4)
;;; (add-to-list 'auto-mode-alist '("\\.jsx\\'" . rjsx-mode))
;;; (add-to-list 'auto-mode-alist '("\\.tsx\\'" . typescript-tsx-mode))

;; JSON ########################################################################
(setq-default json-ts-mode-indent-offset 4)

;; React #######################################################################
(add-to-list 'auto-mode-alist '("\\(\\.js[mx]\\|\\.har\\)\\'" . js-jsx-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . js-jsx-mode))

;(setq js-jsx-detect-syntax nil)
;; (setq auto-mode-alist
;;       (delete '("\\(\\.js[mx]\\|\\.har\\)\\'" . js-ts-mode) auto-mode-alist))

;; (unless (package-installed-p 'rjsx-mode)
;;   (package-install 'rjsx-mode))

;; (with-eval-after-load 'rjsx-mode
;;   (define-key rjsx-mode-map "<" nil)
;;   (define-key rjsx-mode-map (kbd "C-d") nil)
;;   (define-key rjsx-mode-map ">" nil))

;; (setq js2-strict-missing-semi-warning nil)

;; C/C++ #######################################################################
;(setq-default c-basic-offset 4)
(setq c-basic-offset 4)
(setq c-hanging-braces-alist '(substatement-open . (after)))

; Set offset for opening brace of substatement (e.g., function definition) to 0
;(setq c-offsets-alist '((substatement-open . 0)))

;; CSharp #######################################################################

;; (setq web-mode-markup-indent-offset 2)
;; (setq web-mode-code-indent-offset 2)

(add-to-list 'auto-mode-alist '("\\.csproj\\'" . xml-mode))
(add-to-list 'auto-mode-alist '("\\.cshtml\\'" . sgml-mode))

;; Yaml ########################################################################

(unless (package-installed-p 'yaml-mode)
  (package-install 'yaml-mode))

(add-to-list 'auto-mode-alist '("\\.yaml\\'" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))

;; Ocaml #######################################################################

(setq ocaml-ts-mode-indent-offset 2)

;; From ocaml website (activate later if needed)
(add-to-list 'load-path "/home/pedro/.opam/default/share/emacs/site-lisp")
(require 'ocp-indent)

(unless (package-installed-p 'tuareg)
  (package-install 'tuareg))

(add-to-list 'auto-mode-alist '("\\.ml\\'" . tuareg-mode))
(add-to-list 'auto-mode-alist '("\\.mli\\'" . tuareg-mode))

(add-hook 'tuareg-mode-hook
  (lambda () (setq evil-shift-width tuareg-default-indent)))

;; (add-to-list 'auto-mode-alist '("\\.ml\\'" . ocaml-ts-mode))
;; (add-to-list 'auto-mode-alist '("\\.mli\\'" . ocamli-ts-mode))

;; (unless (package-installed-p 'ocamlformat)
;;   (package-install 'ocamlformat))

;; (require 'ocamlformat)


;; Lua ##########################################################################

(unless (package-installed-p 'lua-mode)
  (package-install 'lua-mode))
