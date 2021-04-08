Class {
	#name : #GtRemotePharoDeclarativeExamples,
	#superclass : #GtRemoteDeclarativeStExamples,
	#category : #'GToolkit-RemoteExamples'
}

{ #category : #private }
GtRemotePharoDeclarativeExamples >> printForString [
	"Answer the string returned in the #gtPrintFor: view"

	^ 'a GtPharoDeclarativeTestInspectable'
]

{ #category : #examples }
GtRemotePharoDeclarativeExamples >> runningServer [
	"Answer a running server"
	<gtExample>
	<after: #stopServer>
	| settings |

	server ifNotNil: [ ^ server ].
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
GtRemotePharoDeclarativeExamples >> testInspectableName [
	"Answer the name of the test inspectable class on the remote"

	^ #GtPharoDeclarativeTestInspectable
]
