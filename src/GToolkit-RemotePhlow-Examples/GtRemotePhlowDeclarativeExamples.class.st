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
GtRemotePhlowDeclarativeExamples >> remoteInspectorProxy [
	"Answer the GtRemotePhlowViewedObject proxy for the remote object"
	<gtExample>
	<after: #stopServer>
	| inspectorProxy declarativeViews |

	inspectorProxy :=  self retrieveRemoteInspectorProxy.

	"The set of views can vary depending on configuration,
	just check that a common view is present."
	declarativeViews :=  inspectorProxy getDeclarativeViewMethodNames.
	self assert: (declarativeViews includes: #gtListFor:).
 
	^ inspectorProxy
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

{ #category : #private }
GtRemotePhlowDeclarativeExamples >> retrieveRemoteInspectorProxy [
	"Answer the GtRemotePhlowViewedObject proxy for the remote object"

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
