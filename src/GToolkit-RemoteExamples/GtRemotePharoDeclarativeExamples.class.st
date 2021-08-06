"
Test the operation of Gt Declarative views in a plain Pharo image (i.e. without Gt loaded).

The examples assume that the server is started manually.

To build a Pharo image with the Gt server code loaded:

```bash
./pharo Pharo.image eval --save """"Metacello new repository: 'github://feenkcom/gtoolkit-remote:main/src'; baseline: 'GtPharoRemote'; load""""
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
	#superclass : 'GtRemoteDeclarativeExamples',
	#category : 'GToolkit-RemoteExamples'
}

{ #category : 'private' }
GtRemotePharoDeclarativeExamples >> declarativeViewNames [
	"Answer the expected array of declarative views from the remote"

	^ #('gtLargeListFor:' 'gtStringFor:' 'gtListFor:' 'gtLargeColumnedListWithIndexFor:' 'gtColumnedListFor:' 'gtLargeColumnedListFor:' 'gtRemotePrintFor:' 'gRemoteRawFor:')
]

{ #category : 'private' }
GtRemotePharoDeclarativeExamples >> getRemoteObject [

	^ self runningServer evaluateAndWait: self remoteObjectCommand
]

{ #category : 'private' }
GtRemotePharoDeclarativeExamples >> getViewedObjectProxy [
	"Answer the GtViewedObject proxy for the remote object"
	
	self remoteObject viewProxyDo: [ :aProxy | ^ aProxy ].

]

{ #category : 'private - commands' }
GtRemotePharoDeclarativeExamples >> listViewDisplayArray [
	"Answer the command Array returned by the remote's list view"

	^ #('42' 'Hello World' '2021-04-06T14:43:49.623384+02:00')
]

{ #category : 'private - commands' }
GtRemotePharoDeclarativeExamples >> remoteObjectCommand [
	"Answer the command to retrieve the test inspectable from the remote"

	^ self testInspectableName, ' new'
]

{ #category : 'private' }
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

{ #category : 'tests' }
GtRemotePharoDeclarativeExamples >> testInspectableName [
	"Answer the name of the test inspectable class on the remote"

	^ #GtRemotePhlowDeclarativeTestInspectable
]
