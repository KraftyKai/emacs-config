;;; custom-kai --- My preferred custom emacs config
;;; Commentary:


(setq package-archives '(("elpa" . "http://tromey.com/elpa/")
			 ("gnu" . "http://elpa.gnu.org/packages/")
			 ("marmalade" . "http://marmalade-repo.org/packages/")
			 ("melpa" . "https://melpa.org/packages/")))

(setq package-list '(flycheck flycheck-pyflakes cedet ecb fill-column-indicator go-mode go-eldoc auto-complete))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))
(dolist (package package-list)
  (unless (package-installed-p package)
        (package-install package)))

(require 'package)

;;; Code:
(add-to-list 'load-path
	     "/home/ubuntu/.emacs.d/elpa/ecb-20160101.933/")
(defvar start-dir (getenv "PWD"))
(defvar start-dir-name (car (last (split-string start-dir "/"))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ecb-options-version "2.50")
 '(ecb-source-path (list (list start-dir start-dir-name)))
 '(ecb-windows-width 50)
 '(package-selected-packages
   (quote
    (exec-path-from-shell python-pylint flycheck-pyflakes fill-column-indicator ecb)))
 '(python-guess-indent nil)
 '(python-indent-offset 2))
(require 'ecb)
(setq stack-trace-on-error t)
(ecb-activate)

(require 'fill-column-indicator)
(setq fci-rule-width 1)
(setq fci-rule-color "purple")
(setq-default fci-rule-column 80)
(setq-default fci-rule-use-dashes nil)
(add-hook 'after-change-major-mode-hook 'fci-mode)

;; Go configurations...
(require 'go-eldoc) ;; Don't need to require, if you install by package.el
(add-hook 'go-mode-hook 'go-eldoc-setup)
(add-to-list 'load-path
	     "/home/ubuntu/.emacs.extra/")

(require 'go-autocomplete)
(require 'auto-complete-config)
(ac-config-default)

(global-flycheck-mode)
(package-install 'exec-path-from-shell)
(exec-path-from-shell-initialize)




(add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)
(add-hook 'python-mode-hook '(lambda ()
			       (setq python-indent 2)))

(add-hook 'python-mode-hook 'hs-minor-mode)

(defadvice goto-line (after expand-after-goto-line
			    activate compile)
  "hideshow-expand affected block when using goto-line in a collapsed buffer"
  (save-excursion
    (hs-show-block)))

(add-hook 'hs-minor-mode-hook '(lambda () (hs-hide-all)))

;;; .emacs ends here
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
