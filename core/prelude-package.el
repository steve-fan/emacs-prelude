
;;; Commentary:

;;; Code:

(require 'cl)
(require 'package)

(setq package-archives '())		;; reset package-archives
(add-to-list 'package-archives
	     '("melpa" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/") t)
(add-to-list 'package-archives
	     '("gnu" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/") t)
(add-to-list 'package-archives
	     '("org" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/org/") t)

;; load the pinned packages
(let ((prelude-pinned-packages-file (expand-file-name "prelude-pinned-packages.el" prelude-dir)))
  (if (file-exists-p prelude-pinned-packages-file)
      (load prelude-pinned-packages-file)))

;; set package-user-dir to be relative to Prelude install path
;; (setq package-user-dir (expand-file-name "elpa" prelude-dir))
(package-initialize)

(defvar prelude-packages
  '(avy
    async
    anzu
    beacon
    color-theme-sanityinc-tomorrow
    company
    crux
    discover-my-major
    diff-hl
    diminish
    easy-kill
    emmet-mode
    epl
    evil
    exec-path-from-shell
    expand-region
    flycheck
    git-timemachine
    gitconfig-mode
    gitignore-mode
    hl-todo
    helm
    helm-ag
    helm-projectile
    idle-highlight-mode
    neotree
    nyan-mode
    magit
    monokai-theme
    move-text
    multiple-cursors
    projectile
    rainbow-delimiters
    smartparens
    smartrep
    solarized-theme
    super-save
    switch-window
    undo-tree
    visual-regexp
    which-key
    writeroom-mode
    yasnippet
    yasnippet-snippets
    zenburn-theme)
  "A list of packages to ensure are installed at launch.")

(defun prelude-packages-installed-p ()
  "Check if all packages in `prelude-packages` are installed."
  (every #'package-installed-p prelude-packages))

(defun prelude-require-package (package)
  "Install PACKAGE unless already installed."
  (unless (memq package prelude-packages)
    (add-to-list 'prelude-packages package))
  (unless (package-installed-p package)
    (package-install package)))

(defun prelude-require-packages (packages)
  "Ensure PACKAGES are installed.
Missing packages are installed automatically."
  (mapc #'prelude-require-package packages))

(defun prelude-install-packages ()
  "Install all packages listed in `prelude-packages`."
  (unless (prelude-packages-installed-p)
    (message "%s" "Emacs Prelude is now refreshing its package database...")
    (package-refresh-contents)
    (message "%s" " done.")
    (prelude-require-packages prelude-packages)))

(prelude-install-packages)

(provide 'prelude-package)
;;; prelude-package.el ends here
