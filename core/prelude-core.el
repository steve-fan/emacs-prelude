;; kill all buffers and close other windows
(defun kill-all-buffers()
  (interactive)
  (mapc 'kill-buffer (buffer-list))
  (delete-other-windows))

;; save customization to 'customization.el' instread of appending to init file
(setq custom-file (expand-file-name "customization.el" prelude-dir))
(load custom-file (expand-file-name "customization.el" prelude-dir))

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

;; delete trailing blanks
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(smartparens-global-mode t)
(yas-global-mode t)
(nyan-mode t)

(require 'crux)

(provide 'prelude-core)
