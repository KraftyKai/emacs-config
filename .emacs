;;; custom-kai --- My preferred custom emacs config
;;; Commentary:


(setq package-archives '(("elpa" . "http://tromey.com/elpa/")
			 ("gnu" . "http://elpa.gnu.org/packages/")
			 ("marmalade" . "http://marmalade-repo.org/packages/")
			 ("melpa" . "https://melpa.org/packages/")))

(setq package-list '(flycheck flycheck-pyflakes cedet ecb fill-column-indicator go-mode go-eldoc auto-complete go-autocomplete polymode web-mode markdown-mode org plantuml-mode flycheck-plantuml w3m disable-mouse magit))

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
   '(exec-path-from-shell python-pylint flycheck-pyflakes fill-column-indicator ecb))
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

;; Web-mode configurations
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

;; Markdown configuration
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; Use for jekyll
(setq web-mode-engines-alist
      '(("liquid"    . "\\.html\\'"))
)

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

(add-hook `c++-mode-hook (lambda () (setq flycheck-gcc-language-standard "c++20")))
(add-hook `c++-mode-hook (lambda () (setq flycheck-clang-language-standard "c++20")))



(add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)
(add-hook 'c-mode-common-hook 'hs-minor-mode)
(add-hook 'python-mode-hook '(lambda ()
			       (setq python-indent 2)))

(add-hook 'python-mode-hook 'hs-minor-mode)

(defadvice goto-line (after expand-after-goto-line
			    activate compile)
  "hideshow-expand affected block when using goto-line in a collapsed buffer"
  (save-excursion
    (hs-show-block)))

(add-hook 'hs-minor-mode-hook '(lambda () (hs-hide-all)))


;; Org mode et el configurations
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)

(setq plantuml-jar-path "/Users/kai/plantuml.jar")
(setq plantuml-default-exec-mode 'jar)
(setq org-plantuml-jar-path "/Users/kai/plantuml.jar")

;; Set org-mode to use python3 instead of just python
(setq org-babel-python-command "python3")

;; Be unsafe, don't warn me before executing blocks :)
(setq org-confirm-babel-evaluate nil)

(with-eval-after-load 'org
  (org-babel-do-load-languages 'org-babel-load-languages '((ruby . t)
							   (plantuml . t)
							   (python . t)
							   (shell . t)
							   ))
  (setq org-startup-indented t)
  (setq org-agenda-files (list "~/org/cpo.org"
                               "~/org/framework.org"
                               "~/org/admin.org"))
)

(with-eval-after-load 'flycheck
  (require 'flycheck-plantuml)
  (flycheck-plantuml-setup))

;; Disable mouse when using gui emacs...
(global-disable-mouse-mode)

;;; .emacs ends here
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
