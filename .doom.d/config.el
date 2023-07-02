;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Ken Sparby"
      user-mail-address "ken@sparby.dev")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
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
;; (setq doom-theme 'doom-nord)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Documents/org/")


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

;;;;; ;;;;;; ;;;;;
;;;;; CUSTOM ;;;;;
;;;;; ;;;;;; ;;;;;

;; Removes the confirmation on quitting emacs
(setq confirm-kill-emacs nil)

;; (setq doom-font (font-spec :family "Iosevka Nerd Font Mono" :size 14)
;;       doom-variable-pitch-font (font-spec :family "Iosevka Nerd Font" :style "Italic")    ; Inherits size from 'doom-font'
;;       ; doom-unicode-font (font-spec ...)                      ; Fallback for unicode symbols not supported by main font
;;       doom-big-font (font-spec :family "Iosevka Nerd Font Mono" :size 22))
;; (setq doom-font (font-spec :family "JetBrainsMono Nerd Font" :size 13 :style "Regular" :weight 'light :width 'condensed)
;; (setq doom-font (font-spec :family "JetBrainsMono Nerd Font" :size 13 :style "Regular")
(setq doom-font (font-spec :family "JetBrainsMono Nerd Font Mono" :size 12 :style "Regular")
      ;; doom-variable-pitch-font (font-spec :family "JetBrainsMono Nerd Font" :style "Italic")    ; Inherits size from 'doom-font'
      doom-variable-pitch-font (font-spec :family "JetBrainsMono Nerd Font" :style "Italic")    ; Inherits size from 'doom-font'
      doom-unicode-font (font-spec :family "Noto Sans Symbols")                      ; Fallback for unicode symbols not supported by main font
      doom-big-font (font-spec :family "JetBrainsMono Nerd Font" :size 22 :style "Regular"))
;;(setq doom-font "-PfEd-Monoid Nerd Font Mono-normal-normal-semicondensed-*-12-*-*-*-m-0-iso10646-1")

(custom-theme-set-faces! 'doom-flatwhite
  '(font-lock-comment-face :background "#fcf2bf")
  '(font-lock-type-face :background "#f9e0c7")
  '(hi-yellow :background "#d9c6c3"))

(custom-theme-set-faces! 'doom-gruvbox-material
                        '(font-lock-keyword-face :foreground "#72966c"))

(after! doom-themes
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t
        doom-themes-padded-modeline t))

(custom-set-faces!
  '(font-lock-comment-face :slant italic)
  '(font-lock-keyword-face :slant italic))

;; <GRUVBOX MATERIAL> (https://github.com/Cardoso1994/doom-gruvbox-material-theme)
;; `gruvbox-material' contrast and palette options
(setq doom-gruvbox-material-background  "medium"  ; soft || medium || hard (defaults to soft)
     doom-gruvbox-material-palette     "material") ; material || mix || original (defaults to materia)

;; `gruvbox-material-light' contrast and palette options
(setq doom-gruvbox-material-light-background  "medium" ; soft || medium || hard (defaults to soft)
      doom-gruvbox-material-light-palette     "mix") ; material || mix || original (defaults to material)

;; set `doom-theme'
(setq doom-theme 'doom-gruvbox-material) ; dark variant
;; (setq doom-theme 'doom-gruvbox-material-light) ; light variant


;; </GRUVBOX MATERIAL>

(map! :leader
      :desc "Prev heading'"
      "m g <left>" #'outline-previous-heading)
(map! :leader
      :desc "Next heading'"
      "m g <right>" #'outline-next-heading)


;; ORG MODE

(setq org-roam-directory "~/Documents/org/roam"
      org-agenda-files (list org-directory)
      org-log-done 'time
      org-todo-keywords '((sequence "TODO(t)" "PROJ(p)" "WAIT(w)" "POST(P)" "|" "DONE(d)" "CANCELLED(c)")
                          (sequence "[ ](T)" "[-](S)" "[?](W)" "|" "[X](D)")))
; after! org
;  (setq org-directory "~/Documents/org")
;  (setq org-agenda-files (list org-directory))
;  (setq org-log-done 'time)
;  (setq org-todo-keywords '((sequence "TODO(t)" "PROJ(p)" "WAIT(w)" "POST(P)" "|" "DONE(d)" "CANCELLED(c)")
;                            (sequence "[ ](T)" "[-](S)" "[?](W)" "|" "[X](D)"))))
;
; ; LSP
; after! lsp
;  (setq lsp-ui-doc-enable t))

;(setq tab-always-indent 'complete)
;(setq tab-first-completion 'word-or-paren)

(use-package! evil-quickscope)

;;;;; Web mode stuff

(use-package! lsp-tailwindcss)

(dolist (fn '(flycheck-mode
              prettier-js-mode))
  (add-hook 'web-mode-hook fn))

(add-hook 'json-mode-hook 'flycheck-mode)
(add-hook 'js-mode-hook 'prettier-js-mode)
(add-hook 'css-mode-hook 'prettier-js-mode)

(setq web-mode-enable-current-element-highlight t)

(custom-set-faces '(web-mode-current-column-highlight-face ((t (:inherit 'highlight)))))

(with-eval-after-load 'flycheck
  (flycheck-add-mode 'html-tidy 'web-mode)
  (flycheck-add-mode 'css-csslint 'web-mode))

(defun emmet-next-edit-point-and-insert (count)
  "Goto next edit point and enter insert mode."
  (interactive "^p")
  (unless (or emmet-use-css-transform (emmet-go-to-edit-point count)
              (error "Last edit point reached.")))
  (evil-insert-state))

(defun emmet-prev-edit-point-and-insert (count)
  "Goto previous edit point and enter insert mode."
  (interactive "^p")
  (unless (or emmet-use-css-transform (emmet-go-to-edit-point (- count))
              (error "First edit point reached.")))
  (evil-insert-state))

(map! :leader
      :mode 'web-mode
      :desc "Emmet Next Edit Point" "]" #'emmet-next-edit-point-and-insert
      :desc "Emmet Previous Edit Point" "[" #'emmet-prev-edit-point-and-insert)

(map! :mode 'rjsx-mode
      :mode 'web-mode
      "M-RET" #'emmet-expand-line
      "M-[" #'emmet-prev-edit-point-and-insert
      "M-]" #'emmet-next-edit-point-and-insert)

(setq prettier-js-args '(
                         "--trailing-comma" "all"
                         ))

;; Transparency
(set-frame-parameter (selected-frame) 'alpha '(92 . 90))
(add-to-list 'default-frame-alist '(alpha . (92 . 90)))

;; Sets exec-path to shell path on initialization. Requires package 'exec-path-from-shell'
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

;; RUST STUFF

(setq rustic-format-on-save t)
(map! :map rustic-mode-map
      :g "M-j" 'lsp-ui-imenu
      :g "M-?" 'lsp-find-references
      :g "C-c C-c l" 'flycheck-list-errors
      :g "C-c C-c a" 'lsp-execute-code-action
      :g "C-c C-c r" 'lsp-rename
      :g "C-c C-c q" 'lsp-workspace-restart
      :g "C-c C-c Q" 'lsp-workspace-shutdown
      :g "C-c C-c s" 'lsp-rust-analyzer-status)

;; Default is "check"
(setq lsp-rust-analyzer-cargo-watch-command "clippy"
      lsp-eldoc-render-all t
      lsp-rust-analyzer-server-display-inlay-hints t
      lsp-ui-peek-always-show t
      lsp-ui-sideline-show-hover t)

(setq! js-indent-level 2
       standard-indent 2
       emmet-indentation 2)

;; ELFEED STUFF

;; (setq elfeed-feeds '(("https://tympanus.net/codrops/feed" css)
                     ;; ("https://css-tricks.com/feed" css)
                     ;; "https://andy-bell.co.uk/feed.xml"))
(after! elfeed
  (setq elfeed-search-filter "@1-month-ago +unread")) ;; "@1-month-ago +unread"
;; (after! elfeed
  ;;(setq elfeed-search-filter "@1-month-ago +unread"))
  ;; (setq elfeed-search-filter "@1-month-ago"))

(add-hook 'elfeed-search-mode-hook #'elfeed-update)

(map! :leader
      :desc "Open elfeed" "o e" #'elfeed
      :desc "Insert current time" "m d t" #'insert-time-stamp)


;; MU4E

;; (setq mu4e-contexts
;;       `(,(make-mu4e-context
;;            :name "Work"
;;            :enter-func (lambda () (mu4e-message "Entering Work context"))
;;            :leave-func (lambda () (mu4e-message "Leaving Work context"))
;;            ;; we match based on the contact-fields of the message
;;            :match-func (lambda (msg)
;;                          (when msg
;;                            (mu4e-message-contact-field-matches msg
;;                                                                :to "ken@sparby.dev")))
;;            :vars `( ( user-mail-address         . "ken@sparby.dev" )
;;                     ( user-full-name            . "Ken Sparby" )
;;                     ( message-user-organization . "Sparbydev" )
;;                     ( mu4e-compose-signature .
;;                       (concat
;;                        "---\n"
;;                        "Yours truly\n"
;;                        "Ken Sparby\n" )))) ))

;; (set-email-account! "sparby.dev"
;;                     '((mu4e-sent-folder         . "/sparby.dev/Sent")
;;                       (mu4e-drafts-folder       . "/sparby.dev/Drafts")
;;                       (mu4e-trash-folder        . "/sparby.dev/Trash")
;;                       (mu4e-refile-folder       . "/sparby.dev/INBOX")
;;                       (smtpmail-smtp-user       . "ken@sparby.dev")
;;                       (user-mail-address        . "ken@sparby.dev")
;;                       (mu4e-compose-signature   . "---\nYours truly\nKen Sparby"))
;;                     t)

;; (setq mu4e-context-policy 'pick-first
;;       mu4e-compose-context-policy 'always-ask)

;; OTHER

(setq fancy-splash-image "~/.doom.d/black-hole.png")

(map! "<backtab>" #'comint-dynamic-complete-filename)

(setq vterm-shell "/bin/zsh")

(setq tab-width 2)
(setq css-indent-offset 2)

(setq which-key-use-C-h-commands t)

;; CUSTOM KEYBOARD MAPPINGS

;; (map! "C-/" 'evilnc-comment-or-uncomment-lines)
(map! :leader
      :desc "Increase number at point" "o i" #'org-increase-number-at-point
      :desc "Decrease number at point" "o d" #'org-decrease-number-at-point)

(map! :leader
      :desc "[vertico] Search Project" "s p" #'+vertico/project-search)

(global-unset-key (kbd "C-x C-z"))
(global-unset-key (kbd "C-z"))

(global-evil-quickscope-always-mode 1)

(setq lsp-ui-doc-show-with-mouse nil)

;; Accept completion from copilot and fallback to company
;; (use-package! copilot
;;   :hook (prog-mode . copilot-mode)
;;   :bind (:map copilot-completion-map
;;               ("<tab>" . 'copilot-accept-completion)
;;               ("TAB" . 'copilot-accept-completion)
;;               ("C-TAB" . 'copilot-accept-completion-by-word)
;;               ("C-<tab>" . 'copilot-accept-completion-by-word)))


;; we recommend using use-package to organize your init.el
;; (use-package codeium
;;     ;; if you use straight
;;     ;; :straight '(:type git :host github :repo "Exafunction/codeium.el")
;;     ;; otherwise, make sure that the codeium.el file is on load-path

;;     :init
;;     ;; use globally
;;     ;; (add-to-list 'completion-at-point-functions #'codeium-completion-at-point)
;;     ;; or on a hook
;;     ;; (add-hook 'python-mode-hook
;;     ;;     (lambda ()
;;     ;;         (setq-local completion-at-point-functions '(codeium-completion-at-point))))

;;     ;; if you want multiple completion backends, use cape (https://github.com/minad/cape):
;;     ;; (add-hook 'python-mode-hook
;;     ;;     (lambda ()
;;     ;;         (setq-local completion-at-point-functions
;;     ;;             (list (cape-super-capf #'codeium-completion-at-point #'lsp-completion-at-point)))))
;;     ;; an async company-backend is coming soon!

;;     ;; codeium-completion-at-point is autoloaded, but you can
;;     ;; optionally set a timer, which might speed up things as the
;;     ;; codeium local language server takes ~0.2s to start up
;;     ;; (add-hook 'emacs-startup-hook
;;     ;;  (lambda () (run-with-timer 0.1 nil #'codeium-init)))

;;     ;; :defer t ;; lazy loading, if you want
;;     :config
;;     (setq use-dialog-box nil) ;; do not use popup boxes

;;     ;; if you don't want to use customize to save the api-key
;;     ;; (setq codeium/metadata/api_key "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx")

;;     ;; get codeium status in the modeline
;;     (setq codeium-mode-line-enable
;;         (lambda (api) (not (memq api '(CancelRequest Heartbeat AcceptCompletion)))))
;;     (add-to-list 'mode-line-format '(:eval (car-safe codeium-mode-line)) t)
;;     ;; alternatively for a more extensive mode-line
;;     ;; (add-to-list 'mode-line-format '(-50 "" codeium-mode-line) t)

;;     ;; use M-x codeium-diagnose to see apis/fields that would be sent to the local language server
;;     (setq codeium-api-enabled
;;         (lambda (api)
;;             (memq api '(GetCompletions Heartbeat CancelRequest GetAuthToken RegisterUser auth-redirect AcceptCompletion))))
;;     ;; you can also set a config for a single buffer like this:
;;     ;; (add-hook 'python-mode-hook
;;     ;;     (lambda ()
;;     ;;         (setq-local codeium/editor_options/tab_size 4)))

;;     ;; You can overwrite all the codeium configs!
;;     ;; for example, we recommend limiting the string sent to codeium for better performance
;;     (defun my-codeium/document/text ()
;;         (buffer-substring-no-properties (max (- (point) 3000) (point-min)) (min (+ (point) 1000) (point-max))))
;;     ;; if you change the text, you should also change the cursor_offset
;;     ;; warning: this is measured by UTF-8 encoded bytes
;;     (defun my-codeium/document/cursor_offset ()
;;         (codeium-utf8-byte-length
;;             (buffer-substring-no-properties (max (- (point) 3000) (point-min)) (point))))
;;     (setq codeium/document/text 'my-codeium/document/text)
;;     (setq codeium/document/cursor_offset 'my-codeium/document/cursor_offset))

;; (use-package company
;;   :defer 0.1
;;   :config
;;   (global-company-mode t)
;;   (setq-default
;;    company-idle-delay 0.2
;;    company-require-match nil
;;    company-minimum-prefix-length 0
;;    ;; get only preview
;;    ;; company-frontends '(company-preview-frontend)
;;    ;; also get a drop down
;;    company-frontends '(company-pseudo-tooltip-frontend company-preview-frontend)
;;    ))
