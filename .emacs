(require 'cl)

(defvar emacs-root "~/")
(cl-labels ((add-path (path)
                      (add-to-list 'load-path
                                   (concat emacs-root path))))
  (add-path "emacs")
  (add-path "emacs/arc"))

(dolist (lib '("custom" "funcs" "keys" "arc-autoloads"))
  (load lib))

(when (not (display-graphic-p))
  (menu-bar-mode -1))

(when (display-graphic-p)
  (set-face-attribute 'default nil
                      :family "DejaVu Sans Mono")
  (add-hook 'after-init-hook 'pretty-lambda-for-modes))

(load-theme 'wombat t)

(add-hook 'after-init-hook 'global-company-mode)
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-anaconda))

(defun anaconda-mode-python ()
  "Detect python executable."
  "/usr/local/bin/python3")


(add-hook 'after-init-hook
          (lambda ()
            (require 'helm-config)
            (global-set-key (kbd "C-c h") 'helm-command-prefix)
            (global-unset-key (kbd "C-x c"))
            (global-set-key (kbd "C-x b") 'helm-mini)
            (global-set-key (kbd "M-x") 'helm-M-x)
            (global-set-key (kbd "C-x C-m") 'helm-M-x)
            (global-set-key (kbd "C-x C-b") 'helm-buffers-list)
            (global-set-key (kbd "C-x C-f") 'helm-find-files)
            (global-set-key (kbd "M-y") 'helm-show-kill-ring)
            (helm-mode 1)))

(put 'set-goal-column 'disabled nil)

;; (ido-mode t)

(defalias 'yes-or-no-p 'y-or-n-p)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(add-hook 'after-save-hook 'recompile-elisp)

(add-hook 'tabulated-list-mode-hook 'hl-line-mode)

(add-hook 'inferior-python-mode-hook 'turn-off-echo)

(global-hi-lock-mode 1)
(delete "hi-black-b" hi-lock-face-defaults)
(delete "hi-black-hb" hi-lock-face-defaults)

(when (display-graphic-p)
  (add-hook 'inf-ruby-mode-hook 'turn-off-echo))

(setq inferior-lisp-program "sbcl")
(add-hook 'lisp-mode-hook
          (lambda ()
            (slime-mode t)
            (set (make-local-variable 'lisp-indent-function)
                 'common-lisp-indent-function)))

(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

(add-to-list 'auto-mode-alist '("\\.jl\\'" . julia-mode))

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
             scheme-mode-hook
             geiser-repl-mode-hook)
           'enable-paredit-mode)

(eshell)
