;;; glitch-theme.el --- A medium-contrast holographic theme.
;; Version: 0.0.1

;;; Commentary:
;; Things that need to be done before considering a v1 release
;; - TODO: fix glitch-$color-[bg|bg-hl|fg|fg-hl] pairings
;; - TODO: with-eval-after-load external packages?
;; - TODO: make primary & secondary selection configurable by ansi color
;; - TODO: figure out the correct minver (probably 27.1)
;; - TODO: thorough scan through available groups to cover all faces

;;; Code:

(deftheme glitch "A medium-contrast holographic theme.")
(let* ((class '((class color) (min-colors 89)))

      ;;; = Palette =

      ;; == Text ==

      (bg                     "#24283b")
      (dark-bg                "#1f2335")
      (active-bg              "#292e42")
      (active-bg-hl           "#414868")

      (fg                     "#a9b1d6")
      (active-fg              "#c0caf5")
      (muted-fg               "#565f89")     ; inactive, but visible
      (inactive-fg            "#313750")     ; inactive, nearly hidden

      ;; == Colors ==

      (glitch-black-bg        "#313750")
      (glitch-black-bg-hl     "#1f2335")
      (glitch-black-fg        "#1f2335")
      (glitch-black-fg-hl     "#565f89")

      ;; Functions, builtins
      (glitch-blue-bg         "#192a4d")
      (glitch-blue-bg-hl      "#7aa2f7")
      (glitch-blue-fg         "#7aa2f7")
      (glitch-blue-fg-hl      "#031130")

      ;; Variables, object properties
      (glitch-cyan-bg         "#274440")
      (glitch-cyan-bg-hl      "#73daca")
      (glitch-cyan-fg         "#73daca")
      (glitch-cyan-fg-hl      "#222a29")

      ;; Info/Success
      (glitch-green-bg        "#273644")
      (glitch-green-bg-hl     "#4c9e8a")
      (glitch-green-fg        "#4c9e8a")
      (glitch-green-fg-hl     "#11221e")

      ;; Keywords
      (glitch-magenta-bg      "#231c31")
      (glitch-magenta-bg-hl   "#bb9af7")
      (glitch-magenta-fg      "#bb9af7")
      (glitch-magenta-fg-hl   "#171320")

      ;; Errors
      (glitch-red-bg          "#342c3c")
      (glitch-red-bg-hl       "#f7768e")
      (glitch-red-fg          "#f7768e")
      (glitch-red-fg-hl       "#30030b")

      (glitch-white           "#c0caf5")
      (glitch-white-bg-hl     "#bb9af7")
      (glitch-white-fg        "#bb9af7")
      (glitch-white-fg-hl     "#bb9af7")

      ;; Warnings
      (glitch-yellow-bg       "#37363f")
      (glitch-yellow-bg-hl    "#e0af68")
      (glitch-yellow-fg       "#e0af68")
      (glitch-yellow-fg-hl    "#2a1d09")

      ;; == Diagnostics ==

      (info-bg                glitch-green-bg)
      (info-bg-hl             glitch-green-bg-hl)
      (info-fg                glitch-green-fg)
      (info-fg-hl             glitch-green-fg-hl)

      (alt-info-bg            glitch-blue-bg)     ; non-user select highlight (volatile highlights)
      (alt-info-bg-hl         glitch-blue-bg-hl)
      (alt-info-fg            glitch-blue-fg)
      (alt-info-fg-hl         glitch-blue-fg-hl)

      (warning-bg             glitch-yellow-bg)
      (warning-bg-hl          glitch-yellow-bg-hl)
      (warning-fg             glitch-yellow-fg)
      (warning-fg-hl          glitch-yellow-fg-hl)

      (error-bg               glitch-red-bg)
      (error-bg-hl            glitch-red-bg-hl)
      (error-fg               glitch-red-fg)
      (error-fg-hl            glitch-red-fg-hl)

      ;;; == Misc ==

      (qualifier         "#2ac3de")     ; types
      (safe              "#7892bf")     ; constants, numbers, strings
      (special           "#ea9a97")     ; escape sequences
      )
  (setq-default org-modern-todo-faces
                '(("TODO" :background "#e0af68" :foreground "#37363f" :weight bold)
                  ("CURR" :background "#4c9e8a" :foreground "#273644" :weight bold)
                  ("REVW" :background "#7aa2f7" :foreground "#192a4d" :weight bold)
                  ("WAIT" :background "#f7768e" :foreground "#342c3c" :weight bold)
                  ("DEPL" :background "#bb9af7" :foreground "#231c31" :weight bold)
                  ("DONE" :background "#1f2335" :foreground "#313750" :weight bold)))
  (custom-theme-set-faces
   'glitch

   ;;; = Builtin Faces =

   `(bold ((,class (:weight bold))))
   `(bold-italic ((,class (:weight bold :slant italic))))
   `(button ((,class (:inherit link))))
   `(completions-common-part ((,class (:inherit region))))
   `(cursor ((,class (:background ,active-fg :foreground ,dark-bg))))
   `(default ((,class (:background ,bg :foreground ,fg))))
   `(error ((,class (:foreground ,error-fg))))
   `(escape-glyph ((,class (:foreground ,special))))
   `(fixed-pitch ((,class (:family "monospace"))))
   `(fixed-pitch-serif ((,class (:family "monospace serif"))))
   `(fringe ((,class (:background ,dark-bg))))
   `(glyphless-char ((,class (:foreground ,special))))
   `(highlight ((,class (:background ,active-bg))))
   `(homoglyph ((,class (:foreground ,glitch-cyan-fg))))
   `(italic ((,class (:slant italic))))
   `(link ((,class (:foreground ,glitch-cyan-fg))))
   `(link-visited ((,class (:foreground ,glitch-magenta-fg))))
   `(minibuffer-prompt ((,class (:foreground ,glitch-blue-fg))))
   `(mouse ((,class (:inherit default))))
   `(nobreak-hyphen ((,class (:foreground ,special))))
   `(nobreak-space ((,class (:foreground ,special))))
   `(read-multiple-choice-face ((,class (:background ,active-bg :foreground ,active-fg))))
   `(region ((,class (:background ,info-bg :foreground ,info-fg))))
   `(scroll-bar ((,class (:background ,bg :foreground ,inactive-fg))))
   `(secondary-selection ((,class (:background ,alt-info-bg :foreground ,alt-info-fg))))
   `(shadow ((,class (:foreground ,muted-fg))))
   `(success ((,class (:foreground ,info-fg))))
   `(tool-tips ((,class (:inherit highlight))))
   `(trailing-whitespace ((,class (:background ,error-bg-hl :foreground ,error-fg-hl))))
   `(underline ((,class (:underline t))))
   `(variable-pitch ((,class (:family "sans serif"))))
   `(variable-pitch-text ((,class (:family "sans serif"))))
   `(warning ((,class (:foreground ,warning-fg))))
   `(hl-line ((,class (:inherit highlight))))
   `(line-number ((,class (:foreground ,inactive-fg))))
   `(line-number-current-line ((,class (:inherit highlight :foreground ,active-fg))))
   `(line-number-major-tick ((,class (:inherit highlight :foreground ,muted-fg))))
   `(line-number-minor-tick ((,class (:inherit line-number-major-tick))))
   `(border ((,class (:foreground ,dark-bg))))
   `(child-frame-border ((,class (:inherit border))))
   `(fill-column-indicator ((,class (:foreground ,inactive-fg))))
   `(internal-border ((,class (:inherit border))))
   `(vertical-border ((,class (:inherit border))))
   `(isearch ((,class (:background ,info-bg-hl :foreground ,info-bg))))
   `(isearch-fail ((,class (:background ,error-bg-hl :foreground ,error-fg-hl))))
   `(lazy-highlight ((,class (:background ,info-bg :foreground ,info-fg))))
   `(match ((,class (:inherit isearch))))
   `(show-paren-match ((,class (:background ,active-bg-hl :foreground ,active-fg))))
   `(show-paren-match-expression ((,class (:inherit show-paren-match))))
   `(show-paren-mismatch ((,class (:background ,error-bg-hl :foreground ,error-fg-hl))))
   `(header-line ((,class (:inherit mode-line))))
   `(header-line-highlight ((,class (:inherit mode-line-highlight))))
   `(menu ((,class (:background ,dark-bg :foreground ,fg))))
   `(mode-line ((,class (:inherit menu))))
   `(mode-line-active ((,class (:inherit (mode-line) :foreground ,active-fg :background ,active-bg))))
   `(mode-line-buffer-id ((,class (:weight bold))))
   `(mode-line-buffer-id-inactive ((,class (:inherit mode-line-buffer-id))))
   `(mode-line-emphasis ((,class (:weight bold))))
   `(mode-line-highlight ((,class (:background ,active-bg-hl :foreground ,active-fg))))
   `(mode-line-inactive ((,class (:inherit mode-line :foreground ,muted-fg :background ,dark-bg))))

   `(tab-bar ((,class (:inherit menu))))

   `(tab-line ((,class (:inherit menu))))
   `(tool-bar ((,class (:inherit menu))))
   `(tty-menu-disabled-face ((,class (:inherit menu :foreground ,inactive-fg))))
   `(tty-menu-enabled-face ((,class (:inherit menu))))
   `(tty-menu-selected-face ((,class (:inherit (highlight menu) :foreground ,active-fg))))

   ;;; = Dired =

   `(dired-broken-symlink ((,class (:inherit error))))
   `(dired-header ((,class (:foreground ,glitch-blue-fg))))
   `(dired-warning ((,class (:inherit warning :background ,warning-bg))))

   ;;; = Flymake =

   `(flymake-end-of-line-diagnostics-face ((,class (:background ,info-bg :foreground ,info-fg))))
   `(flymake-error ((,class (:background ,error-bg :foreground ,error-fg))))
   `(flymake-error-echo ((,class (:inherit flymake-error))))
   `(flymake-error-echo-at-eol ((,class (:inherit flymake-error))))
   `(flymake-note ((,class (:background ,info-bg :foreground ,info-fg))))
   `(flymake-note-echo ((,class (:inherit flymake-note))))
   `(flymake-note-echo-at-eol ((,class (:inherit flymake-note))))
   `(flymake-warning ((,class (:background ,warning-bg :foreground ,warning-fg))))
   `(flymake-warning-echo ((,class (:inherit flymake-warning))))
   `(flymake-warning-echo-at-eol ((,class (:inherit flymake-warning))))

   ;;; = Org =

   `(outline-1 ((,class (:foreground ,glitch-blue-fg))))
   `(outline-2 ((,class (:foreground ,safe))))
   `(outline-3 ((,class (:foreground ,glitch-cyan-fg))))
   `(outline-4 ((,class (:foreground ,glitch-magenta-fg))))
   `(outline-5 ((,class (:foreground ,glitch-magenta-fg))))
   `(outline-6 ((,class (:foreground ,glitch-yellow-fg))))
   `(outline-7 ((,class (:foreground ,glitch-red-fg))))
   `(outline-8 ((,class (:foreground ,special))))

   `(org-agenda-column-dateline ((,class (:inherit menu))))
   `(org-agenda-date ((,class (:inherit shadow))))
   `(org-agenda-date-today ((,class (:foreground ,active-fg))))
   `(org-agenda-dimmed-todo-face ((,class (:inherit shadow))))
   `(org-agenda-done ((,class (:inherit shadow))))
   `(org-agenda-restriction-lock ((,class (:inherit menu))))
   `(org-agenda-structure ((,class (:foreground ,glitch-blue-fg))))
   `(org-agenda-structure-filter ((,class (:inherit lazy-highlight))))
   `(org-archived ((,class (:inherit shadow))))
   `(org-block ((,class (:background ,dark-bg :foreground ,fg))))
   `(org-checkbox ((,class (:inherit highlight :foreground ,active-fg))))
   `(org-clock-overlay ((,class (:inherit secondary-selection))))
   `(org-column ((,class (:background ,dark-bg :foreground ,fg))))
   `(org-column-title ((,class (:inherit org-column :weight bold))))
   `(org-date ((,class (:foreground ,glitch-cyan-fg))))
   `(org-date-selected ((,class (:background ,alt-info-bg-hl :foreground ,alt-info-fg-hl))))
   `(org-dispatcher-highlight ((,class (:inherit lazy-highlight))))
   `(org-document-info ((,class (:foreground ,safe))))
   `(org-document-title ((,class (:foreground ,safe :weight bold))))
   `(org-done ((,class (:inherit shadow))))
   `(org-drawer ((,class (:inherit shadow))))
   `(org-ellipsis ((,class (:foreground ,special))))
   `(org-footnote ((,class (:foreground ,glitch-magenta-fg))))
   `(org-formula ((,class (:foreground ,special))))
   `(org-habit-alert-face ((,class (:background ,warning-bg :foreground ,warning-fg))))
   `(org-habit-alert-future-face ((,class (:inherit org-habit-alert))))
   `(org-habit-clear-face ((,class (:background ,alt-info-bg :foreground ,alt-info-fg))))
   `(org-habit-clear-future-face ((,class (:inherit org-habit-clear-face))))
   `(org-habit-overdue-face ((,class (:background ,error-bg :foreground ,error-fg))))
   `(org-habit-overdue-future-face ((,class (:inherit org-habit-overdue-face))))
   `(org-habit-ready-face ((,class (:background ,info-bg :foreground ,info-fg))))
   `(org-habit-ready-future-face ((,class (:inherit org-habit-ready-face))))
   `(org-headline-done ((,class (:inherit org-done))))
   `(org-headline-todo ((,class (:inherit org-todo))))
   `(org-latex-and-related ((,class (:foreground ,special))))
   `(org-meta-line ((,class (:inherit (shadow menu)))))
   `(org-mode-line-clock-overrun ((,class (:background ,error-bg-hl :foreground ,error-fg-hl))))
   `(org-priority ((,class (:foreground ,glitch-magenta-fg))))
   `(org-scheduled ((,class (:foreground ,info-fg))))
   `(org-scheduled-previously ((,class (:inherit warning))))
   `(org-scheduled-today ((,class (:background ,info-bg-hl :foreground ,info-fg-hl))))
   `(org-sexp-date ((,class (:foreground ,glitch-magenta-fg))))
   `(org-special-keyword ((,class (:inherit font-lock-keyword-face))))
   `(org-table ((,class (:foreground ,muted-fg))))
   `(org-table-header ((,class (:inherit menu))))
   `(org-time-grid ((,class (:inherit org-table))))
   `(org-todo ((,class (:inherit warning))))
   `(org-upcoming-deadline ((,class (:inherit warning))))

   ;;; = Syntax Highlighting =

   `(font-lock-builtin-face ((,class (:foreground ,glitch-blue-fg))))
   `(font-lock-comment-face ((,class (:foreground ,muted-fg))))
   `(font-lock-constant-face ((,class (:foreground ,safe))))
   `(font-lock-doc-face ((,class (:inherit font-lock-comment-face))))
   `(font-lock-function-call-face ((,class (:foreground ,glitch-blue-fg))))
   `(font-lock-function-name-face ((,class (:inherit font-lock-function-call-face))))
   `(font-lock-keyword-face ((,class (:foreground ,glitch-magenta-fg))))
   `(font-lock-negation-char-face ((,class (:foreground ,glitch-red-fg))))
   `(font-lock-number-face ((,class (:foreground ,safe))))
   `(font-lock-operator-face ((,class (:inherit font-lock-function-call-face))))
   `(font-lock-property-name-face ((,class (:foreground ,glitch-cyan-fg))))
   `(font-lock-property-use-face ((,class (:foreground ,glitch-cyan-fg))))
   `(font-lock-string-face ((,class (:foreground ,safe))))
   `(font-lock-type-face ((,class (:foreground ,glitch-magenta-fg))))
   `(font-lock-variable-name-face ((,class (:foreground ,glitch-cyan-fg))))
   `(font-lock-variable-use-face ((,class (:foreground ,glitch-cyan-fg))))
   `(font-lock-warning-face ((,class (:inherit warning))))

   ;;; = External Packages =

   ;; == ace-window ==

   `(aw-background-face ((,class ())))
   `(aw-key-face ((,class (:foreground ,glitch-blue-fg))))
   `(aw-leading-char-face ((,class (:foreground ,glitch-green-fg :weight bold))))
   `(aw-minibuffer-leading-char-face ((,class (:inherit aw-leading-char-face))))
   `(aw-mode-line-face ((,class (:foreground ,fg :weight bold))))

   ;; == avy ==

   `(avy-goto-char-timer-face ((,class (:inherit lazy-highlight))))
   `(avy-lead-face ((,class (:inherit isearch))))
   `(avy-lead-face-0 ((,class (:inherit avy-lead-face))))
   `(avy-lead-face-1 ((,class (:background ,error-bg-hl :foreground ,error-fg-hl))))
   `(avy-lead-face-2 ((,class (:background ,alt-info-bg-hl :foreground ,alt-info-fg-hl))))

   ;;; = centaur-tabs =

   `(centaur-tabs-active-bar-face ((,class (:foreground ,active-fg))))
   `(centaur-tabs-close-mouse-face ((,class (:foreground ,active-fg))))
   `(centaur-tabs-close-selected ((,class (:inverse-video t))))
   `(centaur-tabs-close-unselected ((,class (:inherit centaur-tabs-unselected))))

   `(centaur-tabs-default ((,class (:inherit default))))

   `(centaur-tabs-jump-identifier-selected ((,class (:inherit centaur-tabs-selected :foreground ,glitch-green-fg))))
   `(centaur-tabs-jump-identifier-unselected ((,class (:inherit centaur-tabs-unselected :foreground ,active-fg))))

   `(centaur-tabs-modified-marker-selected ((,class (:inherit centaur-tabs-selected))))
   `(centaur-tabs-modified-marker-unselected ((,class (:inherit centaur-tabs-unselected))))

   `(centaur-tabs-name-mouse-face ((,class (:foreground ,active-fg))))

   `(centaur-tabs-selected ((,class (:inherit highlight :background ,active-bg :foreground ,active-fg))))
   `(centaur-tabs-selected-modified ((,class (:background ,warning-bg :foreground ,warning-fg))))
   `(centaur-tabs-unselected ((,class (:inherit tab-line :foreground ,muted-fg))))
   `(centaur-tabs-unselected-modified ((,class (:inherit tab-line :foreground ,glitch-yellow-fg))))

   ;; == company ==

   `(company-echo ((,class (:inherit default))))
   `(company-echo-common ((,class (:background ,info-bg :foreground ,info-fg))))

   `(company-preview ((,class (:inherit highlight))))
   `(company-preview-common ((,class (:inherit company-echo-common))))
   `(company-preview-search ((,class (:inherit company-echo-common))))

   `(company-template-field ((,class (:inherit highlight))))

   `(company-tooltip ((,class (:inherit default :background ,dark-bg))))
   `(company-tooltip-annotation ((,class (:foreground ,glitch-magenta-fg))))
   `(company-tooltip-common ((,class (:inherit company-echo-common))))
   `(company-tooltip-common-selection ((,class (:inherit company-tooltip-common))))
   `(company-tooltip-deprecated ((,class (:foreground ,special))))
   `(company-tooltip-mouse ((,class (:inherit highlight))))
   `(company-tooltip-quick-access ((,class (:foreground ,glitch-magenta-fg))))
   `(company-tooltip-quick-access-selection ((,class (:inherit company-tooltip-quick-access))))
   `(company-tooltip-scrollbar-thumb ((,class (:background ,muted-fg))))
   `(company-tooltip-scrollbar-track ((,class (:background ,active-bg))))
   `(company-tooltip-search ((,class (:inherit highlight))))
   `(company-tooltip-search-selection ((,class (:inherit company-echo-common))))
   `(company-tooltip-selection ((,class (:inherit company-echo-common))))

   ;; == diff-hl ==

   `(diff-hl-change ((,class (:background ,warning-bg-hl :foreground ,warning-bg-hl))))
   `(diff-hl-delete ((,class (:background ,error-bg-hl :foreground ,error-bg-hl))))
   `(diff-hl-insert ((,class (:background ,info-bg-hl :foreground ,info-bg-hl))))
   `(diff-hl-reverted-hunk-highlight ((,class (:inverse-video t))))

   `(diff-hl-margin-change ((,class (:inherit diff-hl-change))))
   `(diff-hl-margin-delete ((,class (:inherit diff-hl-delete))))
   `(diff-hl-margin-insert ((,class (:inherit diff-hl-insert))))
   `(diff-hl-margin-ignored ((,class (:inverse-video t))))
   `(diff-hl-margin-unknown ((,class (:inverse-video t))))

   `(diff-hl-dired-change ((,class (:inherit diff-hl-change))))
   `(diff-hl-dired-delete ((,class (:inherit diff-hl-delete))))
   `(diff-hl-dired-insert ((,class (:inherit diff-hl-insert))))
   `(diff-hl-dired-ignored ((,class (:inverse-video t))))
   `(diff-hl-dired-unknown ((,class (:inverse-video t))))

   ;; == dirvish ==

   `(dirvish-hl-line ((,class (:inherit highlight :foreground ,active-fg))))

   ;; == git-timemachine ==

   `(git-timemachine-commit ((,class (:foreground ,glitch-blue-fg))))
   `(git-timemachine-minibuffer-author-face ((,class (:foreground ,glitch-magenta-fg))))
   `(git-timemachine-minibuffer-detail-face ((,class (:foreground ,info-fg))))

   ;; == hl-todo ==

   `(hl-todo ((,class (:foreground ,glitch-yellow-fg :weight bold))))

   ;; = magit =

   `(diff-refine-added ((,class (:background ,info-bg :foreground ,info-fg))))
   `(diff-refine-removed ((,class (:background ,error-bg :foreground ,error-fg))))
   `(magit-bisect-bad ((,class (:background ,error-bg :foreground ,error-fg))))
   `(magit-bisect-good ((,class (:background ,info-bg :foreground ,info-fg))))
   `(magit-bisect-skip ((,class (:background ,warning-bg :foreground, warning-fg))))
   `(magit-blame-date ((,class (:inherit default))))
   `(magit-blame-dimmed ((,class (:inherit shadow))))
   `(magit-blame-hash ((,class (:inherit default))))
   `(magit-branch-local ((,class (:foreground ,glitch-blue-fg))))
   `(magit-branch-remote ((,class (:foreground ,glitch-magenta-fg))))
   `(magit-diff-added ((,class (:inherit magit-diff-context))))
   `(magit-diff-added-highlight ((,class (:background ,info-bg :foreground ,info-fg))))
   `(magit-diff-context ((,class (:inherit shadow :background ,bg))))
   `(magit-diff-context-highlight ((,class (:background ,active-bg :foreground ,fg))))
   `(magit-diff-file-heading ((,class (:inherit shadow :background ,bg))))
   `(magit-diff-file-heading-highlight ((,class (:background ,active-bg :foreground ,active-fg))))
   `(magit-diff-hunk-heading ((,class (:inherit shadow :background ,bg))))
   `(magit-diff-hunk-heading-highlight ((,class (:background ,active-bg :foreground ,active-fg))))
   `(magit-diff-hunk-region ((,class (:background ,warning-bg :foreground ,warning-fg))))
   `(magit-diff-lines-heading ((,class (:inherit shadow :background ,bg))))
   `(magit-diff-removed ((,class (:inherit magit-diff-context))))
   `(magit-diff-removed-highlight ((,class (:background ,error-bg :foreground ,error-fg))))
   `(magit-diff-whitespace-warning ((,class ())))
   `(magit-item-highlight ((,class (:inherit highlight))))
   `(magit-section-heading ((,class (:foreground ,glitch-blue-fg))))
   `(magit-section-highlight ((,class (:background ,active-bg :foreground ,active-fg))))

   ;;; = marginalia =

   `(marginalia-archive ((,class (:foreground ,special))))
   `(marginalia-char ((,class (:foreground ,glitch-magenta-fg))))
   `(marginalia-date ((,class (:foreground ,glitch-blue-fg))))
   `(marginalia-documentation ((,class (:inherit comment))))
   `(marginalia-file-name-face ((,class (:inherit comment))))
   `(marginalia-file-owner ((,class (:foreground ,glitch-blue-fg))))
   `(marginalia-file-priv-dir ((,class (:foreground ,glitch-yellow-fg))))
   `(marginalia-file-priv-exec ((,class (:foreground ,glitch-red-fg))))
   `(marginalia-file-priv-link ((,class (:foreground ,glitch-yellow-fg))))
   `(marginalia-file-priv-no ((,class (:inherit comment))))
   `(marginalia-file-priv-other ((,class (:foreground ,glitch-blue-fg))))
   `(marginalia-file-priv-rare ((,class (:foreground ,special))))
   `(marginalia-file-priv-read ((,class (:foreground ,glitch-green-fg))))
   `(marginalia-file-priv-write ((,class (:foreground ,glitch-red-fg))))
   `(marginalia-function ((,class (:inherit font-lock-function-name-face))))
   `(marginalia-installed ((,class (:foreground ,glitch-magenta-fg))))
   `(marginalia-key ((,class (:foreground ,glitch-magenta-fg))))
   `(marginalia-lighter ((,class (:foreground ,safe))))
   `(marginalia-list ((,class (:foreground ,safe))))
   `(marginalia-mode ((,class (:foreground ,qualifier))))
   `(marginalia-modified ((,class (:inherit warning))))
   `(marginalia-null ((,class (:inherit comment))))
   `(marginalia-number ((,class (:foreground ,safe))))
   `(marginalia-off ((,class (:foreground ,glitch-red-fg))))
   `(marginalia-on ((,class (:foreground ,glitch-green-fg))))
   `(marginalia-size ((,class (:foreground ,safe))))
   `(marginalia-string ((,class (:foreground ,safe))))
   `(marginalia-symbol ((,class (:inherit font-lock-keyword-face))))
   `(marginalia-true ((,class (:foreground ,glitch-blue-fg))))
   `(marginalia-value ((,class (:inherit font-lock-variable-use-face))))
   `(marginalia-version ((,class (:foreground ,qualifier))))
   `(marginalia-key ((,class (:foreground ,font-lock-variable-name-face))))
   `(marginalia-file-priv-dir ((,class (:foreground ,glitch-magenta-fg))))
   `(marginalia-file-priv-link ((,class (:foreground ,glitch-magenta-fg))))

   ;;; = pulsar =

   `(pulsar-generic ((,class (:background ,info-bg :foreground ,info-fg))))
   `(pulsar-blue ((,class (:inherit pulsar-generic))))
   `(pulsar-cyan ((,class (:background ,glitch-cyan-bg :foreground ,glitch-cyan-fg))))
   `(pulsar-green ((,class (:background ,glitch-green-bg :foreground ,glitch-green-fg))))
   `(pulsar-magenta ((,class (:background ,glitch-magenta-bg :foreground ,glitch-magenta-fg))))
   `(pulsar-red ((,class (:background ,glitch-red-bg :foreground ,glitch-red-fg))))
   `(pulsar-yellow ((,class (:background ,glitch-yellow-bg :foreground ,glitch-yellow-fg))))

   ;;; = tree-sitter =

   `(tree-sitter-hl-face:comment ((,class (:inherit font-lock-comment-face))))
   `(tree-sitter-hl-face:constant ((,class (:inherit font-lock-constant-face))))
   `(tree-sitter-hl-face:constant.builtin ((,class (:inherit font-lock-constant-face))))
   `(tree-sitter-hl-face:constructor ((,class (:inherit font-lock-function-call-face))))
   `(tree-sitter-hl-face:doc ((,class (:inherit font-lock-doc-face))))
   `(tree-sitter-hl-face:function ((,class (:inherit font-lock-function-call-face))))
   `(tree-sitter-hl-face:function.builtin ((,class (:inherit font-lock-builtin-face))))
   `(tree-sitter-hl-face:function.call ((,class (:inherit font-lock-function-call-face))))
   `(tree-sitter-hl-face:function.macro ((,class (:inherit font-lock-function-call-face))))
   `(tree-sitter-hl-face:function.special ((,class (:inherit font-lock-function-call-face))))
   `(tree-sitter-hl-face:keyword ((,class (:inherit font-lock-keyword-face))))
   `(tree-sitter-hl-face:method ((,class (:inherit font-lock-function-call-face))))
   `(tree-sitter-hl-face:method.call ((,class (:inherit font-lock-function-call-face))))
   `(tree-sitter-hl-face:number ((,class (:inherit font-lock-number-face))))
   `(tree-sitter-hl-face:operator ((,class (:inherit font-lock-operator-face))))
   `(tree-sitter-hl-face:property ((,class (:inherit font-lock-property-use-face))))
   `(tree-sitter-hl-face:property.definition ((,class (:inherit font-lock-property-name-face))))
   `(tree-sitter-hl-face:punctuation.special ((,class (:foreground ,special))))
   `(tree-sitter-hl-face:string ((,class (:inherit font-lock-string-face))))
   `(tree-sitter-hl-face:string.special ((,class (:inherit font-lock-string-face))))
   `(tree-sitter-hl-face:type ((,class (:inherit font-lock-type-face))))
   `(tree-sitter-hl-face:type.argument ((,class (:inherit font-lock-type-face))))
   `(tree-sitter-hl-face:type.builtin ((,class (:inherit font-lock-type-face))))
   `(tree-sitter-hl-face:type.parameter ((,class (:inherit font-lock-type-face))))
   `(tree-sitter-hl-face:type.super ((,class (:inherit font-lock-type-face))))
   `(tree-sitter-hl-face:variable ((,class (:inherit font-lock-variable-name-face))))
   `(tree-sitter-hl-face:variable.builtin ((,class (:inherit font-lock-variable-name-face))))
   `(tree-sitter-hl-face:variable.parameter ((,class (:inherit font-lock-variable-name-face))))
   `(tree-sitter-hl-face:variable.special ((,class (:inherit font-lock-variable-name-face))))

   ;; == vertico ==

   `(vertico-current ((,class (:inherit region))))
   `(vertico-group-separator ((,class (:inherit comment))))
   `(vertico-group-title ((,class (:foreground ,glitch-blue-fg))))
   `(vertico-multiline ((,class (:foreground ,special))))

   ;; == volatile-highlights ==

   `(vhl/default-face ((,class (:inherit secondary-selection))))

   ;; == which-key ==

   `(which-key-command-description-face ((,class (:inherit font-lock-function-name-face))))
   `(which-key-docstring-face ((,class (:inherit comment))))
   `(which-key-group-description-face ((,class (:inherit font-lock-keyword-face))))
   `(which-key-highlighted-command-face ((,class (:inherit font-lock-function-call-face))))
   `(which-key-key-face ((,class (:inherit font-lock-variable-name-face))))
   `(which-key-local-map-description-face ((,class (:foreground ,glitch-green-fg))))
   `(which-key-note-face ((,class (:inherit comment))))
   `(which-key-separator-face ((,class (:inherit comment))))
   `(which-key-special-key-face ((,class (:foreground ,special))))

   ))

;;;###autoload
(when (and (boundp 'custom-theme-load-path) load-file-name)
  (add-to-list 'custom-theme-load-path
    (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'glitch)
;;; glitch-theme.el ends here
