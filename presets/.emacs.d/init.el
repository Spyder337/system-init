;;  Initialize package manager
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(require 'company)
;;  Add package requires
(use-package company
  :defer t
  )

(use-package bicycle
  :after outline
  :bind(:map outline-minor-mode-map
	     ([C-tab] . bicycle-cycle)
	     ([S-tab] . bicycle-cycle)
	     )
  )

(use-package prog-mode
  :config
  (add-hook 'prog-mode-hook 'enable-tabs)
  (add-hook 'prog-mode-hook 'company-mode)
  (add-hook 'prog-mode-hook 'outline-minor-mode)
  (add-hook 'prog-mode-hook 'hs-minor-mode)
  )

;;  Variables
(setq custom-tab-width 2)
(setq sh-basic-offset custom-tab-width
      sh-indentation custom-tab-width
      )

;;  Tab Functions
(defun disable-tabs () (setq indent-tabs-mode nil))
(defun enable-tabs ()
  (local-set-key (kbd "TAB") 'tab-to-tab-stop)
  (setq indent-tabs-mode t)
  (setq tab-width custom-tab-width)
  )

;;  Make backspace delete the tab instead of space
(setq backward-delete-char-untabify-method 'hungry)

;;  Disable indenting previous line on return
(setq-default electric-indent-inhibit t)

;;  Hooks
;;    lisp-mode-hook is for only lisp files.
(add-hook 'lisp-mode-hook 'disable-tabs)
(add-hook 'emacs-lisp-mode-hook 'disable-tabs)

;;  Package Manager Variables
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(package-selected-packages '(company)))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
  )
