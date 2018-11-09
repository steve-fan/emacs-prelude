;;; prelude-elixir.el --- Prelude Emacs modified -*- lexical-binding: t -*-

;; Author: zhenchao
;; Keywords: elixir,prelude


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

(prelude-require-packages '(elixir-mode alchemist))

(setq alchemist-goto-elixir-source-dir "/usr/local/Cellar/elixir/1.6.2/src")

(defun alchemist-mix-test ()
  "Run the whole elixir test suite."
  (interactive)
  (alchemist-mix--execute-test)
  (pop-to-buffer alchemist-test-report-buffer-name))

(add-hook 'elixir-mode-hook 'smartparens-mode)
(add-hook 'elixir-mode-hook 'yas-minor-mode)
(add-hook 'elixir-mode-hook 'rainbow-delimiters-mode)
(add-hook 'elixir-mode-hook 'flycheck-mode)
(add-hook 'elixir-mode-hook 'alchemist-mode)

;; run elixir format on file save
(add-hook 'elixir-mode-hook
          (lambda () (add-hook 'before-save-hook 'elixir-format nil t)))

(provide 'prelude-elixir)

;;; prelude-elixir.el ends here
