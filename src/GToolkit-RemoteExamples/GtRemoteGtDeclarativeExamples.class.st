"
Test the operation of Gt Declarative views in a plain Pharo image (i.e. without Gt loaded).

The examples assume that the server is started manually.

To start the server:

[[[
./glamoroustoolkit GlamorousToolkit.image clap pharoLinkServer 7003 7004
]]]

"
Class {
	#name : #GtRemoteGtDeclarativeExamples,
	#superclass : #GtRemoteDeclarativeStExamples,
	#category : #'GToolkit-RemoteExamples'
}

{ #category : #private }
GtRemoteGtDeclarativeExamples >> printForString [
	"Answer the string returned in the #gtPrintFor: view"

	^ 'a GtDeclarativeTestInspectable'
]

{ #category : #examples }
GtRemoteGtDeclarativeExamples >> runningServer [
	"Answer a running server"
	<gtExample>
	<after: #stopServer>
	| settings |

	server ifNotNil: [ ^ server ].
	"Connect to the remote image"
	settings := LanguageLinkSettings pharoDefaultSettings.
	settings
		serverProcessClass: LanguageLinkManualProcess;
		serverSocketAddress: (LanguageLinkSocketAddress ipOrName: 'localhost' port: 7003);
		clientSocketAddress: (LanguageLinkSocketAddress ipOrName: 'localhost' port: 7004);
		gtViewedObjectClassName: #GtViewedObject.
	server := PharoLinkApplication newWith: settings.
	^ server start.
]

{ #category : #private }
GtRemoteGtDeclarativeExamples >> testInspectableName [
	"Answer the name of the test inspectable class on the remote"

	^ #GtDeclarativeTestInspectable
]
