;;; anything-complete.el --- completion with anything
;; $Id: anything-complete.el,v 1.58 2009/10/01 03:07:44 rubikitch Exp rubikitch $

;; Copyright (C) 2008  rubikitch

;; Author: rubikitch <rubikitch@ruby-lang.org>
;; Keywords: matching, convenience, anything
;; URL: http://www.emacswiki.org/cgi-bin/wiki/download/anything-complete.el

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Commentary:

;; Completion with Anything interface.

;;; Commands:
;;
;; Below are complete command list:
;;
;;  `anything-lisp-complete-symbol'
;;    `lisp-complete-symbol' replacement using `anything'.
;;  `anything-lisp-complete-symbol-partial-match'
;;    `lisp-complete-symbol' replacement using `anything' (partial match).
;;  `anything-apropos'
;;    `apropos' replacement using `anything'.
;;  `anything-read-string-mode'
;;    If this minor mode is on, use `anything' version of `completing-read' and `read-file-name'.
;;  `anything-complete-shell-history'
;;    Select a command from shell history and insert it.
;;
;;; Customizable Options:
;;
;; Below are customizable option list:
;;

;; * `anything-lisp-complete-symbol', `anything-lisp-complete-symbol-partial-match':
;;     `lisp-complete-symbol' with `anything'
;; * `anything-apropos': `apropos' with `anything'
;; * `anything-complete-shell-history': complete from .*sh_history
;; * Many read functions:
;;     `anything-read-file-name', `anything-read-buffer', `anything-read-variable',
;;     `anything-read-command', `anything-completing-read'
;; * `anything-read-string-mode' replaces default read functions with anything ones.
;; * Many anything sources:
;;     [EVAL IT] (occur "defvar anything-c-source")

;;; Installation:

;; Put anything-complete.el to your load-path.
;; The load-path is usually ~/elisp/.
;; It's set in your ~/.emacs like this:
;; (add-to-list 'load-path (expand-file-name "~/elisp"))
;;
;; Then install dependencies.
;; 
;; Install anything-match-plugin.el (must).
;; M-x install-elisp http://www.emacswiki.org/cgi-bin/wiki/download/anything-match-plugin.el
;;
;; shell-history.el / shell-command.el would help you (optional).
;; M-x install-elisp http://www.emacswiki.org/cgi-bin/wiki/download/shell-history.el
;; M-x install-elisp http://www.emacswiki.org/cgi-bin/wiki/download/shell-command.el
;;
;; If you want `anything-execute-extended-command' to show
;; context-aware commands, use anything-kyr.el and
;; anything-kyr-config.el (optional).
;;
;; M-x install-elisp http://www.emacswiki.org/cgi-bin/wiki/download/anything-kyr.el
;; M-x install-elisp http://www.emacswiki.org/cgi-bin/wiki/download/anything-kyr-config.el

