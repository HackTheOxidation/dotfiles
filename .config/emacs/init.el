;;; package --- Summary
;;; Commentary:

;;; Code:

;; Move Customization variables outside of of init.el
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(require 'iso-transl)

(setq package-enable-at-startup nil)

;; Initialize package repositories
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ("nongnu" . "https://elpa.nongnu.org/nongnu/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(if (package-installed-p 'use-package)
    (require 'use-package)
  (package-install 'use-package))

(setq use-package-always-ensure t)

;; Tabs are Evil
(setq-default indent-tabs-mode nil)


;; Automatic management of the garbage collector to speed up load times
(use-package gcmh
  :config
  (gcmh-mode 1))

(setq gc-cons-threshold (* 100 1024 1024)
      read-process-output-max (* 1024 1024)
      create-lockfiles nil)

;; Silence compiler warnings on start-up
(if (boundp 'comp-deferred-compilation)
    (setq comp-deferred-compilation nil)
    (setq native-comp-deferred-compilation nil))
(setq load-prefer-newer noninteractive)


;; Emojis...
(use-package emojify
  :hook (after-init . global-emojify-mode))

;; Edit files with sudo-privileges
(use-package sudo-edit)

(setq backup-directory-alist '(("." . "~/.saves")))


;; Let Emacs play some music
(use-package emms
  :ensure t
  :config
  (emms-all)
  (emms-default-players)
  (global-set-key (kbd "C-x m") 'emms))

(setq emms-source-file-default-directory "~/Music/")


;; Minimize UI
(setq inhibit-startup-screen t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(toggle-scroll-bar -1)
(scroll-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode 10)

;; Enable line-numbers
(column-number-mode)
(global-display-line-numbers-mode t)

;; Set the font size
(set-face-attribute 'default nil :height 150)

;; Select, Delete and Replace text all-in-one
(delete-selection-mode t)

;; Don't use UI dialogs when prompted
(setq use-dialog-box nil)

;; Refresh buffers when the underlying file changes
(global-auto-revert-mode 1)

;; Revert Dired and other buffers
(setq global-auto-revert-non-file-buffers t)

;; Shorten yes-or-no-questions in the minibuffer
(fset 'yes-or-no-p 'y-or-n-p)


;; EVIL mode - Vi emulation for emacs
(use-package evil
  :ensure t
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1))

(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))


;; Add some evil to your modeline
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom
  (doom-modeline-height 15))


(use-package catppuccin-theme
  :ensure t)
(add-to-list 'custom-theme-load-path "~/.config/emacs/everforest")
(load-theme 'catppuccin t)


;; Disable line numbers for some nodes
(dolist (mode '(org-mode-hook
		term-mode-hook
		shell-mode-hook
		vterm-mode-hook
		eshell-mode-hook))
  (add-hook mode (lambda() (display-line-numbers-mode 0))))


;; Yay! A pretty lambda
(global-prettify-symbols-mode 1)

;; Yay! Rainbow brackets
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode)

(use-package flycheck
  :ensure t
  :config
  (global-flycheck-mode))

(use-package smartparens
  :hook (prog-mode . smartparens-mode))


;; Magit, a Git "porcelein"
(use-package magit
  :ensure t)

;; Sqlite3 - Driver for Magit
(use-package sqlite3
  :after magit
  :ensure t)

;; Forge, an extension to Magit for managing Git forges
(use-package forge
  :after magit
  :ensure t)


;; Projectile for project management
(use-package projectile
  :diminish projectile-mode
  :bind (:map projectile-mode-map
	      ("C-x p" . projectile-command-map))
  :config (projectile-mode))



;; Helm
(use-package helm
  :ensure t
  :init (helm-mode 1)
  :config
  (global-set-key (kbd "M-x") #'helm-M-x)
  (global-set-key (kbd "C-x b") #'helm-mini)
  (global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
  (global-set-key (kbd "C-x C-f") #'helm-find-files))

(use-package helm-searcher
  :after (helm)
  :ensure t
  :config
  (global-set-key (kbd "C-s") 'helm-searcher-search-file)
  (global-set-key (kbd "C-r") 'helm-searcher-replace-file)
  (global-set-key (kbd "M-s s") 'helm-searcher-search-project))

(use-package helm-emms
  :after (emms helm)
  :ensure t)

(use-package helm-system-packages
  :after (helm)
  :ensure t)

(use-package helm-flx
  :after (helm)
  :ensure t
  :config
  (helm-flx-mode +1))


;; Additional paths
(defun home (path)
  "Formats PATH with user home directory as prefix."
  (concat (substitute-in-file-name "$HOME/") path))

(dolist (element
         '(".local/bin"
           "go/bin"
           ".cargo/bin"
           ".scripts"
           ".dotnet/tools")
         nil)
  (add-to-list 'exec-path (home element)))


;; Python IDE features
(use-package python-mode
  :ensure t)

(use-package elpy
  :after (python-mode)
  :ensure t)

(use-package python-docstring
  :after (python-mode)
  :ensure t
  :hook (python-mode . python-docstring-mode))

(use-package py-test
  :after (python-mode)
  :ensure t)

(use-package blacken
  :after (python-mode)
  :ensure t
  :hook (python-mode . blacken-mode)
  :config (setq blacken-line-length 100))


;; Java IDE features
(use-package eglot-java
  :ensure t
  :hook (java-mode . eglot-java-mode))


;; FSharp IDE features
(use-package fsharp-mode
  :ensure t)
(setq-default fsharp-indent-offset 2)

(use-package eglot-fsharp
  :after fsharp-mode
  :ensure t)


;; Markdown IDE features
(use-package markdown-mode
  :ensure t)

;; CMake IDE features
(use-package cmake-mode
  :ensure t)


;; Haskell IDE features
(use-package haskell-mode
  :ensure t)

(use-package hindent
  :after haskell
  :ensure t
  :hook (haskell-mode . hindent-mode))

(use-package flycheck-haskell
  :after haskell
  :ensure t
  :hook (haskell-mode . flycheck-haskell-setup))

(use-package dante
  :after haskell
  :ensure t)


;; JS/TS
(use-package typescript-mode
  :ensure t)


;;; JVM Languages
;; Scala
(use-package scala-mode
  :ensure t
  :interpreter ("scala" . scala-mode))

(use-package sbt-mode
  :after (scala-mode)
  :ensure t
  :commands sbt-start sbt-command
  :config
  (setq sbt:program-options '("-Dsbt.supershell=false")))


;; Minimalist Language Server
(use-package eglot
  :after (python-mode)
  :bind (:map eglot-mode-map
	      ("C-c r" . eglot-rename)
	      ("C-c o" . eglot-code-action-organize-imports)
	      ("C-c h" . eldoc)
	      ("C-c f" . eglot-find-declaration)
	      ("C-c C-f" . eglot-find-implementation)
	      ("C-c s" . eglot-format)
	      ("C-c C-s" . eglot-format-buffer)
	      ("M-RET" . eglot-code-actions)
	      ("C-RET" . eglot-code-action-quickfix))
  :ensure t
  :hook
  ((c-mode
    c++-mode
    cmake-mode
    haskell-mode
    js-mode
    markdown-mode
    tex-mode
    typescript-mode
    python-mode
    scala-mode) . eglot-ensure)
  :commands (eglot eglot-ensure))

(add-hook 'eglot--managed-mode-hook (lambda () (flymake-mode -1)))

(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs
               '(typescript-mode . ("deno" "lsp"))))

;; Company for code auto-completions
(use-package company
  :after eglot
  :ensure t
  :config
    (setq company-idle-delay 0)
    (setq company-minimum-prefix-length 1)
    (global-company-mode t))



;; Eshell configuration
(use-package eshell-git-prompt)

(use-package eshell
  :config
  (eshell-git-prompt-use-theme 'robbyrussell)
  (setenv "PAGER" "cat"))

(use-package eshell-syntax-highlighting
  :after eshell
  :ensure t
  :config
  (eshell-syntax-highlighting-global-mode +1))

(global-set-key (kbd "C-M-s") 'eshell)


;; A better terminal emulator
;; Make sure to install 'cmake' and 'libvterm'.
(use-package vterm
  :ensure t)


;; Dired Configuration
(use-package dired
  :ensure nil
  :commands (dired dired-jump)
  :bind (("C-x C-j" . dired-jump)))

(use-package dired-single)

(use-package all-the-icons-dired
  :hook (dired-mode . all-the-icons-dired-mode))

(use-package dired-hide-dotfiles
  :hook (dired-mode . dired-hide-dotfiles-mode))


;; Org-mode configuration
(use-package org
  :config
  (setq org-ellipsis " ▾"
	org-hide-emphasis-markers t))

;; Org-babel load python
(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)
   (latex . t)
   (C . t)))

(require 'ob-python)
(setq py-default-interpreter "/usr/bin/python3")

(require 'ox-latex)
(add-to-list 'org-latex-packages-alist '("" "minted"))
(setq org-latex-listings 'minted) 

(setq org-latex-pdf-process
      '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))

(setq org-src-fontify-natively t)


;; Automatic package updates
(use-package auto-package-update
  :custom
  (auto-package-update-interval 7)
  (auto-package-update-prompt-before-update t)
  (auto-package-update-hide-results t)
  :config
  (auto-package-update-maybe)
  (auto-package-update-at-time "09:00"))


;; Dashboard - A startup screen
(use-package dashboard
  :init
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  (setq dashboard-banner-logo-title "Emacs Is More Than A Text Editor!")
  (setq dashboard-startup-banner "~/.config/emacs/emacs-icon.png")
  (setq dashboard-center-content t)
  :config
  (dashboard-setup-startup-hook))

;; Dashboard in emacsclient
(setq initial-buffer-choice (lambda () (get-buffer "*dashboard*")))


;; AnB syntax highlighting
(add-to-list 'load-path "~/.config/emacs/lisp/")
(require 'anb)

(provide 'init)
;;; init.el ends here
