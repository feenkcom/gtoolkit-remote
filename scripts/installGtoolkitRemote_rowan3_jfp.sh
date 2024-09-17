#! /bin/bash
### Install gtoolkit-remote from Tonel files into a Rowan-enabled stone
### Exits with 0 if success, 1 if failed

gt4GemstoneHome=${ROWAN_PROJECTS_HOME}/gtoolkit-remote
## Topaz refuses to exit from script if input is stdin, so redirect from /dev/zero
topaz -l -I ${gt4GemstoneHome}/scripts/loginSystemUser.topaz  -S ${gt4GemstoneHome}/scripts/installGtoolkit-remote.topaz < /dev/zero
if [ $? = 0 ]
    then
        echo gtoolkit-remote loaded, now updating Rowan3 extent for use with JfP
    else
        echo !!!!!!!!!!!!!!
        echo INSTALL FAILED for gtoolkit-remote
        echo !!!!!!!!!!!!!!
        exit 1
    fi

## Update for 3.7.1 and 3.7.1.4 Rowan 3 image and JadeiteForPharo
#
## Topaz refuses to exit from script if input is stdin, so redirect from /dev/zero
topaz -l -I ${gt4GemstoneHome}/scripts/loginSystemUser.topaz  -S ${gt4GemstoneHome}/scripts/updateForRowan3_JfP-gemstone.topaz < /dev/zero
if [ $? = 0 ]
    then
        exit 0
    else
        echo !!!!!!!!!!!!!!
        echo INSTALL FAILED for Rowan 3 JfP update
        echo !!!!!!!!!!!!!!
        exit 1
    fi

