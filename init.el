;; init.el --- Emacs configuration

;; INSTALL PACKAGES
;; --------------------------------------

(require 'package)

(add-to-list 'package-archives
       '("melpa" . "http://melpa.org/packages/") t)

(add-to-list 'package-archives
             '("elpy" . "http://jorgenschaefer.github.io/packages/"))

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar myPackages
  '(better-defaults
   ein ;; add the ein package (Emacs ipython notebook)
   flycheck
    material-theme))

(mapc #'(lambda (package)
    (unless (package-installed-p package)
      (package-install package)))
      myPackages)

(package-initialize)
(elpy-enable)
(elpy-use-ipython)
;;(autoload 'adoc-mode "adoc-mode" nil t)

(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; LaTeX/AucTeX 

(setq-default TeX-master nil) ; Query for master file.

(defun insert-frac ()
  "We insert  \\dfrac{}{} and position point before the first right brace."
  (interactive)
  (progn
    (insert "\\dfrac{}{}")
    (backward-char)
    (backward-char)
    (backward-char)))
    
(global-set-key "\C-cf"   'insert-frac)

;; BASIC CUSTOMIZATION
;; --------------------------------------

(setq inhibit-startup-message t) ;; hide the startup message
(load-theme 'material t) ;; load material theme
(global-linum-mode t) ;; enable line numbers globally

;; init.el ends here
