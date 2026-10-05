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
