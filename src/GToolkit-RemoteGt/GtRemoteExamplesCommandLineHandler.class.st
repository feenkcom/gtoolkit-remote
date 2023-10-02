"
GtRemoteExamplesCommandLineHandler runs examples that require external servers to be running, e.g. pharo, GemStone, Python and JavaScript.

As these tests require the external environment to be set up and configured, they're not part of the standard test suite.
"
Class {
	#name : #GtRemoteExamplesCommandLineHandler,
	#superclass : #GtExamplesCommandLineHandler,
	#category : #'GToolkit-RemoteGt'
}

{ #category : #accessing }
GtRemoteExamplesCommandLineHandler class >> checksLabel [
	^ 'Example'
]

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

	remoteExamples := 'GToolkit-RemoteExamples-GemStone'.
	repository := IceRepository registeredRepositoryIncludingPackage: 'GToolkit-RemotePhlow-Examples' asPackage.
	self assert: (repository workingCopy packageNames includes: remoteExamples).
	repository loadedPackages 
		detect: [ :package | package name = remoteExamples ]
		ifFound: [ :package | ^ self ].
	repository workingCopy loadPackageNamed: remoteExamples.
]

{ #category : #accessing }
GtRemoteExamplesCommandLineHandler >> packages [ 
	"Answer the list of packages to be run.
	If --package is provided, answer only the specified package"
	| arguments index |

	self ensureRemoteExamplesLoaded.
	arguments := self arguments.
	index := arguments indexOf: '--package'.
	index = 0 ifTrue:
		[ ^ #('GToolkit-RemotePhlow-Examples' 'GToolkit-RemoteExamples' 'GToolkit-RemoteExamples-GemStone') ].
	^ { arguments at: index+1 }
]
