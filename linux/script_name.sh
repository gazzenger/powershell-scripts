#!/usr/bin/env bash
# This code deploys to the Ops-server when changes are made to the Development branch 
# Input parameters are
#   $1 - BLAHBLAH
#   $2 - BLAHBLAH
#   $3 - BLAHBLAH
...

echo "Deploy script started"

    #Example of ssh command
        ssh $5@$6 -n "SOME COMMAND;SOME OTHER COMMAND;exit;"
    
    #Example of SCP
    echo;echo "------";echo;
        scp $5@$6:./FILENAME.sql ./db-backups

    #Example with runing sudo and piping commands
    echo;echo "------";echo;
        echo $1 | sudo -S -i -u webapps sh -c \
            "SOME COMMAND;
            SOME OTHER COMMAND;"

    #Example with running command as separate process, outputting logs to file, and exiting out
    echo;echo "---Deploying, check ${3} for logs---";echo;
        echo $1 | sudo -S -i -u webapps sh -c \
            "nohup sh -c '
                echo Started;
                    SOME COMMAND;
                echo;echo \"------\";echo;
                    time SOME OTHER COMMAND WITH TIMING;
            echo Done' > ${3} 2>&1 &"


echo;echo "Deploy script finished execution";echo;
exit
# THIS LINE MUST REMAIN
