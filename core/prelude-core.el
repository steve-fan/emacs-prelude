;; kill all buffers and close other windows
(defun kill-all-buffers()
  (interactive)
  (mapc 'kill-buffer (buffer-list))
  (delete-other-windows))

;; save customization to 'customization.el' instread of appending to init file
(if (fboundp 'aquamacs-version)
    (progn
      (setq custom-file (expand-file-name "customization-aq.el" prelude-dir))
      (load custom-file (expand-file-name "customization-aq.el" prelude-dir)))
  (setq custom-file (expand-file-name "customization.el" prelude-dir))
  (load custom-file (expand-file-name "customization.el" prelude-dir)))


;; enable mouse click and wheel action in terminal
(unless (display-graphic-p)
  (xterm-mouse-mode)
  (global-set-key (kbd "<mouse-4>") 'scroll-down-line)
  (global-set-key (kbd "<mouse-5>") 'scroll-up-line)
  )

(when (display-grayscale-p)
  (global-set-key (kbd "<A-wheel-down>") 'text-scale-decrease)
  (global-set-key (kbd "<A-wheel-up>") 'text-scale-increase))

(defun toggle-maximize-buffer () "Maximize buffer"
       (interactive)
       (if (= 1 (length (window-list)))
           (jump-to-register '_)
         (progn
           (window-configuration-to-register '_)
           (delete-other-windows))))

(defun prelude-copy-word-at-point (&optional arg)
  "Copy words at point"
  (interactive "P")
  (let ((beg (progn (if (looking-back "[a-zA-Z0-9]" 1) (backward-word 1)) (point)))
        (end (progn (forward-word arg) (point))))
    (copy-region-as-kill beg end))
  )

;; delete trailing blanks
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(smartparens-global-mode t)
(yas-global-mode t)
(nyan-mode t)

(require 'crux)

(require 'popwin)
(popwin-mode)

(defun prelude-open-init-file ()
  "Open init file"
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(global-set-key (kbd "<f2>") 'prelude-open-init-file)

(provide 'prelude-core)
