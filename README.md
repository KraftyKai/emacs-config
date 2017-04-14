Basic emacs configurations for software developments.  Installing the `.emacs` and `.pylintrc` files in a user's home directory should automatically install required packages and load the emacs environment as intended on next load.

## Notes
I tend to use 2 space indent, even for python (in absolute defiance of pep8!).  If using 2 space indents for python the included `.pylintrc` file should be included in the home directory.  If you're a total conformist then do not include `.pylintrc` and also edit `.emacs` to suit your indentive conformity needs.

## What's Included
* Flycheck for python (and other file) linting
* ECB to extend the emacs window to provide some useful tools for surfing directories (kind of like you'd see in vim)
* hs-minor-mode (HideShow) to allow for cold folding in emacs.

## Basic Flycheck useage instructions
* `C-c ! l` - See flycheck errors

## Basic ECB useage instructions
* `C-c . g h` - Go to history
* `C-c . g m` - Go to methods
* `C-c . g s` - Go to sources
* `C-c . g d` - Go to directories
* `C-c . g 1` - Go to main buffer

## HideShow minor mode
* `C-c @ C-h` - Hide the current block (hs-hide-block)
* `C-c @ C-s` - Show the current block (hs-show-block)
* `C-c @ C-c` - Either hide or show the current block (hs-toggle-hiding)
* `C-c @ C-M-h` - Hide all top-level blocks (hs-hide-all)
* `C-c @ C-M-s` - Show all blocks in the buffer (hs-show-all)
* `C-c @ C-l` - Hide all blocks n levels below this block (hs-hide-level)