;; And the following to your ~/.emacs startup file.
;;
;; (require 'anything-complete)
;; ;; Automatically collect symbols by 150 secs
;; (anything-lisp-complete-symbol-set-timer 150)
;; ;; replace completion commands with `anything'
;; (anything-read-string-mode 1)
;; ;; Bind C-o to complete shell history
;; (anything-complete-shell-history-setup-key "\C-o")

;;; History:

;; $Log: anything-complete.el,v $
;; Revision 1.58  2009/10/01 03:07:44  rubikitch
;; Fix an error in `anything-find-file'. Thanks to troter.
;; http://d.hatena.ne.jp/troter/20090929/1254199115
;;
;; Revision 1.57  2009/08/02 04:19:52  rubikitch
;; New variable: `anything-complete-persistent-action'
;;
;; Revision 1.56  2009/07/26 21:25:04  rubikitch
;; New variable: `anything-completing-read-use-default'
;; New variable: `anything-completing-read-history-first'
;; `anything-completing-read', `anything-read-file-name': history order bug fix
;;
;; Revision 1.55  2009/07/19 07:33:33  rubikitch
;; `anything-execute-extended-command': adjust to keyboard macro command
;;
;; Revision 1.54  2009/06/29 15:13:02  rubikitch
;; New function: `anything-complete-shell-history-setup-key'
;;
;; Revision 1.53  2009/06/24 15:37:50  rubikitch
;; `anything-c-source-complete-shell-history': require bug fix
;;
;; Revision 1.52  2009/05/30 05:04:30  rubikitch
;; Set `anything-execute-action-at-once-if-one' to t
;;
;; Revision 1.51  2009/05/25 18:57:22  rubikitch
;; Removed experimental tags
;;
;; Revision 1.50  2009/05/06 12:34:45  rubikitch
;; `anything-complete': target is default input.
;;
;; Revision 1.49  2009/05/04 14:51:18  rubikitch
;; use `define-anything-type-attribute' to add `anything-type-attributes' entry.
;;
;; Revision 1.48  2009/05/03 19:07:22  rubikitch
;; anything-complete: `enable-recursive-minibuffers' = t
;;
;; Revision 1.47  2009/05/03 18:42:23  rubikitch
;; Remove *-partial-match sources.
;; They are aliased for compatibility.
;;
;; Revision 1.46  2009/05/03 18:33:35  rubikitch
;; Remove dependency of `ac-candidates-in-buffer'
;;
;; Revision 1.45  2009/04/20 16:24:33  rubikitch
;; Set anything-samewindow to nil for in-buffer completion.
;;
;; Revision 1.44  2009/04/18 10:07:35  rubikitch
;; * auto-document.
;; * Use anything-show-completion.el if available.
;;
;; Revision 1.43  2009/02/27 14:45:26  rubikitch
;; Fix a read-only bug in `alcs-make-candidates'.
;;
;; Revision 1.42  2009/02/19 23:04:33  rubikitch
;; * update doc
;; * use anything-kyr if any
;;
;; Revision 1.41  2009/02/19 22:54:29  rubikitch
;; refactoring
;;
;; Revision 1.40  2009/02/06 09:19:08  rubikitch
;; Fix a bug when 2nd argument of `anything-read-file-name' (DIR) is not a directory.
;;
;; Revision 1.39  2009/01/28 20:33:31  rubikitch
;; add persistent-action for `anything-read-file-name' and `anything-read-buffer'.
;;
;; Revision 1.38  2009/01/08 19:28:33  rubikitch
;; `anything-completing-read': fixed a bug when COLLECTION is a non-nested list.
;;
;; Revision 1.37  2009/01/02 15:08:03  rubikitch
;; `anything-execute-extended-command': show commands which are not collected.
;;
;; Revision 1.36  2008/11/27 08:12:36  rubikitch
;; `anything-read-buffer': accept empty buffer name
;;
;; Revision 1.35  2008/11/02 06:30:06  rubikitch
;; `anything-execute-extended-command': fixed a bug
;;
;; Revision 1.34  2008/10/30 18:45:27  rubikitch
;; `arfn-sources': use `file-name-history' instead
;;
;; Revision 1.33  2008/10/30 16:39:17  rubikitch
;; *** empty log message ***
;;
;; Revision 1.32  2008/10/30 11:09:17  rubikitch
;; New command: `anything-find-file'
;;
;; Revision 1.31  2008/10/30 10:29:56  rubikitch
;; `ac-new-input-source', `ac-default-source', `acr-sources', `arfn-sources', `arb-sources': changed args
;;
;; Revision 1.30  2008/10/30 09:33:50  rubikitch
;; `anything-execute-extended-command': fixed a bug
;;
;; Revision 1.29  2008/10/27 10:55:55  rubikitch
;; New command: `anything-execute-extended-command'
;;
;; Revision 1.28  2008/10/27 10:41:33  rubikitch
;; use linkd tag (no code change)
;;
;; Revision 1.27  2008/10/21 18:02:39  rubikitch
;; `anything-noresume': restore `anything-last-buffer'
;;
;; Revision 1.26  2008/10/03 09:55:45  rubikitch
;; anything-read-file-name bug fix
;;
;; Revision 1.25  2008/09/30 22:49:22  rubikitch
;; `anything-completing-read': handle empty input.
;;
;; Revision 1.24  2008/09/22 09:15:03  rubikitch
;; *** empty log message ***
;;
;; Revision 1.23  2008/09/22 09:12:42  rubikitch
;; set `anything-input-idle-delay'.
;;
;; Revision 1.22  2008/09/20 20:27:46  rubikitch
;; s/anything-attr/anything-attr-defined/ because of `anything-attr' change
;;
;; Revision 1.21  2008/09/15 17:31:34  rubikitch
;; *** empty log message ***
;;
;; Revision 1.20  2008/09/14 15:20:12  rubikitch
;; set `anything-input-idle-delay'.
;;
;; Revision 1.19  2008/09/12 02:56:33  rubikitch
;; Complete functions using `anything' restore `anything-last-sources'
;; and `anything-compiled-sources' now, because resuming
;; `anything'-complete session is useless.
;;
;; Revision 1.18  2008/09/10 23:27:09  rubikitch
;; Use *anything complete* buffer instead
;;
;; Revision 1.17  2008/09/10 09:59:22  rubikitch
;; arfn-sources: bug fix
;;
;; Revision 1.16  2008/09/10 09:40:31  rubikitch
;; arfn-sources: paren bug fix
;;
;; Revision 1.15  2008/09/09 01:19:49  rubikitch
;; add (require 'shell-history)
;;
;; Revision 1.14  2008/09/05 13:59:39  rubikitch
;; bugfix
;;
;; Revision 1.13  2008/09/05 13:50:14  rubikitch
;; * Use `keyboard-quit' when anything-read-* is quit.
;; * Change keybinding of `anything-read-file-name-follow-directory' to Tab
;; * `anything-read-file-name-follow-directory': smarter behavior
;;
;; Revision 1.12  2008/09/05 12:46:27  rubikitch
;; bugfix
;;
;; Revision 1.11  2008/09/05 03:15:26  rubikitch
;; *** empty log message ***
;;
;; Revision 1.10  2008/09/05 01:49:56  rubikitch
;; `anything-completing-read' supports list collection only.
;;
;; Revision 1.9  2008/09/05 00:09:46  rubikitch
;; New functions: moved from anything.el
;;   `anything-completing-read', `anything-read-file-name', `anything-read-buffer',
;;   `anything-read-variable', `anything-read-command', `anything-read-string-mode'.
;;
;; Revision 1.8  2008/09/04 16:54:59  rubikitch
;; add commentary
;;
;; Revision 1.7  2008/09/04 08:36:08  rubikitch
;; fixed a bug when `symbol-at-point' is nil.
;;
;; Revision 1.6  2008/09/04 08:29:40  rubikitch
;; remove unneeded code.
;;
;; Revision 1.5  2008/09/04 08:12:05  rubikitch
;; absorb anything-lisp-complete-symbol.el v1.13.
;;
;; Revision 1.4  2008/09/04 07:36:23  rubikitch
;; Use type plug-in instead.
;;
;; Revision 1.3  2008/09/03 04:13:23  rubikitch
;; `anything-c-source-complete-shell-history': deleted requires-pattern
;;
;; Revision 1.2  2008/09/01 22:27:45  rubikitch
;; *** empty log message ***
;;
;; Revision 1.1  2008/09/01 22:23:55  rubikitch
;; Initial revision
;;

;;; History of anything-lisp-complete-symbol.el

;; Revision 1.13  2008/09/04 08:07:18  rubikitch
;; use `anything-complete-target' rather than `alcs-target'.
;;
;; Revision 1.12  2008/09/04 07:50:34  rubikitch
;; add docstrings
;;
;; Revision 1.11  2008/09/04 07:35:02  rubikitch
;; use `add-to-list' to add `anything-type-attributes' entry.
;;
;; Revision 1.10  2008/09/04 01:19:56  rubikitch
;; New source: `anything-c-source-emacs-function-at-point'
;; New source: `anything-c-source-emacs-variable-at-point'
;;
;; Revision 1.9  2008/09/04 00:48:22  rubikitch
;; New action: find-function, find-variable
;;
;; Revision 1.8  2008/09/03 11:02:51  rubikitch
;; do `alcs-make-candidates' after load this file.
;;
;; Revision 1.7  2008/08/29 09:32:46  rubikitch
;; make `alcs-make-candidates' faster
;;
;; Revision 1.6  2008/08/29 09:22:02  rubikitch
;; add command sources.
;; New command: `anything-apropos'
;;
;; Revision 1.5  2008/08/29 02:38:42  rubikitch
;; New command: `anything-lisp-complete-symbol-partial-match'
;;
;; Revision 1.4  2008/08/26 10:42:54  rubikitch
;; integration with `anything-dabbrev-expand'
;;
;; Revision 1.3  2008/08/25 20:45:45  rubikitch
;; export variables
;;
;; Revision 1.2  2008/08/25 20:29:48  rubikitch
;; add requires
;;
;; Revision 1.1  2008/08/25 20:26:09  rubikitch
;; Initial revision
;;

;;; Code:

(defvar anything-complete-version "$Id: anything-complete.el,v 1.58 2009/10/01 03:07:44 rubikitch Exp rubikitch $")
(require 'anything-match-plugin)
(require 'thingatpt)

;; (@* "overlay")
(when (require 'anything-show-completion nil t)
  (dolist (f '(anything-complete
               anything-lisp-complete-symbol
               anything-lisp-complete-symbol-partial-match))
    (use-anything-show-completion f '(length anything-complete-target))))


;; (@* "core")
(defvar anything-complete-target "")

(defun ac-insert (candidate)
  (let ((pt (point)))
    (when (and (search-backward anything-complete-target nil t)
               (string= (buffer-substring (point) pt) anything-complete-target))
      (delete-region (point) pt)))
  (insert candidate))

(define-anything-type-attribute 'complete
  '((candidates-in-buffer)
    (action . ac-insert)))

;; Warning: I'll change this function's interface. DON'T USE IN YOUR PROGRAM!
(defun anything-noresume (&optional any-sources any-input any-prompt any-resume any-preselect any-buffer)
  (let (anything-last-sources anything-compiled-sources anything-last-buffer)
    (anything any-sources any-input any-prompt any-resume any-preselect any-buffer)))

(defun anything-complete (sources target &optional limit idle-delay input-idle-delay)
  "Basic completion interface using `anything'."
  (let ((anything-candidate-number-limit (or limit anything-candidate-number-limit))
        (anything-idle-delay (or idle-delay anything-idle-delay))
        (anything-input-idle-delay (or input-idle-delay anything-input-idle-delay))
        (anything-complete-target target)
        (anything-execute-action-at-once-if-one t)
        (enable-recursive-minibuffers t)
        anything-samewindow)
    (anything-noresume sources target nil nil nil "*anything complete*")))


;; (@* "`lisp-complete-symbol' and `apropos' replacement")
(defvar anything-lisp-complete-symbol-input-idle-delay 0.1
  "`anything-input-idle-delay' for `anything-lisp-complete-symbol',
`anything-lisp-complete-symbol-partial-match' and `anything-apropos'.")

(defun alcs-create-buffer (name)
  (let ((b (get-buffer-create name)))
    (with-current-buffer b
      (buffer-disable-undo)
      (erase-buffer)
      b)))

(defvar alcs-variables-buffer " *variable symbols*")
(defvar alcs-functions-buffer " *function symbols*")
(defvar alcs-commands-buffer " *command symbols*")
(defvar alcs-symbol-buffer " *other symbols*")

(defun alcs-make-candidates ()
  (message "Collecting symbols...")
  ;; To ignore read-only property.
  (let ((inhibit-read-only t))
    (alcs-create-buffer alcs-variables-buffer)
    (alcs-create-buffer alcs-functions-buffer)
    (alcs-create-buffer alcs-commands-buffer)
    (alcs-create-buffer alcs-symbol-buffer)
    (mapatoms
     (lambda (sym)
       (let ((name (symbol-name sym))
             (fbp (fboundp sym)))
         (cond ((commandp sym) (set-buffer alcs-commands-buffer) (insert name "\n"))
               (fbp (set-buffer alcs-functions-buffer) (insert name "\n")))
         (cond ((boundp sym) (set-buffer alcs-variables-buffer) (insert name "\n"))
               ((not fbp) (set-buffer alcs-symbol-buffer) (insert name "\n")))))))
  (message "Collecting symbols...done"))

(defun anything-lisp-complete-symbol-set-timer (update-period)
  "Update Emacs symbols list when Emacs is idle,
used by `anything-lisp-complete-symbol-set-timer' and `anything-apropos'"
  (run-with-idle-timer update-period t 'alcs-make-candidates))

(defun alcs-init (bufname)
  (declare (special anything-dabbrev-last-target))
  (setq anything-complete-target
        (if (loop for src in (anything-get-sources)
                  thereis (string-match "^dabbrev" (assoc-default 'name src)))
            anything-dabbrev-last-target
          (anything-aif (symbol-at-point) (symbol-name it) "")))
  (anything-candidate-buffer (get-buffer bufname)))

(defun alcs-sort (candidates source)
  (sort candidates #'string<))

(defun alcs-describe-function (name)
  (describe-function (intern name)))
(defun alcs-describe-variable (name)
  (describe-variable (intern name)))
(defun alcs-find-function (name)
  (find-function (intern name)))
(defun alcs-find-variable (name)
  (find-variable (intern name)))

(defvar anything-c-source-complete-emacs-functions
  '((name . "Functions")
    (init . (lambda () (alcs-init alcs-functions-buffer)))
    (candidates-in-buffer)
    (type . complete-function)))
(defvar anything-c-source-complete-emacs-commands
  '((name . "Commands")
    (init . (lambda () (alcs-init alcs-commands-buffer)))
    (candidates-in-buffer)
    (type . complete-function)))
(defvar anything-c-source-complete-emacs-variables
  '((name . "Variables")
    (init . (lambda () (alcs-init alcs-variables-buffer)))
    (candidates-in-buffer)
    (type . complete-variable)))
(defvar anything-c-source-complete-emacs-other-symbols
  '((name . "Other Symbols")
    (init . (lambda () (alcs-init alcs-symbol-buffer)))
    (candidates-in-buffer)
    (filtered-candidate-transformer . alcs-sort)
    (action . ac-insert)))
(defvar anything-c-source-apropos-emacs-functions
  '((name . "Apropos Functions")
    (init . (lambda () (alcs-init alcs-functions-buffer)))
    (candidates-in-buffer)
    (requires-pattern . 3)
    (type . apropos-function)))
(defvar anything-c-source-apropos-emacs-commands
  '((name . "Apropos Commands")
    (init . (lambda () (alcs-init alcs-commands-buffer)))
    (candidates-in-buffer)
    (requires-pattern . 3)
    (type . apropos-function)))
(defvar anything-c-source-apropos-emacs-variables
  '((name . "Apropos Variables")
    (init . (lambda () (alcs-init alcs-variables-buffer)))
    (candidates-in-buffer)
    (requires-pattern . 3)
    (type . apropos-variable)))

(defvar anything-c-source-emacs-function-at-point
  '((name . "Function at point")
    (candidates
     . (lambda () (with-current-buffer anything-current-buffer
                    (anything-aif (function-called-at-point)
                        (list (symbol-name it))))))
    (type . apropos-function)))

(defvar anything-c-source-emacs-variable-at-point
  '((name . "Variable at point")
    (candidates
     . (lambda () (with-current-buffer anything-current-buffer
                    (anything-aif (variable-at-point)
                        (unless (equal 0 it) (list (symbol-name it)))))))
    (type . apropos-variable)))

