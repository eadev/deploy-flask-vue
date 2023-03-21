#!/bin/bash
#### DEVOPS -  EDWIN ARIZA
#### FACILITANDO EL DESPLIEGUE DE APLICACIONES FLASK.
echo "FLASK - START"
FILE=.gitmodules
if [[ $1 != "" ]]
    then
        cd $1/
        if [[ $2 != "" ]]
            then
                BRANCH=$2
                echo "INCLUDE pull origin $BRANCH"
                git checkout $BRANCH
                git pull origin $BRANCH
                if test -f "$FILE"
                  then
                    echo "UPDATING SUBMODULES"
                    git submodule init
                    git submodule update
                  fi
            fi
    else
        git pull
        if test -f "$FILE"
          then
            echo "UPDATING SUBMODULES"
            git submodule init
            git submodule update
          fi
    fi
exit
