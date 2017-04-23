;;; custom-kai --- My preferred custom emacs config
;;; Commentary:


(setq package-archives '(("elpa" . "http://tromey.com/elpa/")
			 ("gnu" . "http://elpa.gnu.org/packages/")
			 ("marmalade" . "http://marmalade-repo.org/packages/")
			 ("melpa" . "https://melpa.org/packages/")
			 ("gnu" . "http://elpa.gnu.org/packages/")))

(setq package-list '(flycheck flycheck-pyflakes ecb fill-column-indicator))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))
(dolist (package package-list)
  (unless (package-installed-p package)
        (package-install package)))

(require 'package)

;;; Code:
(add-to-list 'load-path
	     "/home/kai/.emacs.d/elpa/ecb-2.40/")
(defvar start-dir (getenv "PWD"))
(defvar start-dir-name (car (last (split-string start-dir "/"))))
(custom-set-variables
 '(ecb-options-version "2.40")
 '(ecb-source-path (list (list start-dir start-dir-name)))
 '(ecb-windows-width 50))
(require 'ecb)
(ecb-activate)

(require 'fill-column-indicator)
(setq fci-rule-width 1)
(setq fci-rule-color "purple")
(setq-default fci-rule-column 80)
(setq-default fci-rule-use-dashes nil)
(add-hook 'after-change-major-mode-hook 'fci-mode)


(add-hook 'after-init-hook #'global-flycheck-mode)


(custom-set-variables
 '(python-guess-indent nil)
  '(python-indent-offset 2))

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
