#!/usr/bin/env bash
ssh $1@$2 -n "command1 '$3'; exit;"
scp $1@$2:./somefile ./
echo $1 | sudo -S -i -u testuser sh -c "command1 '$3';command2 '$3';"
exit
#keep this extra line
