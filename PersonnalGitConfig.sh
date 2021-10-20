#!/bin/bash

git config --global user.name "Mohamed Amine Khelassi"
git config --global user.email aminou98@gmail.com

git config --global color.diff auto
git config --global color.status auto
git config --global color.branch auto

git config --global core.editor "code --wait"

git config --global merge.tool vscode
git config --global mergetool.vscode.cmd 'code --wait $MERGED'

git config --global diff.tool vscode
git config --global diff.tool vscode