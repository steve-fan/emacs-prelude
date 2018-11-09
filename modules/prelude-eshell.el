(require 'helm-eshell)

;; easy and efficient way to work with eshell command history
(add-hook 'eshell-mode-hook
          #'(lambda ()
              (define-key eshell-mode-map (kbd "C-c C-l")  'helm-eshell-history)))

;; instead of running end-of-buffer key-binding,
;; the following setting means any other key will jump back to the prompt.
;; many thanks to https://github.com/howardabrams/dot-files/blob/master/emacs-eshell.org
(setq
 eshell-scroll-to-bottom-on-input 'all
 eshell-error-if-no-glob t
 eshell-hist-ignoredups t
 eshell-save-history-on-exit t
 eshell-prefer-lisp-functions nil
 eshell-destroy-buffer-when-process-dies t)

(provide 'prelude-eshell)
