#! /bin/bash
### Load gtoolkit-remote from .gs files into a standard stone
### Exits with 0 if success, 1 if failed

gtRemoteHome=${ROWAN_PROJECTS_HOME}/gtoolkit-remote
## Topaz refuses to exit from script if input is stdin, so redirect from /dev/zero
topaz -l -I ${gtRemoteHome}/scripts/loginSystemUser.topaz  -S ${gtRemoteHome}/scripts/inputGtoolkit-remote.topaz < /dev/zero
if [ $? = 0 ]
    then
        exit 0
    else
        echo !!!!!!!!!!!
        echo LOAD FAILED for gtoolkit-remote
        echo !!!!!!!!!!!
        exit 1
    fi
