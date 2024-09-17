#! /bin/bash
### Export gtoolkit-remote to a .gs file.
### Requires loginSystemUser.topaz be configured with the correct credentials.
### Exits with 0 if success, topaz status if failed.

set -e

if [ -z "$ROWAN_PROJECTS_HOME" ]
then
	echo "ROWAN_PROJECTS_HOME must be defined"
	exit 1
fi

if [ -z "$STONE" ]
then
	echo "STONE must be defined"
	exit 1
fi

repositoryDir=${ROWAN_PROJECTS_HOME}/gtoolkit-remote
## Topaz refuses to exit from script if input is stdin, so redirect from /dev/zero
topaz -l -I ${repositoryDir}/scripts/loginSystemUser.topaz  -S ${repositoryDir}/scripts/convertToGsFormat_rowan3.topaz < /dev/zero
status=$?
if [ $status != 0 ]
then
        echo !!!!!!!!!!!!!!!!
        echo Failed to export $repositoryDir
        echo !!!!!!!!!!!!!!!!
        exit $status
fi

exit 0
