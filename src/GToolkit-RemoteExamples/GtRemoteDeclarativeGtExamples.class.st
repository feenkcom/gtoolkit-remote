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
GtRemoteDeclarativeGtExamples >> listView [
	<gtExamples>
	| viewProxy viewDictionary view data |

	viewProxy := self viewedObjectProxy.
	viewDictionary := viewProxy newCommandFactory
		<< 'self getViewDeclaration: #gtListFor:';
		sendAndWait.
	view := GtDeclarativeView fromDictionary: viewDictionary.
	self assert: view title equals: #List.
	data := view items.
	self assert: data size equals: 3.
	self assert: data equals: #('42' 'Hello World' '2021-04-06T14:43:49.623384+02:00').
	^ view
]

{ #category : #examples }
GtRemoteDeclarativeGtExamples >> remoteObject [
	"Answer a proxy to a remote GtDeclarativeTestInspectable instance"
	<gtExample>
	| proxyObject localObject string collection |

	proxyObject := self runningServer newCommandFactory
		<< 'GtPharoDeclarativeTestInspectable new';
		sendAndWait.

	localObject := GtDeclarativeTestInspectable new.
	string := proxyObject newCommandFactory
		<< 'self string';
		sendAndWait.
	self assert: string equals: localObject string.

	collection := proxyObject newCommandFactory
		<< 'self collectionOfObjects';
		sendAndWait.
	"Check the size and immediate value objects, but assume that proxies are working correctly"
	self assert: collection size equals: localObject collectionOfObjects size.
	self assert: collection first equals: localObject collectionOfObjects first.
	self assert: collection second equals: localObject collectionOfObjects second.

	^ proxyObject
]

{ #category : #examples }
GtRemoteDeclarativeGtExamples >> runningServer [
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
GtRemoteDeclarativeGtExamples >> stopServer [ 

	server ifNotNil: 
		[ server stop.
		server := nil. ]
]

{ #category : #examples }
GtRemoteDeclarativeGtExamples >> stringView [
	<gtExamples>
	| viewProxy viewDictionary view |

	viewProxy := self viewedObjectProxy.
	viewDictionary := viewProxy newCommandFactory
		<< 'self getViewDeclaration: #gtStringFor:';
		sendAndWait.
	view := GtDeclarativeView fromDictionary: viewDictionary.
	self assert: view title equals: #String.
	self assert: view string equals: 'hello world'.
	^ view
]

{ #category : #examples }
GtRemoteDeclarativeGtExamples >> viewedObjectProxy [
	"Answer the GtViewedObject proxy for the remote object"
	<gtExample>
	| viewedObject declarativeViews |

	self remoteObject viewProxyDo: [ :aProxy |
		viewedObject := aProxy ].

	declarativeViews := viewedObject newCommandFactory
		<< 'self getGtViewMethodNames';
		sendAndWait.

	self assert: declarativeViews size equals: 2.
	self assert: declarativeViews equals: #(gtStringFor: gtListFor:).

	^ viewedObject
]
