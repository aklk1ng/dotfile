(defvar rc/package-contents-refreshed nil)

(defun rc/package-refresh-contents-once ()
  (when (not rc/package-contents-refreshed)
    (setq rc/package-contents-refreshed t)
    (package-refresh-contents)))

(defun rc/require-packages (&rest packages)
  (let ((missing (cl-remove-if #'package-installed-p packages)))
    (when (and missing
               (y-or-n-p (format "Install missing packages: %s? "
                                 (mapconcat #'symbol-name missing ", "))))
      (rc/package-refresh-contents-once)
      (dolist (p missing)
        (condition-case err
            (package-install p)
          (error (message "Install `%s' failed: %s" p (error-message-string err))))))))

(defun rc/duplicate-line ()
  "Duplicate current line"
  (interactive)
  (let ((column (- (point) (point-at-bol)))
        (line (let ((s (thing-at-point 'line t)))
                (if s (string-remove-suffix "\n" s) ""))))
    (move-end-of-line 1)
    (newline)
    (insert line)
    (move-beginning-of-line 1)
    (forward-char column)))

(global-set-key (kbd "C-,") 'rc/duplicate-line)

(defun rc/window-resize-swap-mode ()
  (interactive)
  (set-transient-map
   (let ((map (make-sparse-keymap)))
     (define-key map (kbd "h") 'shrink-window-horizontally)
     (define-key map (kbd "l") 'enlarge-window-horizontally)
     (define-key map (kbd "j") 'shrink-window)
     (define-key map (kbd "k") 'enlarge-window)
     (define-key map (kbd "=") 'balance-windows)

     (define-key map (kbd "H") 'windmove-swap-states-left)
     (define-key map (kbd "L") 'windmove-swap-states-right)
     (define-key map (kbd "J") 'windmove-swap-states-down)
     (define-key map (kbd "K") 'windmove-swap-states-up)
     map)
   t nil "Use %k for further adjustment"))



(global-set-key (kbd "C-c w") 'rc/window-resize-swap-mode)
