;;; prelude-org.el --- Prelude Emacs modified -*- lexical-binding: t -*-

;; Author: zhenchao
;; Keywords: orgmode,prelude


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

(prelude-require-packages '(org-journal))

(add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\)$" . org-mode))

(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c a") 'org-agenda)

(setq org-agenda-files (quote ("~/Documents/org")))
(setq org-directory "~/Documents/org")
(setq org-default-notes-file "~/Documents/org/notes.org")
(setq org-file-apps
          '((auto-mode . emacs)
            ("\\.?\\'" . "open %s")
            ))

;; Various preferences
(setq org-log-done t
      org-edit-timestamp-down-means-later t
      org-export-coding-system 'utf-8
      org-html-validation-link nil
      org-export-kill-product-buffer-when-displayed t
      org-tags-column 80
      org-agenda-show-all-dates t
      org-agenda-ndays 7
      )

;; Todo settings
(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "DOING(n)" "|" "DONE(d)")
              (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)" "PHONE" "MEETING"))))
(setq org-todo-keyword-faces
      (quote (("TODO" :foreground "red" :weight bold)
              ("DOING" :foreground "blue" :weight bold)
              ("DONE" :foreground "forest green" :weight bold)
              ("WAITING" :foreground "orange" :weight bold)
              ("HOLD" :foreground "magenta" :weight bold)
              ("CANCELLED" :foreground "forest green" :weight bold)
              ("MEETING" :foreground "forest green" :weight bold)
              ("PHONE" :foreground "forest green" :weight bold))))

;; Capture templates for: TODO tasks, Notes, appointments, phone calls, meetings, and org-protocol
(setq org-capture-templates
      (quote (("t" "todo" entry (file "~/Documents/org/todo.org")
               "* TODO %?\n%U\n")
              ("n" "note" entry (file "~/Documents/org/notes.org")
               "* %? :NOTE:\n%U\n")
              ("w" "org-protocol" entry (file "~/org/refile.org")
               "* TODO Review %c\n%U\n" :immediate-finish t)
              ("m" "Meeting" entry (file "~/org/meeting.org")
               "* MEETING with %? :MEETING:\n%U"))))

;; Agenda
(setq org-agenda-span 'day)
(setq org-use-speed-commands t)

(add-hook 'org-mode-hook 'org-indent-mode)
(add-hook 'org-mode-hook 'visual-line-mode)

(require 'org-journal)
(setq org-journal-dir "~/Documents/org/journal")
;; journal file name format
(setq org-journal-file-format "%Y-%m-%d.org")

(provide 'prelude-org)

;;; prelude-org.el ends here
