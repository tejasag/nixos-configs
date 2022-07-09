;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq doom-font (font-spec :family "Portland Mono" :size 15)
       doom-variable-pitch-font (font-spec :family "sans" :size 15)
       line-spacing 0.5)


(setq org-directory "~/org/")
(setq display-line-numbers-type 'relative)

;; Background opacity
;; (doom/set-frame-opacity 95)

;; (add-to-list 'custom-theme-load-path "~/.doom.d/themes")

;; Cursors
; (setq evil-insert-state-cursor 'box)
(setq evil-visual-state-cursor 'box)

(use-package doom-themes
  :ensure t
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-tokyo-night t)
  (setq doom-themes-neotree-file-icons t)

  ;; Enable custom neotree theme (all-the-icons must be installed!)
  (doom-themes-neotree-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

(after! rustic
  (setq rustic-lsp-server 'rls))
