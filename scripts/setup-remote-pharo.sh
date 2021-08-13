#!/bin/bash
#
# Set up the remote Pharo environment for running the examples in GtRemotePharoDeclarativeExamples
#
# Assumes that the environment should be located in `remote-pharo` below the 
# working directory, which is typically the image directory.
#
set -e

if [ -e remote-pharo ]
then
	echo "ERROR: remote-pharo subdirectory already exists"
	exit 1
fi

# Install GGToolkit-RemoteExamples-Pharo
./bin/GlamorousToolkit-cli GlamorousToolkit.image eval --save "Metacello new \
	repository: 'github://feenkcom/gtoolkit-remote:main/src'; \
	baseline: 'GtRemotePharoExamples'; \
	load."
echo "GtRemotePharoExamples loaded"

mkdir remote-pharo
cd remote-pharo
curl get.pharo.org/64/90+vm | bash
./pharo Pharo.image eval --save "Metacello new repository: 'github://feenkcom/gtoolkit-remote:main/src'; baseline: 'GtRemotePhlow'; load"

