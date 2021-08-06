"
GtRemoteExamplesCommandLineHandler runs examples that require external servers to be running, e.g. pharo, GemStone, Python and JavaScript.

As these tests require the external environment to be set up and configured, they're not part of the standard test suite.
"
Class {
	#name : #GtRemoteExamplesCommandLineHandler,
	#superclass : #GtExamplesCommandLineHandler,
	#category : 'GToolkit-RemoteGt'
}

{ #category : #accessing }
GtRemoteExamplesCommandLineHandler class >> commandName [
	^ 'gtRemoteServerExamples'
]

{ #category : #accessing }
GtRemoteExamplesCommandLineHandler class >> description [
	^ 'Run Gtoolkit examples that are dependent on external servers'.
]

{ #category : #private }
GtRemoteExamplesCommandLineHandler >> ensureRemoteExamplesLoaded [
	| repository remoteExamples |

	remoteExamples := 'GToolkit-RemoteExamples'.
	repository := IceRepository registeredRepositoryIncludingPackage: 'GToolkit-RemotePhlow-Examples' asPackage.
	self assert: (repository includesPackageNamed: remoteExamples).
	repository loadedPackages 
		detect: [ :package | package name = remoteExamples ]
		ifFound: [ :package | ^ self ].
	repository workingCopy loadPackageNamed: remoteExamples.
]

{ #category : #accessing }
GtRemoteExamplesCommandLineHandler >> packages [ 

	self ensureRemoteExamplesLoaded.
	^ #('GToolkit-RemotePhlow-Examples' 'GToolkit-RemoteExamples')
]
