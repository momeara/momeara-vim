(require 'package)

;; find package information from following archives
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("melpa" . "http://melpa.org/packages/")))

;; Initialise packages
(package-initialize)

;; get latest package information
(package-refresh-contents)

(mapcar (lambda (package)
          ; install package if not already installed
          (unless (package-installed-p package)
            (package-install package)))

        ; list of packages to be installed
        '(magit
	  ess
	  flycheck
	  lsp-mode
	  company))
