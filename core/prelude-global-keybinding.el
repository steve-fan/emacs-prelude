;;; Codes:

;; toggle maximize current buffer
(global-set-key (kbd "C-c .") 'toggle-maximize-buffer)

;; remap goto-line to "C-c l" for convenience's sake
(global-unset-key (kbd "M-g g"))
(global-set-key (kbd "C-c l") 'goto-line)

;; Align your code in a pretty way.
(global-set-key (kbd "C-x \\") 'align-regexp)

;; Start eshell or switch to it if it's active.
(global-set-key (kbd "C-x m") 'eshell)

;; Start a new eshell even if one is active.
(global-set-key (kbd "C-x M") (lambda () (interactive) (eshell t)))

;; use hippie-expand instead of dabbrev
(global-set-key (kbd "M-/") 'hippie-expand)

(global-set-key (kbd "C-x g") 'magit-status)

(setq avy-all-windows nil)
(global-set-key (kbd "C-c SPC SPC") 'avy-goto-char)
(global-set-key (kbd "M-SPC") 'avy-goto-word-0)

;; improved window navigation with swith-window
(global-set-key (kbd "C-x o") 'switch-window)
(global-set-key [remap other-window] 'switch-window)
;; select a window with "a-z" instead of "1-9"
(setq switch-window-shortcut-style 'qwerty)

(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))

(package-install 'multiple-cursors)
(global-set-key (kbd "C-c m a") 'mc/mark-all-like-this)
(global-set-key (kbd "C-c m n") 'mc/mark-next-like-this)
(global-set-key (kbd "C-c m p") 'mc/mark-previous-like-this)


;; helm key bindings
(require 'helm)
(require 'helm-config)

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x C-b") 'helm-buffers-list)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-c i") 'helm-imenu)
;; cycle the kill ring with helm
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
;; show all marks
(global-set-key (kbd "C-h SPC") 'helm-all-mark-rings)
;; Activate occur easily inside isearch
(define-key isearch-mode-map (kbd "C-o") 'helm-occur)

(setq helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t)

(setq helm-buffers-fuzzy-matching t
      helm-recentf-fuzzy-match    t
      helm-M-x-fuzzy-match t
      helm-imenu-fuzzy-match t)

;; always open helm window in botoom and occupy 50% of current frame
(add-to-list 'display-buffer-alist
             `(,(rx bos "*helm" (* not-newline) "*" eos)
               (display-buffer-in-side-window)
               (inhibit-same-window . t)
               (window-height . 0.5)))

(custom-set-variables
 '(helm-follow-mode-persistent t)
 '(helm-imenu-persistent-action t)
 '(helm-follow-mode-p t)
 '(helm-ag-command-option "-i"))

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to do persistent action
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))

;; helm projectile config
(projectile-global-mode)
(setq projectile-compilation-command 'helm)
(setq projectile-switch-project-action 'helm-projectile-find-file)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(helm-projectile-on)

(global-set-key (kbd "C-c p /") 'helm-projectile-ag)
(global-set-key (kbd "C-x p") 'helm-projectile-find-file)

(setq projectile-globally-ignored-directories
      (append '("node_modules" "build" "assets/node_modules" "deps") projectile-globally-ignored-directories))

;; yasnippet key bindings
;; remove yasnippet's default tab key binding
(define-key yas-minor-mode-map (kbd "<tab>") nil)
(define-key yas-minor-mode-map (kbd "TAB") nil)
;; set yasnippet's key binding to shift+tab
(define-key yas-minor-mode-map (kbd "<backtab>") 'yas-expand)


;; crux key bindings
(require 'crux)
(global-key-binding (kbd "C-c o") 'crux-open-with)
(global-set-key (kbd "C-^") 'crux-top-join-line)
(global-key-binding (kbd "C-a") 'crux-move-beginning-of-line)

(provide 'prelude-global-keybinding)

;;; prelude-global-keybindings.el ends here
