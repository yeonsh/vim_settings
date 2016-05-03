command! Commit :r!msg="`curl http://whatthecommit.com/index.txt 2>/dev/null`"; echo "$msg"; echo "via http://whatthecommit.com/`echo $msg | md5`"
