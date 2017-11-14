#!/bin/sh
git pull && markdown ./todos.md | mail -s "Daily TODOS" -a "Content-type: text/html" whatever@you.want
