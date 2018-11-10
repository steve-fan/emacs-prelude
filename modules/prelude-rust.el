;;; prelude-rust.el --- Prelude Emacs modified -*- lexical-binding: t -*-

;; Author: zhenchao
;; Keywords: rust


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
(prelude-require-packages '(rust-mode racer cargo flycheck-rust))

;; user home direcotory
(defvar user-home-dir (getenv "HOME"))

;; Set path to racer binary
(setq racer-cmd (expand-file-name ".cargo/bin/racer" user-home-dir))
;; Set path to rust src directory
(setq racer-rust-src-path
      (expand-file-name
       ".rustup/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src"
       user-home-dir))

(add-hook 'rust-mode-hook 'cargo-minor-mode)
(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'rust-mode-hook #'eldoc-mode)
(add-hook 'rust-mode-hook #'company-mode)
(add-hook 'rust-mode-hook #'flycheck-mode)
(add-hook 'rust-mode-hook #'smartparens-mode)
(add-hook 'rust-mode-hook
          '(lambda ()
             (add-hook 'flycheck-mode-hook 'flycheck-rust-setup)))

(with-eval-after-load 'company
  (add-to-list 'company-backends 'company-racer))

;; Reduce the time after which the company auto completion popup opens
(setq company-idle-delay 0.2)
;; Reduce the number of characters before company kicks in
(setq company-minimum-prefix-length 1)
(setq company-tooltip-align-annotations t)
(setq rust-format-on-save t)

(provide 'prelude-rust)

;;; prelude-rust.el ends here