(defvar anything-lisp-complete-symbol-sources
  '(anything-c-source-complete-emacs-commands
    anything-c-source-complete-emacs-functions
    anything-c-source-complete-emacs-variables))

(defvar anything-apropos-sources
  '(anything-c-source-apropos-emacs-commands
    anything-c-source-apropos-emacs-functions
    anything-c-source-apropos-emacs-variables))

(define-anything-type-attribute 'apropos-function
  '((filtered-candidate-transformer . alcs-sort)
    (persistent-action . alcs-describe-function)
    (action
     ("Describe Function" . alcs-describe-function)
     ("Find Function" . alcs-find-function))))
(define-anything-type-attribute 'apropos-variable
  '((filtered-candidate-transformer . alcs-sort)
    (persistent-action . alcs-describe-variable)
    (action
     ("Describe Variable" . alcs-describe-variable)
     ("Find Variable" . alcs-find-variable))))
(define-anything-type-attribute 'complete-function
  '((filtered-candidate-transformer . alcs-sort)
    (action . ac-insert)
    (persistent-action . alcs-describe-function)))
(define-anything-type-attribute 'complete-variable
  '((filtered-candidate-transformer . alcs-sort)
    (action . ac-insert)
    (persistent-action . alcs-describe-variable)))

(defun anything-lisp-complete-symbol-1 (update sources input)
  (when (or update (null (get-buffer alcs-variables-buffer)))
    (alcs-make-candidates))
  (let (anything-samewindow
        (anything-input-idle-delay
         (or anything-lisp-complete-symbol-input-idle-delay
             anything-input-idle-delay)))
    (anything-noresume sources input nil nil nil "*anything complete*")))

