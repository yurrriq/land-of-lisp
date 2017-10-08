(TeX-add-style-hook
 "guess"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("tufte-handout" "nobib")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("minted" "outputdir=src")))
   (add-to-list 'LaTeX-verbatim-environments-local "minted")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "lsp")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperref")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "lsp")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (TeX-run-style-hooks
    "latex2e"
    "tufte-handout"
    "tufte-handout10"
    "noweb"
    "color"
    "hyperref"
    "amsmath"
    "amssymb"
    "minted")
   (TeX-add-symbols
    '("lsp" [TeX-arg-key-val LaTeX-minted-key-val-options-local] TeX-arg-verb))
   (LaTeX-add-labels
    "sec:top-level-defs"
    "sec:guess-my-number")
   (LaTeX-add-color-definecolors
    "ErlangRed"))
 :latex)

