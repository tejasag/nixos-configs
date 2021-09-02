;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq doom-font (font-spec :family "Victor Mono" :size 16 :weight 'semi-bold)
       doom-variable-pitch-font (font-spec :family "sans" :size 15))


(setq org-directory "~/org/")
(setq display-line-numbers-type 'relative)

;; Background opacity
(doom/set-frame-opacity 95)

;; Treemacs Icons
(require 'treemacs-all-the-icons)
(treemacs-load-theme "all-the-icons")

(add-to-list 'custom-theme-load-path "~/.doom.d/themes")

;; Cursors
(setq evil-insert-state-cursor 'box)
(setq evil-visual-state-cursor 'box)

(use-package doom-themes
  :ensure t
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-gruvbox t)
  (setq doom-gruvbox-dark-variant "soft")
  (setq doom-themes-neotree-file-icons t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; Enable custom neotree theme (all-the-icons must be installed!)
  (doom-themes-neotree-config)
  ;; or for treemacs users
  (setq doom-themes-treemacs-theme "doom-colors") ; use "doom-colors" for less minimal icon theme
  (doom-themes-treemacs-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

(after! rustic
  (setq rustic-lsp-server 'rls))
