;; manual-install-list
;; * auto-install
;; * gtags
;; * vs-set-c-style.el
;; ** https://myoshida-rp.googlecode.com/svn/trunk/elisp/vs-set-c-style.el

;; auto-install
(require 'auto-install)
(add-to-list 'load-path (expand-file-name "~/.emacs.d/auto-install/"))
;; (auto-install-update-emacswiki-package-name t)
;; (auto-install-from-emacswiki "tabbar.el")
;; (auto-install-from-emacswiki "gtags.el")

;; window
(add-to-list 'default-frame-alist '(height . 50))
(add-to-list 'default-frame-alist '(width . 100))

;; key config
(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "M-<right>") 'tabbar-forward-tab)
(global-set-key (kbd "M-<left>") 'tabbar-backward-tab)

;; general
(show-paren-mode 1)
(column-number-mode 1)
(line-number-mode 1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-startup-screen t)
(setq inhibit-startup-echo-area-message t)
(setq inhibit-startup-message t)
(setq-default tab-width 4 indent-tabs-mode nil)

;; c++
(require 'vs-set-c-style)
(autoload 'vs-set-c-syle "vs-set-c-style")
(add-hook 'c-mode-hook 'vs-set-c-style)
(add-hook 'c++-mode-hook 'vs-set-c-style)

;; gtags
(autoload 'gtags-mode "gtags" "" t)
(setq gtags-mode-hook
      '(lambda ()
         (local-set-key "\M-t" 'gtags-find-tag)
         (local-set-key "\M-r" 'gtags-find-rtag)
         (local-set-key "\M-s" 'gtags-find-symbol)
         (local-set-key "\C-t" 'gtags-pop-stack)
         ))
(add-hook 'c-mode-common-hook
          '(lambda()
             (gtags-mode 1)
             (gtags-make-complete-list)
             ))
             
;; tabbar
(require 'tabbar)
(tabbar-mode 1)
(tabbar-mwheel-mode -1)
(setq tabbar-buffer-groups-function nil)
