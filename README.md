# Automatic-emaliing-md
This repository is dedicated to send automatic email notification of markdown text.  
You only need to update the markdown file with git.  
The script will 1) pull the changes, 2) convert it to HTML format, and 3) send it to the target email address you want.  
You can set the time you want to receive the email, for example, every 10am in the morning.

## Motivation
This project wass motivated by a simple idea.
> Can I manage my "todos" with git?

> Can it be automatically sent to an email every morning, so that I can clearly see what I have to do that day?

Although this repo started from TODO list, it can be used in notifying any other files that are formated in markdown. 

## Configuration
The script works on Ubuntu 16.04  
The commands may vary by which OS you use.   
I will try to update the repo to support other OS.  
Any contribution is welcomed. 

## Instruction
1. first you need to enable sending email in Ubuntu server. I used `postfix` and `mailutils` package, but you may also use the `sendmail` package. 
Follow instruction described [here](https://easyengine.io/tutorials/linux/ubuntu-postfix-gmail-smtp/).
This step can take some time and patience.

2. `git config --global credential.helper cache && git pull`
in order to avoid typing username, password for the automatic git pull command, you need to cache the info.

3. make shell script that pull the git todos repo, and send the content as a body of the email.
You have to change the destination email address, and also the filename if it's needed.
```
git pull && markdown ./todos.md | mail -s "Daily TODOS" -a "Content-type: text/html" whatever@you.want
```
If you use `sendmail` package, you have to change `mail` to `sendmail`

4. set to run the script everyday using crontab.
You can set the specific time you want to receive the email, by configuring the 5 parameters. (minute/hour/day/month/day of week)
```
crontab -e
00 10 * * * cd /path/to/script && sh email_md.sh
``` 
Example code above makes email notification on every 10am.

