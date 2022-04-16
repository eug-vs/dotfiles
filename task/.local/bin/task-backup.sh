#!/bin/sh

# Taskwarrior
cd ~/.task || exit
tar czf task-backup-$(date +'%Y%m%d').tar.gz *.data
mv *.tar.gz ~/Documents/Backup

# Timewarrior
cd ~/.timewarrior/data
tar czf timew-backup-$(date +'%Y%m%d').tar.gz *.data
mv *.tar.gz ~/Documents/Backup

