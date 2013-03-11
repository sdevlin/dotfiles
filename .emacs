(require 'cl)

(defvar emacs-root "~/")
(labels ((add-path (path)
                   (add-to-list 'load-path
                                (concat emacs-root path))))
  (add-path "emacs")
  (add-path "emacs/arc"))

(dolist (lib '("custom" "funcs" "keys" "arc-autoloads"))
  (load lib))

(when (display-graphic-p)
  (set-face-attribute 'default nil
                      :family "DejaVu Sans Mono")
  (add-hook 'after-init-hook 'set-color-theme)
  (add-hook 'after-init-hook 'pretty-lambda-for-modes))

(put 'set-goal-column 'disabled nil)

(ido-mode t)

(defalias 'yes-or-no-p 'y-or-n-p)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(add-hook 'after-save-hook 'recompile-elisp)

(add-hook 'tabulated-list-mode-hook 'hl-line-mode)

(eval-after-load "hi-lock"
  '(add-to-list 'hi-lock-face-defaults "hi-red"))

(add-hook 'inferior-python-mode-hook 'turn-off-echo)

(when (display-graphic-p)
  (add-hook 'inf-ruby-mode-hook 'turn-off-echo))

(add-hook 'lisp-mode-hook
          (lambda ()
            (set (make-local-variable 'lisp-indent-function)
                 'common-lisp-indent-function)))

(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

(add-to-list 'auto-mode-alist '("\\.arc$" . arc-mode))

(add-hook* '(lisp-mode-hook
             emacs-lisp-mode-hook
             scheme-mode-hook
             c-mode-common-hook
             ruby-mode-hook)
           (lambda ()
             (local-set-key (kbd "RET") 'newline-and-indent)))

(autoload 'enable-paredit-mode "paredit")
(add-hook* '(lisp-mode-hook
             emacs-lisp-mode-hook
             scheme-mode-hook)
           'enable-paredit-mode)

(eshell)
