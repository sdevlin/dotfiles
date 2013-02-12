(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-file-name-transforms (quote ((".*" "/tmp/" t))))
 '(backup-directory-alist (quote ((".*" . "/tmp/"))))
 '(blink-cursor-mode nil)
 '(calendar-mark-holidays-flag t)
 '(column-number-mode t)
 '(eshell-banner-message "")
 '(eshell-prompt-function (lambda nil (let* ((user (or (getenv "USER") user-login-name "sean")) (full-host (or (getenv "HOSTNAME") system-name "unknown")) (host (first (split-string full-host "\\."))) (pwd (abbreviate-file-name (eshell/pwd))) (wd (if (string= pwd "/") pwd (eshell/basename pwd))) (sigil (if (= (user-uid) 0) "#" "$"))) (format "%s@%s:%s %s " user host wd sigil))))
 '(eshell-prompt-regexp "^[^#$]* [#$] ")
 '(eshell-pwd-convert-function (quote expand-file-name))
 '(holiday-other-holidays (quote ((holiday-fixed 2 23 "Birth of the Case") (holiday-fixed 3 25 "Mom's Birthday") (holiday-fixed 2 24 "Dad's Birthday") (holiday-fixed 7 19 "Maire's Birthday") (holiday-fixed 8 18 "Nora's Birthday") (holiday-fixed 11 20 "My Birthday"))))
 '(indent-tabs-mode nil)
 '(inferior-lisp-program "sbcl")
 '(inhibit-startup-echo-area-message "sean")
 '(inhibit-startup-screen t)
 '(initial-scratch-message nil)
 '(menu-bar-mode nil)
 '(package-archives (quote (("gnu" . "http://elpa.gnu.org/packages/") ("marmalade" . "http://marmalade-repo.org/packages/") ("melpa" . "http://melpa.milkbox.net/packages/"))))
 '(quack-default-program "racket")
 '(require-final-newline (quote visit-save))
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil)
 '(uniquify-buffer-name-style (quote post-forward) nil (uniquify)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
