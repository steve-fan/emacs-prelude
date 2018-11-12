;;; prelude-pinned-packages.el --- Prelude Emacs modified -*- lexical-binding: t -*-

;; Author: zhenchao
;; Keywords: pinned


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

(add-to-list 'package-archives
             '("melpa-stable" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/melpa-stable/"))

(setq package-pinned-packages
      '((avy . "melpa-stable")
	(async . "melpa-stable")
	(anzu . "melpa-stable")
	(beacon . "melpa-stable")
	(color-theme-sanityinc-tomorrow . "melpa-stable")
	(company . "melpa-stable")
	(crux . "melpa-stable")
	(diff-hl . "melpa-stable")
	(diminish . "melpa-stable")
	(easy-kill . "melpa-stable")
	(emmet-mode . "melpa-stable")
	(epl . "melpa-stable")
	(evil . "melpa-stable")
	(exec-path-from-shell . "melpa-stable")
	(expand-region . "melpa-stable")
	(flycheck . "melpa-stable")
	(git-timemachine . "melpa-stable")
	(gitconfig-mode . "melpa-stable")
	(gitignore-mode . "melpa-stable")
	(hl-todo . "melpa-stable")
	(helm . "melpa-stable")
	(helm-ag . "melpa-stable")
	(helm-projectile . "melpa-stable")
	(neotree . "melpa-stable")
	(magit . "melpa-stable")
	(monokai-theme . "melpa-stable")
	(move-text . "melpa-stable")
	(multiple-cursors . "melpa-stable")
	(projectile . "melpa-stable")
	(rainbow-delimiters . "melpa-stable")
	(smartparens . "melpa-stable")
	(smartrep . "melpa-stable")
	(solarized-theme . "melpa-stable")
	(super-save . "melpa-stable")
	(switch-window . "melpa-stable")
	(undo-tree . "gnu")
	(visual-regexp . "melpa-stable")
	(which-key . "melpa-stable")
	(writeroom-mode . "melpa-stable")
	(yasnippet . "melpa-stable")
	(yasnippet-snippets . "melpa-stable")
	(zenburn-theme . "melpa-stable")))

(provide 'prelude-pinned-packages)

;;; prelude-pinned-packages.el ends here
