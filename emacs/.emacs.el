(setq warning-minimum-level :error)
(setq warning-suppress-types '((lexical-binding)))

;; Don't show the splash screen
(setq inhibit-startup-message t
      ring-bell-function 'ignore
      make-backup-files nil
      auto-revert-mode t
      indent-tabs-mode nil
      tab-width 2
      tab-always-indent 'complete
      delete-by-moving-to-trash t
      compilation-scroll-output t
      use-short-answers t
      dired-listing-switches "-alh"
      dired-mouse-drag-files t
      display-line-numbers-type 'relative
      register-separator ?+
      default-directory "d:/mini_projects/"
      current-language-environment "English"
      package-archives '(("gnu"    . "https://elpa.gnu.org/packages/")
			 ("nongnu" . "https://elpa.nongnu.org/nongnu/")
			 ("melpa"  . "https://melpa.org/packages/"))

      custom-file (expand-file-name "custom.el" user-emacs-directory))

(require 'package)

(package-initialize)

(load "~/rc.el")

(recentf-mode 1)
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(blink-cursor-mode 0)
(column-number-mode 1)
(global-display-line-numbers-mode 1)
(save-place-mode 1)
(set-register register-separator "\n\n")

(set-face-attribute 'default nil
                    :font "FiraCode Nerd Font"
                    :height 110)

;; Chinese / CJK font
(dolist (charset '(han kana cjk-misc bopomofo))
  (set-fontset-font
   (frame-parameter nil 'font)
   charset
   (font-spec :family "Microsoft YaHei UI"
              :height 100)))

(load-file "~/aklk1ng-theme.el")
(load-theme `aklk1ng t)

(let ((alist '((33 . ".\\(?:\\(?:==\\|!!\\)\\|[!=]\\)")
               (35 . ".\\(?:###\\|##\\|_(\\|[#(?[_{]\\)")
               (36 . ".\\(?:>\\)")
               (37 . ".\\(?:\\(?:%%\\)\\|%\\)")
               (38 . ".\\(?:\\(?:&&\\)\\|&\\)")
               (42 . ".\\(?:\\(?:\\*\\*/\\)\\|\\(?:\\*[*/]\\)\\|[*/>]\\)")
               (43 . ".\\(?:\\(?:\\+\\+\\)\\|[+>]\\)")
               (45 . ".\\(?:\\(?:-[>-]\\|<<\\|>>\\)\\|[<>}~-]\\)")
               (46 . ".\\(?:\\(?:\\.[.<]\\)\\|[.=-]\\)")
               (47 . ".\\(?:\\(?:\\*\\*\\|//\\|==\\)\\|[*/=>]\\)")
               (48 . ".\\(?:x[a-zA-Z]\\)")
               (58 . ".\\(?:::\\|[:=]\\)")
               (59 . ".\\(?:;;\\|;\\)")
               (60 . ".\\(?:\\(?:!--\\)\\|\\(?:~~\\|->\\|\\$>\\|\\*>\\|\\+>\\|--\\|<[<=-]\\|=[<=>]\\||>\\)\\|[*$+~/<=>|-]\\)")
               (61 . ".\\(?:\\(?:/=\\|:=\\|<<\\|=[=>]\\|>>\\)\\|[<=>~]\\)")
               (62 . ".\\(?:\\(?:=>\\|>[=>-]\\)\\|[=>-]\\)")
               (63 . ".\\(?:\\(\\?\\?\\)\\|[:=?]\\)")
               (91 . ".\\(?:]\\)")
               (92 . ".\\(?:\\(?:\\\\\\\\\\)\\|\\\\\\)")
               (94 . ".\\(?:=\\)")
               (119 . ".\\(?:ww\\)")
               (123 . ".\\(?:-\\)")
               (124 . ".\\(?:\\(?:|[=|]\\)\\|[=>|]\\)")
               (126 . ".\\(?:~>\\|~~\\|[>=@~-]\\)")
               )
             ))
  (dolist (char-regexp alist)
    (set-char-table-range composition-function-table (car char-regexp)
                          `([,(cdr char-regexp) 0 font-shape-gstring]))))

(load custom-file 'noerror)

(global-set-key (kbd "C-x C-g") 'find-file-at-point)

(global-set-key (kbd "C-c h")  'windmove-left)
(global-set-key (kbd "C-c l") 'windmove-right)
(global-set-key (kbd "C-c k") 'windmove-up)
(global-set-key (kbd "C-c j") 'windmove-down)

(global-set-key (kbd "M--") 'undo-redo)

(add-hook 'before-save-hook #'delete-trailing-whitespace)
(add-hook 'python-mode-hook #'flymake-mode)
(setq python-flymake-command '("ruff" "check" "--quiet" "--stdin-filename=stdin" "-"))

(use-package flymake
  :bind
  (:map flymake-mode-map
	("M-]" . 'flymake-goto-next-error)
	("M-[" . 'flymake-goto-prev-error)))

;; Require packages
(rc/require-packages 'magit
		     'corfu
		     'nerd-icons-corfu
		     'cape
		     'vertico
		     'marginalia
		     'orderless
		     'colorful-mode
		     'markdown-mode
		     'ansi-color
		     'xterm-color
		     'move-text
		     'multiple-cursors
		     'rust-mode)

;; M-!
(defun my-ansi-colorize-shell-command-output (buf &rest _)
  (when (and (bufferp buf)
             (string= (buffer-name buf) "*Shell Command Output*"))
    (with-current-buffer buf
      (ansi-color-apply-on-region (point-min) (point-max)))))
(advice-add 'display-message-or-buffer :before #'my-ansi-colorize-shell-command-output)

;; M-x shell
(add-hook 'shell-mode-hook
          (lambda ()
            (font-lock-mode -1)
            (make-local-variable 'font-lock-function)
            (setq font-lock-function (lambda (_) nil))
            (remove-hook 'comint-output-filter-functions 'ansi-color-process-output t)
            (add-hook 'comint-preoutput-filter-functions 'xterm-color-filter nil t)))

;; Compilation buffers
(setq compilation-environment '("TERM=xterm-256color"))
(define-advice compilation-filter (:around (f proc string) xterm-color)
  (funcall f proc (xterm-color-filter string)))

;; vertico is better
;; (fido-mode 1)

;; vertico
(use-package vertico
  :config
  (vertico-mode 1))

;; savehist
(use-package savehist
  :after vertico
  :config
  (corfu-history-mode 1)
  (savehist-mode))

;; marginalia
(use-package marginalia
  :after vertico
  :config
  (marginalia-mode 1))

;; eglot
(use-package eglot
  :hook
  ((c-mode
    csharp-mode
    c++-mode
    python-mode
    rust-mode)
   . eglot-ensure)
  :config
  (add-to-list 'eglot-server-programs
               '(csharp-mode . ("OmniSharp" "-lsp")))
  (add-to-list 'eglot-server-programs
               '((c-mode c++-mode) . ("clangd" "--clang-tidy" "--header-insertion-decorators=false")))
  (add-to-list 'eglot-server-programs
               '(python-mode . ("ruff" "server")))
  (add-to-list 'eglot-server-programs
               '(rust-mode . ("rust-analyzer"
                              :initializationOptions
                              (:check (:command "clippy"))))))

(add-hook 'eglot-managed-mode-hook
          (lambda ()
            (eglot-inlay-hints-mode -1)
            (eglot-semantic-tokens-mode -1)))

;; corfu
(use-package corfu
  :custom
  (corfu-auto t)
  (corfu-auto-delay 0.2)
  (corfu-auto-prefix 2)
  (corfu-cycle t)
  (corfu-preview-current nil)
  (corfu-quit-no-match t)
  (corfu-quit-at-boundary t)
  (corfu-max-height 15)
  (corfu-max-width 80)
  :bind
  (:map corfu-map
        ("C-n" . corfu-next)
        ("C-p" . corfu-previous)
        ("C-e" . corfu-quit))
  :init
  (global-corfu-mode 1)
  (corfu-popupinfo-mode)
  :config
  (define-key corfu-map (kbd "RET") nil)
  (define-key corfu-map (kbd "<return>") nil))

;; If `SymbolsNerdFontMono` isn't installed, need to set the font again.
(unless (find-font (font-spec :family "Symbols Nerd Font Mono"))
  (use-package nerd-icons
    :custom
    (nerd-icons-font-family "FiraCode Nerd Font")))

;; nerd-icons-corfu
(use-package nerd-icons-corfu
  :after corfu
  :config
  (add-to-list 'corfu-margin-formatters
               #'nerd-icons-corfu-formatter))

;; orderless
(use-package orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-ignore-case t)
  (completion-category-overrides '((file (styles partial-completion))))
  (completion-category-defaults nil) ;; Disable defaults, use our settings
  (completion-pcm-leading-wildcard t)) ;; Emacs 31: partial-completion behaves like substring

;; cape
(use-package cape
  :bind
  (("M-/" . cape-prefix-map))
  :init
  (add-to-list 'completion-at-point-functions #'cape-dabbrev)
  (add-to-list 'completion-at-point-functions #'cape-file)
  :config
  (defun my/setup-eglot-capf ()
    (setq-local completion-at-point-functions
                (list
                 (cape-capf-super
                  #'eglot-completion-at-point
		  #'cape-dabbrev
                  #'cape-file))))
  (add-hook 'eglot-managed-mode-hook #'my/setup-eglot-capf))

;; colorful-mode
(use-package colorful-mode
  :config
  (global-colorful-mode t)
  (add-to-list 'global-colorful-modes 'helpful-mode))

;; move-text
(use-package move-text
  :ensure t
  :bind
  ("M-p" . move-text-up)
  ("M-n" . move-text-down))

;; multiple-cursors
(use-package multiple-cursors
  :ensure t
  :bind
  ("M-+" . mc/edit-lines)
  ("C-=" . mc/mark-next-like-this)
  ("C--" . mc/mark-previous-like-this)
  ("C-M-=" . mc/mark-all-like-this)
  ("C-\"" . mc/skip-to-next-like-this)
  ("C-:" . mc/skip-to-previous-like-this))
