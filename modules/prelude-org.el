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

(prelude-require-packages '(org-journal htmlize))

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

;; Journal
(require 'org-journal)
(setq org-journal-dir "~/Documents/org/journal")
;; journal file name format
(setq org-journal-file-format "%Y-%m-%d.org")
(setq org-export-html-postamble-format '(("en" "")))

;; Blog
(require 'ox-publish)
(require 'ox-html)
(setf org-export-html-coding-system 'utf-8-unix)

(defvar prelude-website-html-head
  "<link rel='stylesheet' href='/css/site.css' type='text/css'/>")

(defvar prelude-website-html-blog-head
  "<link rel='stylesheet' href='/css/site.css' type='text/css'/>")

(defvar prelude-website-html-postamble
  "<div class='footer'>最后更新于 %C. <br></div>")

(defvar prelude-website-html-preamble
  "<nav>Navigation</nav>")

(setq org-html-preamble
      "<div class='nav'>
<ul>
<li><a href='/'>Home</a></li>
<li><a href='/'>Home</a></li>
</ul>
</div>
")

(setq org-publish-project-alist
      '(("blog-posts"
         :base-directory "~/Documents/blog/"
         :base-extension "org"
         :publishing-directory "~/Documents/github_pages/"
         :recursive t
         :publishing-function org-html-publish-to-html
         :headline-levels 4             ; Just the default for this project.
         :auto-preamble t
         :section-numbers nil

         :auto-sitemap t

         :with-toc nil
         :with-author nil
         :with-date nil
         :with-title nil
         :html-head-include-default-style nil
         :html-preamble "<div class='nav'>
<ul>
<li><a href='/'>首页</a></li>
<li><a href='/sitemap.html'>博客</a></li>
<li><a target='_blank' href='https://github.com/steve-fan'>GitHub</a></li>
<li><a target='_blank' href='https://twitter.com/stevefan'>Twitter</a></li>
<li><a href='/contact.html'>Contact</a></li>
</ul>
</div>"
         :html-head-extra "<link rel='stylesheet' href='/css/site.css' type='text/css'/>"
         :html-postamble "<div class='footer'>最后更新于 %C</div>")

        ("blog-static"
         :base-directory "~/Documents/blog"
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
         :publishing-directory "~/Documents/github_pages"
         :recursive t
         :publishing-function org-publish-attachment)

        ("blog" :components ("blog-posts" "blog-static"))))

(provide 'prelude-org)

;;; prelude-org.el ends here
