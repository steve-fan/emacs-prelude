;;; prelude-typescript.el --- Prelude Emacs modified -*- lexical-binding: t -*-

;; Author: zhenchao
;; Keywords: typescript


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

(require 'prelude-programming)
(prelude-require-packages '(tide web-mode))

(require 'typescript-mode)

(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  (company-mode +1))

(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))

(add-hook 'before-save-hook 'tide-format-before-save)
(add-hook 'typescript-mode-hook #'setup-tide-mode)

(require 'web-mode)

;; new marjor mode based on web-mode for TSX file
(define-derived-mode tsx-mode web-mode "tsx"
  "Major mode for editing typescript with react language code."
  (message "tsx-mode loaded."))

(defun highlight-element-and-column ()
  "Highlight current HTML element and current column."
  (setq-local web-mode-enable-current-element-highlight t)
  (setq-local web-mode-enable-current-column-highlight t))

(add-to-list 'auto-mode-alist '("\\.tsx\\'" . tsx-mode))
(add-hook 'tsx-mode-hook 'emmet-mode)
(add-hook 'tsx-mode-hook #'setup-tide-mode)
(add-hook 'tsx-mode-hook #'highlight-element-and-column)

(provide 'prelude-typescript)

;;; prelude-typescript.el ends here
