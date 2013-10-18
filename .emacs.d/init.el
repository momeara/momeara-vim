

; Enable syntax hilighting
(global-font-lock-mode 1)


(setq inhibit-splash-screen t)

; short cut keys for compiling
(global-set-key [(f5)] 'compile)
(global-set-key [(f6)] 'recompile)

; like tab expansion for variable names etc.
(global-set-key [f12]         'dabbrev-expand)
(define-key esc-map [f12]     'dabbrev-completion)


; ESS is the mode for working with R files
(setq load-path (cons "/home/momeara/opt/ESS/lisp" load-path))

(add-to-list 'load-path "~/.emacs.d")

(require 'ess-site)
; don't have have underscores automatically converted into "<-"
(ess-toggle-underscore nil)
(setq ess-fancy-comments nil)

; In ESS with C-c C-r scroll buffer to the end of the input
; http://stackoverflow.com/questions/2710442/in-ess-emacs-how-can-i-get-the-r-process-buffer-to-scroll-to-the-bottom-after-a
;(setq comint-scroll-to-bottom-on-input t)
;(setq comint-scroll-to-bottom-on-output t)
;(setq comint-move-point-for-output t)

;ess-brace-imaginary-offset
;; Extra indentation (over sub-block indentation) for block following
;; an open brace which follows on the same line as a statement.

;ess-brace-offset
;; Extra indentation for braces, compared with other text in same context.

;ess-continued-statement-offset
;; Extra indent for lines not starting new statements.

;ess-continued-brace-offset
;; Extra indent for substatements that start with open-braces. This is
;; in addition to ess-continued-statement-offset.

;ess-arg-function-offset
;; Extra indent for arguments of function foo when it is called as the
;; value of an argument to another function in arg=foo(...) form. If
;; not number, the statements are ;;indented at open-parenthesis
;; following foo.

;ess-expression-offset
;; Extra indent for internal substatements of the call to expression()
;; specified in obj <- expression(...)  form. If not a number, the
;; statements are indented at open-parenthesis following `expression'.

;ess-else-offset
;; Extra indentation of the else clause with respect to the corresponding if.




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
;
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
  
  ;; trying this one out for instances like
  ;; typedef
  ;; 	foo
  ;;	bar;
  ;; using '+ screws up
  ;; void
  ;;    fun();
  ;;(c-set-offset 'topmost-intro-cont '+)

  ;; tyring this out for instances like
  ;; type<
  ;; 	typea > foo;
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

(setq load-path (cons "/home/momeara/opt/" load-path))
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html$" . web-mode))
(put 'narrow-to-region 'disabled nil)
