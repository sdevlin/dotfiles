(require 'package)
(package-initialize)

(require 'cl)

(add-to-list 'load-path "~/elisp")

(setq
 inhibit-startup-message t
 inhibit-startup-echo-area-message t)

(if (fboundp 'scroll-bar-mode)
    (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode)
    (tool-bar-mode -1))
(menu-bar-mode -1)
(blink-cursor-mode -1)
(column-number-mode t)

(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward)

(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-a" 'mark-whole-buffer)
(global-set-key "\C-x\C-b" 'buffer-menu)

(put 'set-goal-column 'disabled nil)

(setq-default indent-tabs-mode nil)
(setq require-final-newline t)

(setq
 backup-directory-alist `((".*" . ,temporary-file-directory))
 auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

(setq package-archives
      '(("marmalade" . "http://marmalade-repo.org/packages/")
        ("ELPA" . "http://tromey.com/elpa/")
        ("gnu" . "http://elpa.gnu.org/packages/")))

(ido-mode t)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(setq holiday-other-holidays
      '((holiday-fixed 2 23 "Birth of the Case")
        (holiday-fixed 3 25 "Mom's Birthday")
        (holiday-fixed 2 24 "Dad's Birthday")
        (holiday-fixed 7 19 "Maire's Birthday")
        (holiday-fixed 8 18 "Nora's Birthday")
        (holiday-fixed 11 20 "My Birthday")))
(add-hook 'calendar-mode-hook
          (lambda ()
            (setq calendar-mark-holidays-flag t)))

(defun turn-off-echo ()
  (setq comint-process-echoes t))

(require 'hi-lock)
(add-to-list 'hi-lock-face-defaults "hi-red")

(add-hook 'inferior-python-mode-hook 'turn-off-echo)

(setq inferior-lisp-program "sbcl")

(require 'quack)
(setq scheme-program-name "racket")

(defun eshell/emacs (&rest args)
  "Open a file in emacs. Some habits die hard."
  (if (null args)
      (bury-buffer)
    (mapc #'find-file (mapcar #'expand-file-name
                              (eshell-flatten-list (reverse args)))))
  nil)

(setq
 eshell-banner-message ""
 eshell-pwd-convert-function #'expand-file-name
 ;; important: eshell-prompt-function and eshell-prompt-regexp must match
 eshell-prompt-function
 (lambda ()
   (let* ((user (or (getenv "USER")
                    user-login-name
                    "sean"))
          (full-host (or (getenv "HOSTNAME")
                         system-name
                         "unknown"))
          (host (first (split-string full-host "\\.")))
          (pwd (abbreviate-file-name (eshell/pwd)))
          (wd (if (string= pwd "/")
                  pwd
                (eshell/basename pwd)))
          (sigil (if (= (user-uid) 0) "#" "$")))
     (format "%s@%s:%s %s " user host wd sigil)))
 eshell-prompt-regexp "^[^#$\n]* [#$] ")
(eshell)
