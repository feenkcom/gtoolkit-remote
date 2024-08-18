Class {
	#name : #GtRemotePhlowDeclarativeExamples,
	#superclass : #Object,
	#instVars : [
		'server'
	],
	#category : #'GToolkit-RemotePhlow-Examples'
}

{ #category : #testing }
GtRemotePhlowDeclarativeExamples class >> isAbstract [
	^ self name = #GtRemotePhlowDeclarativeExamples
]

{ #category : #private }
GtRemotePhlowDeclarativeExamples >> basicServer [
	^ server
]

{ #category : #private }
GtRemotePhlowDeclarativeExamples >> basicServer: aServer [
	server := aServer
]

{ #category : #private }
GtRemotePhlowDeclarativeExamples >> getRemoteObject [
	^ self subclassResponsibility
]

{ #category : #examples }
GtRemotePhlowDeclarativeExamples >> remoteObject [
	"Answer the remote GtRemotePhlowDeclarativeTestInspectable instance.
	This will be a proxy with a remote server."
	<gtExample>
	<after: #stopServer>
	| remoteObject collection |

	remoteObject :=  self getRemoteObject.

	self assert: remoteObject string equals: 'hello world'.

	collection :=  remoteObject collectionOfObjects.
	"Check the size and immediate value objects, but assume that proxies are working correctly"
	self assert: collection size equals: 3.
	self assert: collection first equals: 42.
	self assert: collection second equals: 'Hello World'.

	^ remoteObject
]

{ #category : #examples }
GtRemotePhlowDeclarativeExamples >> remotePhlowSpecificationsProvider [
	"Answer the object for returning phlow specifications for the object"
	<gtExample>
	<after: #stopServer>
	| phlowSpecificationsProvider declarativeViews |

	phlowSpecificationsProvider :=  self retrieveRemotePhlowSpecificationsProvider.

	"The set of views can vary depending on configuration,
	just check that a common view is present."
	declarativeViews :=  phlowSpecificationsProvider getDeclarativeViewMethodNames.
	self assert: (declarativeViews includes: #gtListFor:).
 
	^ phlowSpecificationsProvider
]

{ #category : #private }
GtRemotePhlowDeclarativeExamples >> retrieveRemotePhlowSpecificationsProvider [
	"Answer the object that will be used to get phlow specifications"

	^ GtRemotePhlowViewedObject object: self remoteObject.
]

{ #category : #private }
GtRemotePhlowDeclarativeExamples >> runningServer [
	"Answer a running server.
	No server is required running the examples in a single image.
	Subclasses should overwrite this to start the server"
	<gtExample>
	<after: #stopServer>

]

{ #category : #private }
GtRemotePhlowDeclarativeExamples >> stopServer [ 

	server ifNotNil: 
		[ server stop.
		server := nil ]
]
