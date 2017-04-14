;;; custom-kai --- My preferred custom emacs config
;;; Commentary:

(setq package-list '(flycheck flycheck-pyflakes ecb))
(setq package-archives '(("elpa" . "http://tromey.com/elpa/")
			 ("gnu" . "http://elpa.gnu.org/packages/")
			 ("marmalade" . "http://marmalade-repo.org/packages/")))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))
(dolist (package package-list)
  (unless (package-installed-p package)
        (package-install package)))

(require 'package)
;;; Code:
(add-to-list 'load-path
	     "/home/kai/.emacs.d/elpa/ecb-20160101.933/")
(custom-set-variables '(ecb-options-version "2.50"))
(require 'ecb)
(ecb-activate)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line

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