"
GtRemoteDeclarativeGtExamples demonstrates the use of ${class:name=GtDeclarativeView}$ with a Gt server.

Note that it starts and stops server images as part of the examples.
"
Class {
	#name : #GtRemoteDeclarativeGtExamples,
	#superclass : #Object,
	#instVars : [
		'server'
	],
	#category : #'GToolkit-RemoteExamples'
}

{ #category : #examples }
GtRemoteDeclarativeGtExamples >> remoteObject [
	<gtExample>
	
	^ self runningServer newCommandFactory
		<< 'GtDeclarativeTestInspectable new';
		sendAndWait.
]

{ #category : #examples }
GtRemoteDeclarativeGtExamples >> runningServer [
	"Answer a running server"
	<gtExample>
	<after: #stopServer>
	| settings |

	"Connect to the remote image"
	settings := LanguageLinkSettings pharoDefaultSettings.
	settings
		serverProcessClass: LanguageLinkManualProcess;
		serverSocketAddress: (LanguageLinkSocketAddress ipOrName: 'localhost' port: 7001);
		clientSocketAddress: (LanguageLinkSocketAddress ipOrName: 'localhost' port: 7002);
		gtViewedObjectClassName: #GtPharoViewedObject.
	server := PharoLinkApplication newWith: settings.
	^ server start.
]

{ #category : #private }
GtRemoteDeclarativeGtExamples >> stopServer [ 

	server ifNotNil: 
		[ server stop.
		server := nil. ]
]
