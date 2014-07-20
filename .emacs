;;use Unicode(UTF8) on Mac OS X
(setenv "LC_CTYPE" "UTF-8")
(add-to-list 'load-path
	     "~/.emacs.d/packages/yasnippet")
(require 'yasnippet)
;;(yas/initialize)
(yas/load-directory "~/.emacs.d/packages/yasnippet/snippets")
(yas-global-mode 1)

(add-to-list 'load-path "~/.emacs.d/packages")
(add-hook 'find-file-hook 'flymake-find-file-hook)
(when (load "flymake" t)
  (defun flymake-pyflakes-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
		       'flymake-create-temp-inplace))
	   (local-file (file-relative-name
			temp-file
			(file-name-directory buffer-file-name))))
      (list "pycheckers" (list local-file))))
  (add-to-list 'flymake-allowed-file-name-masks
	       '("\\.py\\'" flymake-pyflakes-init)))
(load-library "flymake-cursor")
(global-set-key [f10] 'flymake-goto-prev-error)
(global-set-key [f11] 'flymake-goto-next-error)
;;=========================
;; Config By MitchellChu.
;; Config ipython
;;=========================
(require 'python)
(setq
 python-shell-interpreter "ipython"
 python-shell-interpreter-args ""
 python-shell-prompt-regexp "In \\[[0-9]+\\]: "
 python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
 python-shell-completion-setup-code
 "from IPython.core.completerlib import module_completion"
 python-shell-completion-module-string-code
 "';'.join(module_completion('''%s'''))\n"
 python-shell-completion-string-code
 "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")
;;============================
;;Load pymacs and ropemacs
;;============================
(add-to-list 'load-path
	     "~/.emacs.d/packages/pymacs")
(require 'pymacs)
;; add by mitchell Chu
(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)
;; end
(pymacs-load "ropemacs" "rope-")
;; B2
(setq repemacs-enable-autoimport t)
;; E2
(setq ropemacs-confirm-saving 'nil)
;;============================
;;disable ropemacs shortcuts to prevent key redefine.
;;use ropemacs prefix key.
;;============================
(setq ropemacs-enable-shortcuts nil)
(setq ropemacs-local-prefix "C-c C-p")
;;============================
;; load auto-complete
;;============================
(add-to-list 'load-path
	     "~/.emacs.d/packages/auto-complete-1.3.1")
(require 'auto-complete-config)
(ac-config-default)
(add-to-list 'ac-dictionary-directories
	     "~/.emacs.d/packages/auto-complete-1.3.1/ac-dict")
;;============================
;;Browse the python documentation
;;using info
;; fix the issue which [C-h,s] not work correctly in 'python-mode'
;;============================
(add-to-list 'load-path
	     "~/.emacs.d/packages/pydoc-info-0.2")
(require 'pydoc-info)
;; (require 'info-look)
(info-lookup-add-help
 :mode 'python-mode
 ;; :regexp "[[:alnum:]_]+"
 :parse-rule 'pydoc-info-python-symbol-at-point
 :doc-spec
 '(("(python)Index" pydoc-info-lookup-transform-entry)
   ("(sphinx)Index" pydoc-info-lookup-transform-entry)))

;; 启用行号
(global-linum-mode 1) ; always show line number on buffer
(setq linum-format "%4d | ")  ; line number's format

;; 启用winner-mode
;; 让窗口可以redo/undo
(when (fboundp 'winner-mode)
  (winner-mode 1))

;; 启用WindMove
;; 窗口间移动使用Shift + 方向键，代替原有的C-x o
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings)
  (global-set-key (kbd "C-c C-w <left>")  'windmove-left)
  (global-set-key (kbd "C-c C-w <right>") 'windmove-right)
  (global-set-key (kbd "C-c C-w <up>")    'windmove-up)
  (global-set-key (kbd "C-c C-w <down>")  'windmove-down))

;; 启用Emacs-Window-Manager

;;这里启用markdown mode
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editting Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;;============================
;; Config by emacs
;; enable manoj-dark themes.
;;============================
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#ad7fa8" "#8cc4ff" "#eeeeec"])
 '(custom-enabled-themes (quote (manoj-dark))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
