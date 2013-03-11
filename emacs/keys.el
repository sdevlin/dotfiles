(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-a" 'mark-whole-buffer)
(global-set-key "\C-x\C-b" 'ibuffer)
(global-set-key "\C-cib" 'indent-whole-buffer)

(define-key lisp-mode-shared-map "\C-w" 'backward-kill-sexp)
