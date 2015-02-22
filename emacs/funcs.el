(defun chili-dog ()
  "Pretty much speaks for itself."
  (interactive)
  (message "chili dog!!"))

(defun turn-off-echo ()
  "Disable echo in comint processes."
  (interactive)
  (setq comint-process-echoes t))

(defun indent-whole-buffer ()
  "Indent whole buffer."
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max))
  (untabify (point-min) (point-max)))

(defun add-hook* (hooks function &optional append local)
  "Wrapper around 'add-hook. Register a common function to a list of hooks."
  (dolist (hook hooks)
    (add-hook hook function append local)))

(defun package-install-if-missing (package)
  (unless (package-installed-p package)
    (package-install package)))

(defun package-upgrade-all ()
  (interactive)
  (save-window-excursion
    (list-packages)
    (package-menu-mark-upgrades)
    (package-menu-execute t)))

(defun eshell/emacs (&rest args)
  "Open a file in emacs."
  (if (null args)
      (bury-buffer)
    (mapc 'find-file (mapcar 'expand-file-name
                             (eshell-flatten-list (reverse args)))))
  nil)

(defun spd-eshell-prompt-function ()
  "Eshell prompt like \"user@host:wd % \"."
  (let*
      ((user (or (getenv "USER")
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
       (sigil (if (= (user-uid) 0) "#" "%")))
    (format "%s@%s:%s %s " user host wd sigil)))

(defun recompile-elisp ()
  (when (eq major-mode 'emacs-lisp-mode)
    (require 'bytecomp)
    (byte-recompile-file buffer-file-name)))
