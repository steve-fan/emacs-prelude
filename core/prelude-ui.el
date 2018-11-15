;; maximaize initial frame
(setq initial-frame-alist (quote ((fullscreen . maximized))))

(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

;; show no menu when open emacs in termimal
(unless (display-graphic-p)
  (menu-bar-mode -1))

;; hide scrollbar
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

;; Fringe on left and right: 8 pixels
(when (fboundp 'fringe-mode)
  (fringe-mode '(8 . 8)))

;; the blinking cursor is nothing, but an annoyance
(blink-cursor-mode -1)

;; disable the annoying bell ring
(setq ring-bell-function 'ignore)

;; disable startup screen
(setq inhibit-startup-screen t)

;; nice scrolling
(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

;; mode line settings
(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)

;; enable y/n answers
(fset 'yes-or-no-p 'y-or-n-p)

;; show the cursor when moving after big movements in the window
(require 'beacon)
(beacon-mode +1)

;; show available keybindings after you start typing
(require 'which-key)
(which-key-mode +1)

(global-company-mode)

(dired-async-mode 1)

(load-theme 'sanityinc-tomorrow-night t)

;; Font
(set-frame-font "M+ 2m 16")
(add-to-list 'default-frame-alist
             '(font . "M+ 2m 16"))

;; open *help* in current frame for `one-buffer-one-frame-mode' (Aquamacs open *help* in a new frame)
(setq special-display-regexps (remove "[ ]?\\*[hH]elp.*" special-display-regexps))

;; disable tabbar
(when (fboundp 'tabbar-mode)
  (tabbar-mode -1))

;; set linum format
(setq linum-format "%3d")

;; set linum foreground-color
(require 'color)
(require 'linum)
(setq linum-forground-color (color-lighten-name (face-attribute 'default :background) 20))
(set-face-foreground 'linum linum-forground-color)

;; awesome-tab
(require 'awesome-tab)
(awesome-tab-mode)
(global-set-key [C-tab] 'awesome-tab-forward)

(provide 'prelude-ui)