(defun anything-lisp-complete-symbol (update)
  "`lisp-complete-symbol' replacement using `anything'."
  (interactive "P")
  (anything-lisp-complete-symbol-1 update anything-lisp-complete-symbol-sources
                                   (anything-aif (symbol-at-point)
                                       (format "^%s" it)
                                     "")))
(defun anything-lisp-complete-symbol-partial-match (update)
  "`lisp-complete-symbol' replacement using `anything' (partial match)."
  (interactive "P")
  (anything-lisp-complete-symbol-1 update anything-lisp-complete-symbol-sources
                                   (anything-aif (symbol-at-point)
                                       (symbol-name it)
                                     "")))
(defun anything-apropos (update)
  "`apropos' replacement using `anything'."
  (interactive "P")
  (anything-lisp-complete-symbol-1 update anything-apropos-sources nil))

;; (@* "anything-read-string-mode / read-* compatibility functions")
;; moved from anything.el
(defun anything-compile-source--default-value (source)
  (anything-aif (assoc-default 'default-value source)
      (append source
              `((candidates ,it)
                (filtered-candidate-transformer
                 . (lambda (cands source)
                     (if (string= anything-pattern "") cands nil)))))
    source))
(add-to-list 'anything-compile-source-functions 'anything-compile-source--default-value)

(defun ac-new-input-source (prompt require-match &optional additional-attrs)
  (unless require-match
    `((name . ,prompt) (dummy) ,@additional-attrs)))
(defun* ac-default-source (default &optional accept-empty (additional-attrs '((action . identity))))
  `((name . "Default")
    (default-value . ,(or default (and accept-empty "")))
    ,@additional-attrs
    ,(if accept-empty '(accept-empty))))
;; (ac-default-source "a")
;; (ac-default-source "a" t)
;; (ac-default-source nil t)
;; (ac-default-source nil)

;; (@* "`completing-read' compatible read function ")
(defun anything-completing-read (prompt collection &optional predicate require-match initial hist default inherit-input-method)
  (if (or (arrayp collection) (functionp collection))
      (anything-old-completing-read prompt collection predicate require-match initial hist default inherit-input-method)
    ;; support only collection list.
    (let* (anything-input-idle-delay
           (result (or (anything-noresume (acr-sources
                                           prompt
                                           collection
                                           predicate require-match initial
                                           hist default inherit-input-method)
                                          initial prompt nil nil "*anything complete*")
                       (keyboard-quit))))
      (when (stringp result)
        (prog1 result
          (setq hist (or hist 'minibuffer-history))
          (set hist (cons result (delete result (symbol-value hist)))))))))

;; TODO obarray/predicate hacks: command/variable/symbol
(defvar anything-completing-read-use-default t
  "Whether to use default value source.")
(defvar anything-completing-read-history-first nil
  "Whether to display history source first.")
(defvar anything-complete-persistent-action nil
  "Persistent action function used by `anything-completing-read'.
It accepts one argument, selected candidate.")

(defun* acr-sources (prompt collection predicate require-match initial hist default inherit-input-method &optional (additional-attrs '((action . identity))))
  "`anything' replacement for `completing-read'."
  (let* ((transformer-func
          (if predicate
              `(candidate-transformer
                . (lambda (cands)
                    (remove-if-not (lambda (c) (,predicate
                                                (if (listp c) (car c) c))) cands)))))
         (persistent-action
          (if anything-complete-persistent-action
              '(persistent-action
                . (lambda (cand) (funcall anything-complete-persistent-action cand)))))
         (new-input-source (ac-new-input-source prompt require-match additional-attrs))
         (history-source (unless require-match
                           `((name . "History")
                             (candidates . ,(or hist 'minibuffer-history))
                             ,persistent-action
                             ,@additional-attrs)))
         (default-source (and anything-completing-read-use-default (ac-default-source default t)))
         (main-source `((name . "Completions")
                        (candidates . ,(mapcar (lambda (x) (or (car-safe x) x)) collection))
                        ,@additional-attrs
                        ,persistent-action
                        ,transformer-func)))
    (if anything-completing-read-history-first
        `(,default-source
           ,history-source
           ,main-source
           ,new-input-source)
      `(,default-source
           ,main-source
           ,history-source
           ,new-input-source))))
;; (anything-completing-read "Command: " obarray 'commandp t)
;; (anything-completing-read "Test: " '(("hoge")("foo")("bar")) nil t)
;; (let ((anything-complete-persistent-action 'message)) (anything-completing-read "Test: " '(("hoge")("foo")("bar")) nil t))
;; (anything-old-completing-read "Test: " '(("hoge")("foo")("bar")) nil t)
;; (anything-completing-read "Test: " '(("hoge")("foo")("bar")) nil nil "f" nil)
;; (completing-read "Test: " '(("hoge")("foo")("bar")) nil nil "f" nil nil t)
;; (anything-completing-read "Test: " '(("hoge")("foo")("bar")) nil nil nil nil "nana")
;; (anything-completing-read "Test: " '("hoge" "foo" "bar"))

;; (@* "`read-file-name' compatible read function ")
(defvar anything-read-file-name-map nil)
(defvar arfn-followed nil)
(defvar arfn-dir nil)
(defun anything-read-file-name-map ()
  "Lazy initialization of `anything-read-file-name-map'."
  (unless anything-read-file-name-map
    (setq anything-read-file-name-map (copy-keymap anything-map))
    (define-key anything-read-file-name-map "\C-i" 'anything-read-file-name-follow-directory)
    (define-key anything-read-file-name-map [tab] 'anything-read-file-name-follow-directory))
  anything-read-file-name-map)

(defun anything-read-file-name-follow-directory ()
  (interactive)
  ;; These variables are bound by `arfn-sources' or `anything-find-file'.
  (declare (special prompt default-filename require-match predicate additional-attrs))
  (setq arfn-followed t)
  (let* ((sel (anything-get-selection))
         (f (expand-file-name sel arfn-dir)))
    (cond ((and (file-directory-p f) (not (string-match "/\\.$" sel)))
           (with-selected-window (minibuffer-window) (delete-minibuffer-contents))
           (setq anything-pattern "")
           ;;(setq arfn-dir f)
           (anything-set-sources
            (arfn-sources
             prompt f default-filename require-match nil predicate additional-attrs))
           (anything-update))
          ((string-match "^\\(.+\\)/\\([^/]+\\)$" sel)
           (with-selected-window (minibuffer-window)
             (delete-minibuffer-contents)
             (insert (match-string 2 sel)))
           (anything-set-sources
            (arfn-sources
             prompt (expand-file-name (match-string 1 sel) arfn-dir) nil require-match (match-string 2 sel) predicate additional-attrs))
           (anything-update)))))

(defun* anything-read-file-name (prompt &optional dir default-filename require-match initial-input predicate (additional-attrs '((action . identity))))
  "`anything' replacement for `read-file-name'."
  (setq arfn-followed nil)
  (let* ((anything-map (anything-read-file-name-map))
         anything-input-idle-delay
         (result (or (anything-noresume (arfn-sources
                                         prompt dir default-filename require-match
                                         initial-input predicate additional-attrs)
                                        initial-input prompt nil nil "*anything complete*")
                     (keyboard-quit))))
    (when (and require-match
               (not (and (file-exists-p result)
                         (funcall (or predicate 'identity) result))))
      (error "anything-read-file-name: file `%s' is not matched" result))
    (when (stringp result)
      (prog1 result
        (add-to-list 'file-name-history result)
        (setq file-name-history (cons result (delete result file-name-history)))))))

(defun arfn-candidates (dir)
  (if (file-directory-p dir)
      (loop for (f _ _ _ _ _ _ _ _ perm _ _ _) in (directory-files-and-attributes dir t)
            for basename = (file-name-nondirectory f)
            when (string= "d" (substring perm 0 1))
            collect (cons (concat basename "/") f)
            else collect (cons basename f))))

(defun* arfn-sources (prompt dir default-filename require-match initial-input predicate &optional (additional-attrs '((action . identity))))
  (setq arfn-dir dir)
  (let* ((dir (or dir default-directory))
         (transformer-func
          (if predicate
              `(candidate-transformer
                . (lambda (cands)
                    (remove-if-not
                     (lambda (c) (,predicate (if (consp c) (cdr c) c))) cands)))))
         (new-input-source (ac-new-input-source
                            prompt nil
                            (append '((display-to-real . (lambda (f) (expand-file-name f arfn-dir))))
                                    additional-attrs)))
         (history-source (unless require-match
                           `((name . "History")
                             (candidates . file-name-history)
                             (persistent-action . find-file)
                             ,@additional-attrs))))
    `(((name . "Default")
       (candidates . ,(if default-filename (list default-filename)))
       (persistent-action . find-file)
       (filtered-candidate-transformer
        . (lambda (cands source)
            (if (and (not arfn-followed) (string= anything-pattern "")) cands nil)))
       (display-to-real . (lambda (f) (expand-file-name f ,dir)))
       ,@additional-attrs)
      ((name . ,dir)
       (candidates . (lambda () (arfn-candidates ,dir)))
       (persistent-action . find-file)
       ,@additional-attrs
       ,transformer-func)
      ,new-input-source
      ,history-source)))
;; (anything-read-file-name "file: " "~" ".emacs")
;; (anything-read-file-name "file: " "~" ".emacs" t)
;; (anything-read-file-name "file: " "~" )
;; (anything-read-file-name "file: ")
;; (read-file-name "file: " "/tmp")

;; (@* "`read-buffer' compatible read function ")
(defun anything-read-buffer (prompt &optional default require-match start matches-set)
  "`anything' replacement for `read-buffer'."
  (let (anything-input-idle-delay)
    (anything-noresume (arb-sources prompt
                                    (if (bufferp default) (buffer-name default) default)
                                    require-match start matches-set)
                       start prompt nil nil "*anything complete*")))

(defun* arb-sources (prompt default require-match start matches-set &optional (additional-attrs '((action . identity))))
  `(,(ac-default-source default t)
    ((name . ,prompt)
     (persistent-action . switch-to-buffer)
     (candidates . (lambda () (mapcar 'buffer-name (buffer-list))))
     ,@additional-attrs)
    ,(ac-new-input-source prompt require-match additional-attrs)))

;; (anything-read-buffer "test: "  nil)
;; (anything-read-buffer "test: " "*scratch*" t)
;; (anything-read-buffer "test: " "*scratch*" t "*")

;; (read-variable "variable: " "find-file-hooks")
;; (read-variable "variable: " 'find-file-hooks)
;; (read-variable "variable: " )
(defun anything-read-symbol-1 (prompt buffer default-value)
  (let (anything-input-idle-delay anything-samewindow)
    (intern (or (anything-noresume `(,(ac-default-source
                                       (if default-value (format "%s" default-value)))
                                     ((name . ,prompt)
                                      (init . (lambda () (alcs-init ,buffer)))
                                      (candidates-in-buffer)
                                      (action . identity)))
                                   nil prompt nil nil "*anything complete*")
                (keyboard-quit)))))

;; (@* "`read-variable' compatible read function ")
(defun anything-read-variable (prompt &optional default-value)
  (anything-read-symbol-1 prompt alcs-variables-buffer default-value))
;; (anything-read-variable "variable: " 'find-file-hooks)

;; (@* "`read-command' compatible read function ")
(defun anything-read-command (prompt &optional default-value)
  (anything-read-symbol-1 prompt alcs-commands-buffer default-value))
;; (anything-read-variable "command: ")


;; (@* "`anything-read-string-mode' initialization")
(defvar anything-read-string-mode nil)
(unless anything-read-string-mode
  (defalias 'anything-old-completing-read (symbol-function 'completing-read))
  (defalias 'anything-old-read-file-name (symbol-function 'read-file-name))
  (defalias 'anything-old-read-buffer (symbol-function 'read-buffer))
  (defalias 'anything-old-read-variable (symbol-function 'read-variable))
  (defalias 'anything-old-read-command (symbol-function 'read-command))
  (put 'anything-read-string-mode 'orig-read-buffer-function read-buffer-function))
  
;; (anything-read-string-mode -1)
;; (anything-read-string-mode 1)
;; (anything-read-string-mode 0)
(defun anything-read-string-mode (arg)
  "If this minor mode is on, use `anything' version of `completing-read' and `read-file-name'."
  (interactive "P")
  (setq anything-read-string-mode (if arg (> (prefix-numeric-value arg) 0) (not anything-read-string-mode)))
  (cond (anything-read-string-mode
         ;; redefine to anything version
         (defalias 'completing-read (symbol-function 'anything-completing-read))
         (defalias 'read-file-name (symbol-function 'anything-read-file-name))
         (setq read-buffer-function 'anything-read-buffer)
         (defalias 'read-buffer (symbol-function 'anything-read-buffer))
         (defalias 'read-variable (symbol-function 'anything-read-variable))
         (defalias 'read-command (symbol-function 'anything-read-command))
         (substitute-key-definition 'execute-extended-command 'anything-execute-extended-command global-map)
         (substitute-key-definition 'find-file 'anything-find-file global-map)
         (message "Installed anything version of read functions."))
        (t
         ;; restore to original version
         (defalias 'completing-read (symbol-function 'anything-old-completing-read))
         (defalias 'read-file-name (symbol-function 'anything-old-read-file-name))
         (setq read-buffer-function (get 'anything-read-string-mode 'orig-read-buffer-function))
         (defalias 'read-buffer (symbol-function 'anything-old-read-buffer))
         (defalias 'read-variable (symbol-function 'anything-old-read-variable))
         (defalias 'read-command (symbol-function 'anything-old-read-command))
         (substitute-key-definition 'anything-execute-extended-command 'execute-extended-command global-map)
         (substitute-key-definition 'anything-find-file 'find-file global-map)
         (message "Uninstalled anything version of read functions."))))


;; (@* " shell history")
(defun anything-complete-shell-history ()
  "Select a command from shell history and insert it."
  (interactive)
  (anything-complete 'anything-c-source-complete-shell-history
                     (or (word-at-point) "")
                     20))
(defun anything-complete-shell-history-setup-key (key)
  (when (and (require 'shell-command nil t)
             (boundp 'shell-command-minibuffer-map))
    (shell-command-completion-mode)
    (define-key shell-command-minibuffer-map key 'anything-complete-shell-history))
  (when (require 'background nil t)
    (define-key background-minibuffer-map key 'anything-complete-shell-history))
  (require 'shell)
  (define-key shell-mode-map key 'anything-complete-shell-history))

(defvar zsh-p nil)
(defvar anything-c-source-complete-shell-history
  '((name . "Shell History")
    (init . (lambda ()
              (require 'shell-history)
              (with-current-buffer (anything-candidate-buffer (shell-history-buffer))
                (revert-buffer t t)
                (set (make-local-variable 'zsh-p)
                     (shell-history-zsh-extended-history-p)))))
    (get-line . acsh-get-line)
    (search-from-end)
    (type . complete)))

(defun acsh-get-line (s e)
  (let ((extended-history (string= (buffer-substring s (+ s 2)) ": "))
        (single-line (not (string= (buffer-substring (1- e) e) "\\"))))
    (cond ((not zsh-p)
           (buffer-substring s e))
          ((and extended-history single-line)
           (buffer-substring (+ s 15) e))
          (extended-history             ;zsh multi-line / 1st line
           (goto-char e)
           (let ((e2 (1- (if (re-search-forward "^: [0-9]+:[0-9];" nil t)
                             (match-beginning 0)
                           (point-max)))))
             (prog1 (replace-regexp-in-string
                     "\\\\\n" ";" (buffer-substring (+ s 15) e2))
               (goto-char s))))
          (t                   ; zsh multi-line history / not 1st line
           (goto-char s)
           (re-search-backward "^: [0-9]+:[0-9];" nil t)
           (let ((s2 (match-end 0)) e2)
             (goto-char s2)
             (setq e2 (1- (if (re-search-forward "^: [0-9]+:[0-9];" nil t)
                              (match-beginning 0)
                            (point-max))))
             (prog1 (replace-regexp-in-string
                     "\\\\\n" ";" (buffer-substring s2 e2))
               (goto-char s2)))))))

;; I do not want to make anything-c-source-* symbols because they are
;; private in `anything-execute-extended-command'.
(defvar anything-execute-extended-command-sources
  '(((name . "Emacs Commands History")
     (candidates . extended-command-history)
     (action . identity)
     (persistent-action . alcs-describe-function))
    ((name . "Commands")
     (init . (lambda () (anything-candidate-buffer
                         (get-buffer alcs-commands-buffer))))
     (candidates-in-buffer)
     (action . identity)
     (persistent-action . alcs-describe-function))
    ((name . "Commands (by prefix)")
     (candidates
      . (lambda ()
          (all-completions anything-pattern obarray 'commandp)))
     (volatile)
     (action . identity)
     (persistent-action . alcs-describe-function))))

(defun anything-execute-extended-command ()
  (interactive)
  (let ((cmd (anything
              (if (require 'anything-kyr-config nil t)
                  (cons anything-c-source-kyr
                        anything-execute-extended-command-sources)
                anything-execute-extended-command-sources))))
    (when cmd
      (setq extended-command-history (cons cmd (delete cmd extended-command-history)))
      (setq cmd (intern cmd))
      (if (stringp (symbol-function cmd))
          (execute-kbd-macro (symbol-function cmd))
        (call-interactively cmd)))))

(defvar anything-find-file-additional-sources nil)
(defun anything-find-file ()
  (interactive)
  (let ((anything-map (anything-read-file-name-map))
        ;; anything-read-file-name-follow-directory uses these variables
        (prompt "Find File: ")
        default-filename require-match predicate
        (additional-attrs '(;; because anything-c-skip-boring-files cannot
                            ;; handle (display . real) candidates
                            (candidate-transformer)
                            (type . file))))
    (anything-complete (append (arfn-sources prompt default-directory
                                             nil nil nil nil additional-attrs)
                               anything-find-file-additional-sources)
                       "" )))
;;(anything-find-file)

(add-hook 'after-init-hook 'alcs-make-candidates)

      
;;;; unit test
;; (install-elisp "http://www.emacswiki.org/cgi-bin/wiki/download/el-expectations.el")
;; (install-elisp "http://www.emacswiki.org/cgi-bin/wiki/download/el-mock.el")
(dont-compile
  (when (fboundp 'expectations)
    (expectations
      (desc "acsh-get-line command")
      (expect "ls"
        (let ((zsh-p t))
          (with-temp-buffer
            (insert ": 1118554690:0;cat ~/.zsh_history\n"
                    ": 1118554690:0;ls\n")
            (forward-line -1)
            (acsh-get-line (point-at-bol) (point-at-eol)))))
      (expect "cd;ls -l"
        (let ((zsh-p t))
          (with-temp-buffer
            (insert ": 1118554690:0;cat ~/.zsh_history\n"
                    ": 1118554690:0;cd\\\n"
                    "ls -l\n"
                    ": 1118554690:0;hoge\n")
            (forward-line -2)
            (acsh-get-line (point-at-bol) (point-at-eol)))))
      (expect "cd;ls -l"
        (let ((zsh-p t))
          (with-temp-buffer
            (insert ": 1118554690:0;cat ~/.zsh_history\n"
                    ": 1118554690:0;cd\\\n"
                    "ls -l\n"
                    ": 1118554690:0;hoge\n")
            (forward-line -3)
            (acsh-get-line (point-at-bol) (point-at-eol)))))
      (expect "cd;ls -l"
        (let ((zsh-p t))
          (with-temp-buffer
            (insert ": 1118554690:0;cat ~/.zsh_history\n"
                    ": 1118554690:0;cd\\\n"
                    "ls -l\n")
            (forward-line -1)
            (acsh-get-line (point-at-bol) (point-at-eol)))))
      (expect "cd;ls -l"
        (let ((zsh-p t))
          (with-temp-buffer
            (insert ": 1118554690:0;cat ~/.zsh_history\n"
                    ": 1118554690:0;cd\\\n"
                    "ls -l\n")
            (forward-line -2)
            (acsh-get-line (point-at-bol) (point-at-eol)))))
      (expect "pwd"
        (let ((zsh-p nil))
          (with-temp-buffer
            (insert "foo\n"
                    "pwd\n")
            (forward-line -1)
            (acsh-get-line (point-at-bol) (point-at-eol)))))
      (desc "acsh-get-line lineno")
      (expect 2
        (let ((zsh-p t))
          (with-temp-buffer
            (insert ": 1118554690:0;cat ~/.zsh_history\n"
                    ": 1118554690:0;cd\\\n"
                    "ls -l\n"
                    ": 1118554690:0;hoge\n")
            (forward-line -2)
            (acsh-get-line (point-at-bol) (point-at-eol))
            (line-number-at-pos))))
      (expect 2
        (let ((zsh-p t))
          (with-temp-buffer
            (insert ": 1118554690:0;cat ~/.zsh_history\n"
                    ": 1118554690:0;cd\\\n"
                    "ls -l\n"
                    ": 1118554690:0;hoge\n")
            (forward-line -3)
            (acsh-get-line (point-at-bol) (point-at-eol))
            (line-number-at-pos))))

      )))

;;; for compatibility
(defvaralias 'anything-c-source-complete-emacs-variables-partial-match
  'anything-c-source-complete-emacs-variables)
(defvaralias 'anything-c-source-complete-emacs-commands-partial-match
  'anything-c-source-complete-emacs-commands)
(defvaralias 'anything-c-source-complete-emacs-functions-partial-match
  'anything-c-source-complete-emacs-functions)



(provide 'anything-complete)

;; How to save (DO NOT REMOVE!!)
;; (emacswiki-post "anything-complete.el")
;;; anything-complete.el ends here
