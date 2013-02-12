(require 'cl)

(add-to-list 'load-path "~/emacs")

(when (display-graphic-p)
  (set-face-attribute 'default nil
                      :family "DejaVu Sans Mono")
  (color-theme-solarized 'dark))

(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-a" 'mark-whole-buffer)
(global-set-key "\C-x\C-b" 'buffer-menu)

(put 'set-goal-column 'disabled nil)

(setq custom-file "~/.emacs-custom.el")
(load custom-file)

(ido-mode t)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(require 'hi-lock)
(add-to-list 'hi-lock-face-defaults "hi-red")

(defun turn-off-echo ()
  (setq comint-process-echoes t))

(add-hook 'inferior-python-mode-hook 'turn-off-echo)

(when (display-graphic-p)
  (add-hook 'inf-ruby-mode-hook 'turn-off-echo))

(add-hook 'lisp-mode-hook
          #'(lambda ()
              (set (make-local-variable 'lisp-indent-function)
                   'common-lisp-indent-function)))

(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation-mode)

(defun add-hooks (hooks function &optional append local)
  (dolist (hook hooks)
    (add-hook hook function append local)))

(add-hooks '(lisp-mode-hook
             emacs-lisp-mode-hook
             scheme-mode-hook
             c-mode-common-hook
             ruby-mode-hook)
           #'(lambda ()
               (local-set-key (kbd "RET")
                              'reindent-then-newline-and-indent)))

(autoload 'enable-paredit-mode "paredit")
(add-hooks '(lisp-mode-hook
             emacs-lisp-mode-hook
             scheme-mode-hook)
           'enable-paredit-mode)

(defun eshell/emacs (&rest args)
  "Open a file in emacs. Some habits die hard."
  (if (null args)
      (bury-buffer)
    (mapc #'find-file (mapcar #'expand-file-name
                              (eshell-flatten-list (reverse args)))))
  nil)

(eshell)
