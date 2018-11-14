;;; prelude-programming.el --- Emacs Prelude: prog-mode configuration

;;; Commentary:

;;; Code:

;; show the name of the current function definition in the modeline
(require 'which-func)
(which-function-mode 1)

;; font-lock annotations like TODO in source code
(require 'hl-todo)
(global-hl-todo-mode 1)

;; highlight current line
(global-hl-line-mode 1)

;; smart curly braces
(sp-pair "{" nil :post-handlers
         '(((lambda (&rest _ignored)
              (crux-smart-open-line-above)) "RET")))

(defun prelude-prog-mode-defaults ()
  "Default coding hook, useful with any programming language."
  (smartparens-mode +1)
  (linum-mode +1)
  (idle-highlight-mode +1))

;; in Emacs 24 programming major modes generally derive from a common
;; mode named prog-mode; for others, we'll arrange for our mode
;; defaults function to run prelude-prog-mode-hook directly.  To
;; augment and/or counteract these defaults your own function
;; to prelude-prog-mode-hook, using:
;;
;;     (add-hook 'prelude-prog-mode-hook 'my-prog-mode-defaults t)
;;
;; (the final optional t sets the *append* argument)
(setq prelude-prog-mode-hook 'prelude-prog-mode-defaults)

(add-hook 'prog-mode-hook (lambda ()
			    (run-hooks 'prelude-prog-mode-hook)))

;; enable on-the-fly syntax checking
(if (fboundp 'global-flycheck-mode)
    (global-flycheck-mode +1)
  (add-hook 'prog-mode-hook 'flycheck-mode))

;; show flycheck errors with helm
(prelude-require-packages '(helm-flycheck))
(require 'helm-flycheck)
(eval-after-load 'flycheck
  '(define-key flycheck-mode-map (kbd "C-c ! h") 'helm-flycheck))

(provide 'prelude-programming)
;;; prelude-programming.el ends here
