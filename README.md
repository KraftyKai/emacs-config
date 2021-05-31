Basic emacs configurations for software developments.  Installing the `.emacs` and `.pylintrc` files in a user's home directory should automatically install required packages and load the emacs environment as intended on next load.

## Example
<img width="1314" alt="screen shot 2017-04-14 at 11 52 06 am" src="https://cloud.githubusercontent.com/assets/6238872/25049742/e9c42db2-2108-11e7-88bb-d11808ffcea6.png">


## Notes
* I tend to use 2 space indent, even for python (in absolute defiance of pep8!).  If using 2 space indents for python the included `.pylintrc` file should be included in the home directory.  If you're a total conformist then do not include `.pylintrc` and also edit `.emacs` to suit your indentive conformity needs.
* You need to edit the `.emacs` file to be updated with your home location in order for `ecb` to work properly.  Additionally you may need to find the location of `ecb.el` if you notice that ecb is not working.  (This is roughly in code line 17)

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

## Golang specific details
* [go-mode](https://github.com/dominikh/go-mode.el) is included, see link for instructions
* Seems error handling works pretty well so I have, at this time, not included [goflymake](https://github.com/dougm/goflymake)  or any other related exteznsions
* I did include [eldoc](https://github.com/syohex/emacs-go-eldoc) for go as it seems really useful.
    * This does require installing gocode with `% go get -u github.com/nsf/gocode`
        * It's also worth noting that gocode isn't supported anymore.  There is an alternative but for what I need it for, for now, it works.  So ::shrug::...
* I've also added support for godoc (autocomplete).  You can disable this by removing the lines related to go-autcomplete.
    * Install gocode with `go get -u github.com/stamblerre/gocode`.
        * This is a newer version (forked) of the gocode you installed above.  Right now I have both installed in my environment and it works fine.  Maybe the other can be removed.  It's worth a try.  This is the one you definitely want to keep.
    * See [the docs](https://github.com/stamblerre/gocode) for details and updates in case things break.

## OSX Specific Notes
Apple likes to wrap us user's in proprietary bubble wrap and duct tape to protect you from yourself.  You will need to be aware of a few things to get this working with OSX emacs.
* OSX Pre-installed Emacs is an ancient version 22.2.  This will not do (or even work... it actually will not work).
* OSX Does not support a version of Emacs newer than 22.2 for unknown reasons, but we assume it's related to CopyLeft license used in newer version of Emacs.
* To work around this install Emacs with homebrew!
    * [Installing Homebrew](https://brew.sh/)
    * Install Emacs with `brew install emacs`
    * Don't forget to `brew link emacs`!
        * You can verify this worked with `emacs --version`.  It should now be a version newer than 22.2!

## A Note on markdown-mode
Markdown-mode may have issues.  You will know this as emacs will give specific errors related to markdown mode.  Running `M-x package-refresh-contents` appears to fix this problem.

## Initial emacs load may fail
For reasons still unknown emacs fails on first load.  I'll try to capture the details in a future bug/issue.  For now, know to expect it, and know that closing emacs and starting `emacs` again reliably fixes this issue, and everything will work in both linux and osx.  Use Windows at your own peril!
