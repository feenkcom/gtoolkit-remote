#!/bin/bash
#
# Run the remote Pharo examples in GtRemotePharoDeclarativeExamples
#
# Assumes that the environment should be located in `remote-pharo` below the 
# working directory, which is typically the image directory.
#
set -e
trap stop_servers EXIT

function stop_servers()
{
	# Shutdown all the remote servers
	# WARNING: This will kill every server on this machine, 
	# not just those associated with the current job
	pgrep -f pharoLinkServer > pkill.$$
	cat pkill.$$ | xargs kill
	rm pkill.$$
}


# Install the remote environment, if required
if [ ! -d remote-pharo ]
then
	$SCRIPTS/setup-remote-pharo.sh
fi

# Start the remote server
remote-pharo/pharo remote-pharo/Pharo.image clap pharoLinkServer 7001 7002 &
sleep 1
# Run the remote examples
./glamoroustoolkit GlamorousToolkit.image gtRemoteServerExamples --junit-xml-output --verbose

exit 0
