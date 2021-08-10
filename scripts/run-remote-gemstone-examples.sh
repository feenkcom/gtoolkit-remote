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
	# Shutdown the GemStone servers
	stopstone -i gs64stone DataCurator swordfish
	stopnetldi
}


# Install the remote environment, if required
if [ ! -d remote-gemstone ]
then
	$SCRIPTS/setup-remote-gemstone.sh
fi

source ./pharo-local/iceberg/feenkcom/gtoolkit-remote/scripts/remote-gemstone-env.sh

# Start the remote server
startnetldi -g
startstone
sleep 1
# Run the remote examples
./bin/GlamorousToolkit-cli GlamorousToolkit.image gtRemoteServerExamples --junit-xml-output --verbose --package GToolkit-RemoteExamples-GemStone

exit 0
