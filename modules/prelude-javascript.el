;;; prelude-javascript.el --- Prelude Emacs modified -*- lexical-binding: t -*-

;; Author: zhenchao
;; Keywords: javascript


;; This file is not part of GNU Emacs

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; For a full copy of the GNU General Public License
;; see <http://www.gnu.org/licenses/>.


;;; Commentary:

;; commentary

;;; Code:


(prelude-require-packages '(tide web-mode))

(require 'web-mode)
(require 'prelude-programming)
(require 'prelude-tide)
(require 'prelude-webmode)

;; Change javascript file content type to "jsx"
(setq web-mode-content-types-alist '(("jsx" . "\\.js[x]?\\'")))

;; JSX major mode
(define-derived-mode jsx-mode web-mode "JSX"
  "Major mode for editing JSX file."
  (message "jsx-mode loaded."))

(defun prelude-jsx-mode-hook ()
  "Hooks for JSX mode."
  (setq-local emmet-expand-jsx-className? t)
  (yas-activate-extra-mode 'js-mode)
  (message "prelude-jsx-mode-hook"))

(add-to-list 'auto-mode-alist '("\\.js\\'" . jsx-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . jsx-mode))

(add-hook 'jsx-mode-hook 'emmet-mode)
(add-hook 'jsx-mode-hook 'smartparens-mode)
(add-hook 'jsx-mode-hook 'yas-minor-mode)
(add-hook 'jsx-mode-hook 'rainbow-delimiters-mode)
(add-hook 'jsx-mode-hook #'setup-tide-mode)
(add-hook 'jsx-mode-hook #'prelude-jsx-mode-hook)
(flycheck-add-mode 'javascript-eslint 'jsx-mode)

(provide 'prelude-javascript)

;;; prelude-javascript.el ends here
