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

;; integrate copy and paste functionality with system clipboard
(defun copy-from-osx ()
   (shell-command-to-string "pbpaste"))
(defun paste-to-osx (text &optional push)
   (let ((process-connection-type nil))
      (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
         (process-send-string proc text)
         (process-send-eof proc))))
(setq interprogram-cut-function 'paste-to-osx)
(setq interprogram-paste-function 'copy-from-osx)

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

(require 'crux)

(provide 'prelude-core)
