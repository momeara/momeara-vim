
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
;(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(comint-scroll-to-bottom-on-input nil)
 '(package-selected-packages
   '(lsp-ui company lsp-mode web-mode ess magit use-package helm))
 '(safe-local-variable-values
   '((rm-trailing-spaces . t)
     (show-trailing-whitespace . t)
     (rm-trailing-spaces . t))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(global-font-lock-mode 1)


(setq inhibit-splash-screen t)

; short cut keys for compiling
(global-set-key [(f5)] 'compile)
(global-set-key [(f6)] 'recompile)

; like tab expansion for variable names etc.
(global-set-key [f12]         'dabbrev-expand)
(define-key esc-map [f12]     'dabbrev-completion)


(add-to-list 'load-path "~/opt/async")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;; Language Server Protocol ;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; https://emacs-lsp.github.io/lsp-mode/page/performance/
;;; check with `M-x lsp-doctor`
(setq gc-cons-threshold 100000000)
(setq read-process-output-max (* 1024 1024)) ;; 1mb
(setq lsp-completion-provider :capf)

;(lsp-register-client
;  (make-lsp-client :new-connection
;      (lsp-stdio-connection '("R" "--slave" "-e" "languageserver::run()"))
;      :major-modes '(ess-r-mode inferior-ess-r-mode)
;      :server-id 'lsp-R))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;; R Indention ;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;; How to get help ;;;;;;;;;;;;
;;; For help on a variable use "c-h o RET <variable-name>"
;;; For setting style 'live' use "C-c C-e C-s"


;;; Put all customizations before the (require 'ess-site)
(setq ess-offset-arguments 'prev-line)
(setq ess-offset-arguments-newline 'prev-line)
(setq ess-offset-block 'prev-line)
(setq ess-indent-with-fancy-comments nil)
; (setq ess-fancy-comments nil)
(require 'ess-site)
; don't have have underscores automatically converted into "<-"
(ess-toggle-underscore nil)

(setq ess-set-style 'RStudio)
;;; What is in the 'RStudio style?
; (setq ess-indent-offset 4)
; (setq ess-offset-arguments 'prev-line)
; (setq ess-offset-arguments-newline 'prev-line)
; (setq ess-offset-block 'prev-line)
; (setq ess-offset-continued 'straight)
; (setq ess-align-nested-calls t)
; (setq ess-align-arguments-in-calls "function[ 	]*(")
; (setq ess-align-continuations-in-calls t)
; (setq ess-align-blocks t)
; (setq ess-indent-from-lhs 'arguments t)
; (setq ess-indent-from-chain-start t)
; (setq ess-indent-with-fancy-comments t)

; (setq ess-first-continued-statement-offset 2)
; (setq ess-continued-statement-offset 0)))


;(add-to-list 'package-archives
;             '("melpa" . "http://melpa.milkbox.net/packages/") t)


; when two buffers are opened with the same name, they have the first
; unique subdirectory appeneded to the end of the buffer name to help
; distinguish the files
(require 'uniquify)
(setq uniquify-buffer-name-style 'reverse)
(setq uniquify-separator "/")
(setq uniquify-after-kill-buffer-p t) ; rename after killing uniquified
(setq uniquify-ignore-buffers-re "^\\*") ; don't muck with special buffers

; ido mode helps quickly open files, switch buffers etc.
; remember:
;   C-f -> go back to normal find-file
;   C-d -> open dired
;   C-j -> create new file (becuase enter would open the closest matching file)
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)

; put the current function in the bottom buffer
(which-function-mode t)

; C-c o takes you from the cc file to hh file and visa versa
(add-hook 'c-mode-common-hook
  (lambda()
    (local-set-key  (kbd "C-c o") 'ff-find-other-file)))

;; Your init file should contain only one such instance.
;; If there is more than one, they won't work right.


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

  ;; trying this one out for instances like
  ;; typedef
  ;;    foo
  ;;    bar;
  ;; using '+ screws up
  ;; void
  ;;    fun();
  ;;(c-set-offset 'topmost-intro-cont '+)

  ;; tyring this out for instances like
  ;; type<
  ;;    typea > foo;
  (c-set-offset 'template-args-cont '+)
 )
(add-hook 'c-mode-common-hook 'rosetta-c++-mode-hook)


;(defun rosetta-ess-mode-hook ()
;  ;; RosettaCommons Syntax style for S/R code
;
;ftp://ftp.stat.math.ethz.ch/ESS/ESS_html-o/ess_12.html
;http://ess.r-project.org/Manual/ess.html#Indenting
;
; Things to I would like to fix:
;  arguments that are on new lines
; )
;(add-hook 'ess-mode-hook 'rosetta-ess-mode-hook)


(put 'upcase-region 'disabled nil)


(put 'narrow-to-region 'disabled nil)

; auto-complete mode
;;(add-to-list 'load-path "~/.emacs.d")
;;(require 'auto-complete-config)
;;(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
;;(ac-config-default)
;;(setq ess-use-auto-complete t)









;################3
;((OWN
;  (ess-indent-offset . 4)
;  (ess-offset-arguments . open-delim)
;  (ess-offset-arguments-newline . prev-call)
;  (ess-offset-block . prev-line)
;  (ess-offset-continued . straight)
;  (ess-align-nested-calls "ifelse")
;  (ess-align-arguments-in-calls "function[ 	]*(")
;  (ess-align-continuations-in-calls . t)
;  (ess-align-blocks control-flow)
;  (ess-indent-from-lhs arguments fun-decl-opening)
;  (ess-indent-from-chain-start . t)
;  (ess-indent-with-fancy-comments . t))
;
;  (BSD
;  (ess-indent-offset . 8)
;  (ess-offset-arguments . open-delim)
;  (ess-offset-arguments-newline . prev-call)
;  (ess-offset-block . prev-call)
;  (ess-offset-continued . straight)
;  (ess-align-nested-calls "ifelse")
;  (ess-align-arguments-in-calls "function[ 	]*(")
;  (ess-align-continuations-in-calls . t)
;  (ess-align-blocks control-flow)
;  (ess-indent-from-lhs arguments fun-decl-opening)
;  (ess-indent-from-chain-start . t)
;  (ess-indent-with-fancy-comments . t))
;
;  (C++
;  (ess-indent-offset . 4)
;  (ess-offset-arguments . open-delim)
;  (ess-offset-arguments-newline . prev-call)
;  (ess-offset-block . prev-call)
;  (ess-offset-continued . straight)
;  (ess-align-nested-calls "ifelse")
;  (ess-align-arguments-in-calls "function[ 	]*(")
;  (ess-align-continuations-in-calls . t)
;  (ess-align-blocks control-flow)
;  (ess-indent-from-lhs arguments)
;  (ess-indent-from-chain-start . t)
;  (ess-indent-with-fancy-comments . t))
;
;  (CLB
;  (ess-indent-offset . 2)
;  (ess-offset-arguments . open-delim)
;  (ess-offset-arguments-newline . prev-call)
;  (ess-offset-block . prev-line)
;  (ess-offset-continued straight 4)
;  (ess-align-nested-calls "ifelse")
;  (ess-align-arguments-in-calls "function[ 	]*(")
;  (ess-align-continuations-in-calls . t)
;  (ess-align-blocks control-flow)
;  (ess-indent-from-lhs arguments fun-decl-opening)
;  (ess-indent-from-chain-start . t)
;  (ess-indent-with-fancy-comments . t))
;
;  (GNU
;  (ess-indent-offset . 2)
;  (ess-offset-arguments . open-delim)
;  (ess-offset-arguments-newline prev-call 4)
;  (ess-offset-block . prev-line)
;  (ess-offset-continued . straight)
;  (ess-align-nested-calls "ifelse")
;  (ess-align-arguments-in-calls "function[ 	]*(")
;  (ess-align-continuations-in-calls . t)
;  (ess-align-blocks control-flow)
;  (ess-indent-from-lhs arguments fun-decl-opening)
;  (ess-indent-from-chain-start . t)
;  (ess-indent-with-fancy-comments . t))
;
;  (K&R
;  (ess-indent-offset . 5)
;  (ess-offset-arguments . open-delim)
;  (ess-offset-arguments-newline . prev-call)
;  (ess-offset-block . prev-call)
;  (ess-offset-continued . straight)
;  (ess-align-nested-calls "ifelse")
;  (ess-align-arguments-in-calls "function[ 	]*(")
;  (ess-align-continuations-in-calls . t)
;  (ess-align-blocks control-flow)
;  (ess-indent-from-lhs arguments fun-decl-opening)
;  (ess-indent-from-chain-start . t)
;  (ess-indent-with-fancy-comments . t))
;
;  (RRR
;  (ess-indent-offset . 4)
;  (ess-offset-arguments . open-delim)
;  (ess-offset-arguments-newline . prev-call)
;  (ess-offset-block . prev-line)
;  (ess-offset-continued . straight)
;  (ess-align-nested-calls "ifelse")
;  (ess-align-arguments-in-calls "function[ 	]*(")
;  (ess-align-continuations-in-calls . t)
;  (ess-align-blocks control-flow)
;  (ess-indent-from-lhs arguments fun-decl-opening)
;  (ess-indent-from-chain-start . t)
;  (ess-indent-with-fancy-comments . t))
;
;  (RRR+
;  (ess-indent-offset . 4)
;  (ess-offset-arguments . open-delim)
;  (ess-offset-arguments-newline . prev-call)
;  (ess-offset-block . open-delim)
;  (ess-offset-continued . straight)
;  (ess-align-nested-calls "ifelse")
;  (ess-align-arguments-in-calls "function[ 	]*(")
;  (ess-align-continuations-in-calls . t)
;  (ess-align-blocks control-flow)
;  (ess-indent-from-lhs arguments)
;  (ess-indent-from-chain-start)
;  (ess-indent-with-fancy-comments . t))
;
;
;  (RStudio-
;  (ess-indent-offset . 2)
;  (ess-offset-arguments . prev-line)
;  (ess-offset-arguments-newline . prev-line)
;  (ess-offset-block . prev-line)
;  (ess-offset-continued . straight)
;  (ess-align-nested-calls)
;  (ess-align-arguments-in-calls "function[ 	]*(")
;  (ess-align-continuations-in-calls)
;  (ess-align-blocks)
;  (ess-indent-from-lhs arguments)
;  (ess-indent-from-chain-start . t)
;  (ess-indent-with-fancy-comments))
;  
;  (DEFAULT
;  (ess-indent-offset . 2)
;  (ess-offset-arguments . open-delim)
;  (ess-offset-arguments-newline . prev-call)
;  (ess-offset-block . prev-line)
;  (ess-offset-continued . straight)
;  (ess-align-nested-calls "ifelse")
;  (ess-align-arguments-in-calls "function[ 	]*(")
;  (ess-align-continuations-in-calls . t)
;  (ess-align-blocks control-flow)
;  (ess-indent-from-lhs arguments fun-decl-opening)
;  (ess-indent-from-chain-start . t)
;  (ess-indent-with-fancy-comments . t)))




(add-hook 'after-init-hook #'global-flycheck-mode)

