; -*- mode: Lisp; fill-column: 75; comment-column: 50; -*-

;;;
;;; Emacs initialization file for Rob Jenson
;;; 

;;;
;;; This is where customizations for Emacs are defined.
;;; See: https://www.gnu.org/software/emacs/manual/html_node/emacs/Customization.html
;;;

;;;
;;; Local Elisp files to search in addition to site-lisp directories.
;;;
(add-to-list 'load-path "~/.emacs.d/lisp")

;;;
;;; Keyboard remappings.
;;;

;;; Some terminals have had trouble with Ctrl-@ and
;;; it is a difficult keystroke, so I use Meta-+
;;; to set-mark
(global-set-key "\M-+" 'set-mark-command)

;;; Some terminals use Ctrl-S for flow control
;;; so to search forward I use Ctrl-X f
(global-set-key "\C-xf" 'isearch-forward)

;;; Those terminals had the same problem for
;;; Ctrl-X Ctrl-S to save buffer, so I got rid of
;;; something I never used and set that for "save buffer"
(global-unset-key "\C-x\C-p")
(global-set-key "\C-x\C-p" 'save-buffer)

;;; Again, probably no longer a problem with modern terminal
;;; types, but in the past I needed Ctrl-h for "delete backward char"
;;; so use Ctrl-x h for "help command". I lose "mark whole buffer"
;;; which I have never used.
(global-set-key "\C-h" 'delete-backward-char)
(global-set-key "\C-xh" 'help-command)

;;; I don't remember why I did this one.
(global-set-key "\C-xp" 'fill-region-as-paragraph)

;;;
;;; Some terminals trapped Ctrl-C and I could not exit EMACS. At some
;;; point, I have learned these as the "correct commands" and I don't
;;; remember what the heck the things that I replaced are.
;;;
(global-unset-key "\C-x\C-k")
(global-set-key "\C-x\C-k" 'save-buffers-kill-emacs)

;;;
;;; Most of the time I am writing text, so let's make that the default
;;; file type if the file suffix doesn't clue it.
;;;
(setq default-major-mode 'text-mode)
(setq text-mode-hook 'turn-on-auto-fill)

;;; Show date and time on the mode line
(setq display-timex-day-and-date t)
(display-time)

;;;
;;; For smoother scrolling?
;;;
(setq scroll-step 1)

;;;
;;; How many keystrokes before autosaving
;;;
(setq auto-save-interval 300)

;;;
;;;    For the X- version, use a visible instead of audible
;;; bell.  gives an error message when in non-windowing mode.
(setq visible-bell 1)

;;;
;;; Emacs creates symlinks for locking files that don't get deleted from some NAS systems.
;;;
;;;(setq create-lockfiles nil)

;;;
;;; A major mode for editing PHP code, from https://github.com/ejmr/php-mode
;;;

(autoload 'php-mode "php-mode/php-mode" "Major mode for editing PHP files" t)
(add-to-list 'load-path "~/.emacs.d/lisp/php-mode/skeleton/php-ext.el")
(add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode))

;;;
;;; A major mode for editing Puppet manifests, downloaded
;;;    from: https://github.com/puppetlabs/puppet-syntax-emacs
;;;
(autoload 'puppet-mode "puppet-mode" "Major mode for editing puppet manifests" t)
(add-to-list 'auto-mode-alist '("\\.pp$" . puppet-mode))

;;;
;;; Some keyboard macros
;;;

;;;
;;; And some stuff that I'm not sure where it came from
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
