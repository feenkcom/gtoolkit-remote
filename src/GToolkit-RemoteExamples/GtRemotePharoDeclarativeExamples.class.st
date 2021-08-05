"
Test the operation of Gt Declarative views in a plain Pharo image (i.e. without Gt loaded).

The examples assume that the server is started manually.

To build a Pharo image with the Gt server code loaded:

```bash
./pharo Pharo.image eval --save ""Metacello new repository: 'github://feenkcom/gtoolkit-remote:main/src'; baseline: 'GtPharoRemote'; load""
```

To start the server:

```bash
./pharo Pharo.image clap pharoLinkServer 7001 7002
```

To run the server from a Playground:

```
PharoLinkServer new 
	listenPort: 7001;
	responsePort: 7002;
	start
```

"
Class {
	#name : 'GtRemotePharoDeclarativeExamples',
	#superclass : 'GtRemoteDeclarativeStExamples',
	#category : 'GToolkit-RemoteExamples'
}

{ #category : 'private' }
GtRemotePharoDeclarativeExamples >> printForString [
	"Answer the string returned in the #gtPrintFor: view"

	^ 'a GtRemotePhlowDeclarativeTestInspectable'
]

{ #category : 'examples' }
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
		clientSocketAddress: (LanguageLinkSocketAddress ipOrName: 'localhost' port: 7002).
	server := PharoLinkApplication newWith: settings.
	^ server start.
]

{ #category : 'private' }
GtRemotePharoDeclarativeExamples >> testInspectableName [
	"Answer the name of the test inspectable class on the remote"

	^ #GtRemotePhlowDeclarativeTestInspectable
]
