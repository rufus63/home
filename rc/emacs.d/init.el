(setq ring-bell-function 'ignore)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

;;; Steve Yegge's js2-mode
(add-to-list 'load-path "~/rc/emacs.d/elpa/packages/js2-mode-20140114")
(autoload 'js2-mode "js2-mode" "Major mode for editing Javascript and JSON." t)
(add-to-list 'auto-mode-alist '("\\.js(on)?\\'" . js2-mode))
;; (add-to-list 'auto-mode-alist '("\\.json\\'" . js2-mode))

;;; use groovy-mode when file ends in .groovy or has #!/bin/groovy at start
(add-to-list 'load-path "~/rc/emacs.d/Emacs-Groovy-Mode")
(autoload 'groovy-mode "groovy-mode" "Major mode for editing Groovy code." t)
(add-to-list 'auto-mode-alist '("\\.gradle\\'" . groovy-mode))
(add-to-list 'auto-mode-alist '("\\.groovy\\'" . groovy-mode))
(add-to-list 'interpreter-mode-alist '("groovy" . groovy-mode))

;;; make Groovy mode electric by default.
(add-hook 'groovy-mode-hook
          '(lambda ()
             (require 'groovy-electric)
             (groovy-electric-mode)))

;; (add-to-list 'load-path "emacs-starter-kit")
;; (load-file "~/github/emacs-starter-kit/init.el")

;; Commented out/disabled because delete char wasn't killing
;; the selected region as expected
(add-to-list 'load-path "~/rc/emacs.d/auto-indent-mode.el")
(require 'auto-indent-mode)
(setq auto-indent-on-visit-file nil) ;; If you want auto-indent on for files
;; (auto-indent-global-mode)
(autoload 'auto-indent-delete-char "auto-indent-mode" "" t)
;; (define-key global-map [remap delete-char] 'auto-indent-delete-char)
(autoload 'auto-indent-kill-line "auto-indent-mode" "" t)
;; (define-key global-map [remap kill-line] 'auto-indent-kill-line)

(add-to-list 'load-path "~/rc/emacs.d/emacs-avro")
(autoload 'avdl-mode "avdl-mode" "Major mode for editing Avro JSON schemas." t)
(add-to-list 'auto-mode-alist '("\\.avdl\\'" . avdl-mode))
;; (require 'avdl-mode)


;; Load and configure SLIME
;; (add-to-list 'load-path "~/github/slime")
;; (require 'slime)
;; (eval-after-load 'slime '(setq slime-protocol-version 'ignore))
;; (slime-setup '(slime-repl))
;;
;; ;; Load a major mode for editing Clojure code.
;; (add-to-list 'load-path "~/github/clojure-mode")
;; (require 'clojure-mode)
;; (require 'clojure-test-mode) ;; requires slime
;;
;; (add-to-list 'load-path "~/github/scala-dist/tool-support/src/emacs")
;; (require 'scala-mode-auto)

(load-file "~/rc/emacs.d/thrift.el")
(require 'thrift-mode)
(add-to-list 'auto-mode-alist '("\\.thrift\\'" . thrift-mode))

(load-file "~/rc/emacs.d/etags-table.el")
(require 'etags-table)
(setq etags-table-search-up-depth 10)

;;BEGIN From http://www.emacswiki.org/emacs/EtagsSelect
;;load the etags-select.el source code
(load-file "~/rc/emacs.d/etags-select.el")
;;binding the key
(global-set-key "\M-?" 'etags-select-find-tag-at-point)
(global-set-key "\M-." 'etags-select-find-tag)

(add-hook 'java-mode-hook
          (lambda ()
            "Treat Java 1.5 @-style annotations as comments."
            (setq c-comment-start-regexp "(@|/(/|[*][*]?))")
            (modify-syntax-entry ?@ "< b" java-mode-syntax-table)))

;; See https://marmalade-repo.org/packages/python-mode
(add-to-list 'load-path "~/rc/emacs.d/python-mode-6.1.3/")
(setq py-install-directory "~/rc/emacs.d/python-mode-6.1.3/")
(require 'python-mode)
(setq py-indent-offset 4)

(defun jds-find-tags-file ()
  "recursively searches each parent directory for a file named 'TAGS' and returns the
path to that file or nil if a tags file is not found. Returns nil if the buffer is
not visiting a file"
  (progn
      (defun find-tags-file-r (path)
         "find the tags file from the parent directories"
         (let* ((parent (file-name-directory path))
                (possible-tags-file (concat parent "TAGS")))
           (cond
             ((file-exists-p possible-tags-file) (throw 'found-it possible-tags-file))
             ((string= "/TAGS" possible-tags-file) (error "no tags file found"))
             (t (find-tags-file-r (directory-file-name parent))))))

    (if (buffer-file-name)
        (catch 'found-it
          (find-tags-file-r (buffer-file-name)))
        (error "buffer is not visiting a file"))))

(defun jds-set-tags-file-path ()
  "calls `jds-find-tags-file' to recursively search up the directory tree to find
a file named 'TAGS'. If found, set 'tags-table-list' with that path as an argument
otherwise raises an error."
  (interactive)
  (setq tags-table-list (cons (jds-find-tags-file) tags-table-list)))

;; delay search the TAGS file after open the source file
(add-hook 'emacs-startup-hook
	'(lambda () (jds-set-tags-file-path)))
;;END From http://www.emacswiki.org/emacs/EtagsSelect
