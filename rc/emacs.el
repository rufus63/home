(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes (quote (tsdh-light)))
 '(delete-selection-mode t)
 '(global-linum-mode t)
 '(indent-tabs-mode nil)
 '(python-indent 2)
 '(show-paren-mode t)
 '(standard-indent 2)
 '(tab-width 2))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(add-to-list 'load-path "~/github/scala-dist/tool-support/src/emacs")
(require 'scala-mode-auto)

(load-file "~/.emacs.d/thrift.el")
(require 'thrift-mode)

(load-file "~/.emacs.d/etags-table.el")
(require 'etags-table)
(setq etags-table-search-up-depth 10)

;;BEGIN From http://www.emacswiki.org/emacs/EtagsSelect
;;load the etags-select.el source code
(load-file "~/.emacs.d/etags-select.el")
;;binding the key
(global-set-key "\M-?" 'etags-select-find-tag-at-point)
(global-set-key "\M-." 'etags-select-find-tag)

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
