;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `CaskaydiaCove-Nerd-Font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face

(setq doom-font (font-spec :family "CaskaydiaCove Nerd Font" :size 16))
;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-tokyo-night)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
;; Use 'prepend for the NS and Mac ports or Emacs will crash.

;;evil remap
(define-key evil-insert-state-map (kbd "C-c") 'evil-normal-state)
;; (define-key evil-normal-state-map (kbd "C-c") 'evil-normal-state)


(setq auto-window-vscroll nil)

(setq org-hide-emphasis-markers t)

(blink-cursor-mode 1)

(defun org-hide-src-block-delimiters()
  (interactive)
  (save-excursion (goto-char (point-max))
      (while (re-search-backward "#\\+BEGIN_SRC\\|#\\+END_SRC" nil t)
         (let ((ov (make-overlay (line-beginning-position)
             (1+ (line-end-position)))))
         (overlay-put ov 'invisible t)))))

;; Modern org mode
(with-eval-after-load 'org (global-org-modern-mode))

;; $DOOMDIR/config.el
(use-package! org-pandoc-import :after org)

;;treemacs
(use-package treemacs
  :config
  (setq treemacs-default-visit-action 'treemacs-visit-node-close-treemacs))

(map! :leader
      :desc "Treemacs"
      "e" #'treemacs)
(map! :after treemacs
      :map treemacs-mode-map
      "a" #'treemacs-create-file
      "A" #'treemacs-create-dir
      "x" #'treemacs-move-file
      "|" #'treemacs-visit-node-vertical-split
      "-" #'treemacs-visit-node-horizontal-split
      "r" #'treemacs-rename-file)

;;Switch to window
(map! :after evil-org
      :map evil-org-mode-map
      :n "C-j" #'evil-window-down
      :n "C-k" #'evil-window-up
      :n "C-h" #'evil-window-left
      :n "C-l" #'evil-window-right
      )
(map! :map general-override-mode-map
      :n "C-j" #'evil-window-down
      :n "C-k" #'evil-window-up
      :n "C-h" #'evil-window-left
      :n "C-l" #'evil-window-right
      )


;; Doom dashboard
(setq fancy-splash-image "~/dev/splash_img/onepiecelogo.png")
;; (remove-hook '+doom-dashboard-functions #'doom-dashboard-widget-shortmenu)
(remove-hook '+doom-dashboard-functions #'doom-dashboard-widget-footer)


;; Emacs dired
(map! :map dired-mode-map
      :n "h" #'dired-up-directory
      :n "l" #'dired-find-alternate-file)
