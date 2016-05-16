;;;
;;; Emacs initialization file for Rob Jenson
;;; 
;;; This file has been tweaked and edited and augmented
;;;  for decades with old clues commented out.
;;;

;;; Need some place to store local Elisp files
(add-to-list 'load-path "~/.emacs.d/lisp")
;;;
;;;	The following are a security feature that should
;;; be included by default in everyone's .emacs!
;;;
;;;;(setq inhibit-local-variables t)
;;;;(setq enable-local-variables nil)
;;; I believe it is a security hole to remove the next line:
;;;;(put 'eval-expression 'disabled nil)
;;; Despite RMS's misgivings, set-input-mode seeems :-) to fix the flow-
;;;control problem on the ISN.  Who knows what else it might break!
;;;Of course, it leaves us without a Control-Q key for quote, but
;;; CTRL-S seems to work!
;;;(set-input-mode nil t nil)
;;;(global-unset-key "\C-s")
;;;(global-unset-key "\C-x\C-s")
;;;
;;; Keyboard remappings.
;;;
;;; Problems with Ctrl-@ on non-VT100 terminals:
(global-set-key "\M-+" 'set-mark-command)
;;; CTRL-S belongs to flow control
(global-set-key "\C-xf" 'isearch-forward)
;;; Naturally, C-xC-s will have the same problem. eliminates something useless.
(global-unset-key "\C-x\C-p")
(global-set-key "\C-x\C-p" 'save-buffer)
;;; Use C-xh for help, eliminating "mark whole buffer"
(global-set-key "\C-h" 'delete-backward-char)
(global-set-key "\C-xh" 'help-command)
;;;
(global-set-key "\C-xp" 'fill-region-as-paragraph)
;;;
;;; Problem with CTL-C keystrokes -- need a way to quit emacs
(global-unset-key "\C-x\C-k")
(global-set-key "\C-x\C-k" 'save-buffers-kill-emacs)
;; Nine times out of ten, I'll have to write some memo or other.
;; Make the default mode Text with Auto Fill Set.
(setq default-major-mode 'text-mode)
(setq text-mode-hook 'turn-on-auto-fill)

;; Version control info
;;(setq version-control t)		; Enable numbered backups
;;(setq kept-old-versions 0)              ; Throw out original versions
;;(setq kept-new-versions 5)              ; Keep the five most recent versions
;;(setq delete-old-versions t)            ; "Middle Versions" will be deleted
                                        ; silently!
;;(setq trim-versions-without-asking t)	; delete excess backups silently
;;(setq dired-kept-versions 1)            ; # of versions to keep when
                                        ; deleting files with dired

;; For multi-users of files, use cp instead of mv
;;(setq backup-by-copying-when-linked t)	   ;don't destroy other hard links
;;(setq backup-by-copying-when-mismatch t)   ;preserves owner if not you

;; Show date on the mode line
(setq display-timex-day-and-date t)  ; A flag to make the display more verbose
(display-time)                      ; Display the current time on the modeline

;; Supposedly makes for smoother scrolling
(setq scroll-step 1)
;; Number of keystrokes before auto-saving
(setq auto-save-interval 300)

;;;
;;; Set up the VM (View Mail) Subsystem.  All configuration
;;;   data is drawn from ~/.vm
;;;
;;;(autoload 'vm "vm" "Start VM on your primary inbox." t)
;;;(autoload 'vm-other-frame "vm" "Like `vm' but starts in another frame." t)
;;;(autoload 'vm-visit-folder "vm" "Start VM on an arbitrary folder." t)
;;;(autoload 'vm-visit-virtual-folder "vm" "Visit a VM virtual folder." t)
;;;(autoload 'vm-mode "vm" "Run VM major mode on a buffer" t)
;;;(autoload 'vm-mail "vm" "Send a mail message using VM." t)
;;;(autoload 'vm-submit-bug-report "vm" "Send a bug report about VM." t)

;;;
;;;    Stuff for GNUS
;;;
;;;(setq gnus-select-method '(nntp "news.his.com"))
;;;(setq gnus-local-domain "spotch.com")
;;;(setq gnus-local-organization "Entropy")
;;;(autoload 'gnus "gnus" "Read USENET news." t)
;;;(autoload 'gnus-post-news "gnuspost.el" "Post a USNET message." t)
;;;(setq gnus-default-article-saver 'gnus-Subject-save-in-mail)
;;;
;;;    Stuff for Mailcrypt
;;;
;;;(load-library "mailcrypt")
;;(mc-setversion "gpg")   ; for PGP 2.6 (default); also "5.0" and "gpg"

;;(autoload 'mc-install-write-mode "mailcrypt" nil t)
;;(autoload 'mc-install-read-mode "mailcrypt" nil t)
;;(add-hook 'mail-mode-hook 'mc-install-write-mode)

;(setq mc-pgp-keydir "/home/squash1/robjen/gnupg")
;(setq mc-gpg-path "/usr/local/bin/gpg2")
;(setq mc-gpg-user-id "robjen-2002-p")
;(setq mc-gpg-display-snarf-output t)
;(setq mc-passwd-timeout 0)
;(setq mc-pgp-fetch-methods
;      '(mc-pgp-fetch-from-keyrings mc-pgp-fetch-from-http))
;(setq mc-pgp-fetch-keyring-list
;      '("/home/squash1/robjen/.pgp/pubring.pkr" "/home/squash1/robjen/.pgp/pubring.pgp")) 
;
; Hook mailcrypt into VM:
;
;(add-hook 'vm-mode-hook 'mc-install-read-mode)
;(add-hook 'vm-summary-mode-hook 'mc-install-read-mode)
;(add-hook 'vm-virtual-mode-hook 'mc-install-read-mode)
;(add-hook 'vm-mail-mode-hook 'mc-install-write-mode)
;
; Hook mailcrypt into GNUS:
;
;(add-hook 'gnus-summary-mode-hook 'mc-install-read-mode)
;(add-hook 'news-reply-mode-hook 'mc-install-write-mode)
;;;
;;;    Kiwi
;;;
;;(autoload 'irc "Kiwi" "Internet Relay Chat Client." t nil)
;;;
;;(autoload 'finger "finger" "Finger Client" t nil)
;;;
;;;    For the X- version, use a visible instead of audible
;;; bell.  gives an error message when in non-windowing mode.
(setq visible-bell 1)

;;;(autoload 'calculator "calculator" "Run the Emacs calculator." t)
;;;(global-set-key [(control return)] 'calculator)

;;;
;;; Enable some more features ... normally Emacs tries to edit your
;;; .emacs file for you ... but I keep mine in RCS
;;;
;;;(put 'narrow-to-region 'disabled nil)
;;;(put 'downcase-region 'disabled nil)

;;; Apparently Emacs creates these symlinks that don't get deleted from some NAS systems
;;;
;;;(setq create-lockfiles nil)

;;;
;;; A major mode for editing CSS, downloaded from:
;;;   http://www.garshol.priv.no/download/software/css-mode/css-mode.el
;;;

;;;(autoload 'css-mode "css-mode")
;;;(add-to-list 'auto-mode-alist '("\\.css\\'" . css-mode))

;;;
;;; A major mode for editing PHP code, downloaded from:
;;;   http://php-mode.sourceforge.net/
;;;

;;;(autoload 'php-mode "php-mode" "Major mode for editing PHP files" t)
;;;(add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode))

;;;
;;; A major mode for editing Ruby programs as well as Rakefiles
;;;
(autoload 'ruby-mode "ruby-mode" "Major mode for ruby files" t)
(add-to-list 'auto-mode-alist
	     '("\\.\\(?:gemspec\\|irbrc\\|gemrc\\|rake\\|rb\\|ru\\|thor\\)\\'" . ruby-mode))
(add-to-list 'auto-mode-alist
	     '("\\(Capfile\\|Gemfile\\(?:\\.[a-zA-Z0-9._-]+\\)?\\|[rR]akefile\\)\\'" . ruby-mode))

(add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))

;;;
;;; Automatic indentation in ruby-mode
;;;
(add-hook 'ruby-mode-hook (lambda () (local-set-key "\r" 'newline-and-indent)))

;;;
;;; If you want to run Ruby inside Emacs:
;;;
(require 'inf-ruby)

;;;
;;; Electric commands, which can insert some text automatically
;;;
(require 'ruby-electric)
(add-hook 'ruby-mode-hook (lambda () (ruby-electric-mode t)))

;;;
;;; A major mode for editing Puppet manifests, downloaded
;;;    from: https://github.com/puppetlabs/puppet-syntax-emacs
;;;
(autoload 'puppet-mode "puppet-mode" "Major mode for editing puppet manifests" t)
(add-to-list 'auto-mode-alist '("\\.pp$" . puppet-mode))

;;; Some keyboard macros
;;;


(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(gud-gdb-command-name "gdb --annotate=1")
 '(large-file-warning-threshold nil)
 '(safe-local-variable-values (quote ((no-auto-fill-mode . 1) (auto-fill-mode . 0)))))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
