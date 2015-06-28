;;; Matt's Emacs init.el ;;;

(require 'package)
(add-to-list 'package-archives
	     '("melpa-stable" . "http://stable.melpa.org/packages/") t)
;(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)
(if (not (package-installed-p 'use-package))
	(progn
		(package-refresh-contents)
      (package-install 'use-package)))
(require 'use-package)

(use-package helm
	:ensure t)
	
(use-package magit
	:ensure t)


(use-package ess
	:ensure t
	:config
	(ess-toggle-underscore nil)
	(setq ess-fancy-comments nil))

	
(use-package comint
	:config
	(setq comint-scroll-to-bottom-on-input t)
	(setq comint-scroll-to-bottom-on-output t)
	(setq comint-move-point-for-output t))

; when two buffers are opened with the same name, they have the first
; unique subdirectory appeneded to the end of the buffer name to help
; distinguish the files
(use-package uniquify
	:config
	(setq uniquify-buffer-name-style 'reverse)
	(setq uniquify-separator "/")
	(setq uniquify-after-kill-buffer-p t) ; rename after killing uniquified         
	(setq uniquify-ignore-buffers-re "^\\*") ; don't muck with special buffers 

; ido mode helps quickly open files, switch buffers etc.
; remember:
;   C-f -> go back to normal find-file
;   C-d -> open dired
;   C-j -> create new file (becuase enter would open the closest matching file)
(use-package ido
	:ensure t
	:config
	(setq ido-enable-flex-matching t)
	(ido-mode t))

(use-package web-mode
	:ensure t
	:config
	(put 'narrow-to-region 'disabled nil))


; Enable syntax hilighting
(global-font-lock-mode 1)
(setq inhibit-splash-screen t)

; short cut keys for compiling
(global-set-key [(f5)] 'compile)
(global-set-key [(f6)] 'recompile)

; like tab expansion for variable names etc.
(global-set-key [f12]         'dabbrev-expand)
(define-key esc-map [f12]     'dabbrev-completion)

(put 'upcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)


; put the current function in the bottom buffer
(which-function-mode t)

; C-c o takes you from the cc file to hh file and visa versa
(add-hook 'c-mode-common-hook
  (lambda()
    (local-set-key  (kbd "C-c o") 'ff-find-other-file)))

;; Your init file should contain only one such instance.
;; If there is more than one, they won't work right.
(custom-set-variables
 '(safe-local-variable-values (quote ((rm-trailing-spaces . t) (show-trailing-whitespace . t) (rm-trailing-spaces . t)))))

; have tabbing in c++ mode work like it should with Rosetta
; if you find a place where it isn't working right
; do C-c C-s and it will tell you what syntax element you are in
; then add a c-set-offset command   -> '+ is one tab stop
(defun rosetta-c++-mode-hook ()
  ;; RosettaCommons Syntax style for C++ code

  (c-set-offset 'arglist-intro '+)
  (c-set-offset 'arglist-close 0)
  (c-set-offset 'arglist-cont-nonempty '+)
  (c-set-offset 'innamespace 0)
  (c-set-offset 'statement-cont '+)
  (c-set-offset 'stream-op '0)
  (c-set-offset 'defun-block-intro '+)
  (c-set-offset 'template-args-cont '+)
 )
(add-hook 'c-mode-common-hook 'rosetta-c++-mode-hook)




