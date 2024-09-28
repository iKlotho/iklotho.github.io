#!/bin/bash
# https://rasor.github.io/using-pelican-blog-on-github-pages.html
git add .
git commit -a -m %1
git push -u origin pelican
pelican content -o output -s pelicanconf.py
ghp-import output -r origin -b master
git push origin master
git checkout pelican