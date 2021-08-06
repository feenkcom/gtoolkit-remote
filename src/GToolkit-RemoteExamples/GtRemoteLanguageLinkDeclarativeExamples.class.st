"
Keeping a couple of methods around for reference.

This will be removed once the current example refactoring is complete.
"
Class {
	#name : 'GtRemoteLanguageLinkDeclarativeExamples',
	#superclass : 'GtRemoteDeclarativeExamples',
	#category : 'GToolkit-RemoteExamples'
}

{ #category : 'examples' }
GtRemoteLanguageLinkDeclarativeExamples >> remoteObject [
	"Answer a proxy to a remote GtDeclarativeTestInspectable instance"
	"<gtExample>"
	| proxyObject localObject string collection |

	proxyObject := self runningServer newCommandFactory
		<< self remoteObjectCommand;
		sendAndWait.

	localObject := self localObject.
	string := proxyObject newCommandFactory
		<< self stringCommand;
		sendAndWait.
	self assert: string equals: localObject string.

	collection := proxyObject newCommandFactory
		<< self collectionOfObjectsCommand;
		sendAndWait.
	"Check the size and immediate value objects, but assume that proxies are working correctly"
	self assert: collection size equals: localObject collectionOfObjects size.
	self assert: collection first equals: localObject collectionOfObjects first.
	self assert: collection second equals: localObject collectionOfObjects second.

	^ proxyObject
]

{ #category : 'examples' }
GtRemoteLanguageLinkDeclarativeExamples >> viewedObjectProxy [
	"Answer the GtViewedObject proxy for the remote object"
	"<gtExample>"
	| viewedObject declarativeViews |

	self remoteObject viewProxyDo: [ :aProxy |
		viewedObject := aProxy ].

	declarativeViews := viewedObject newCommandFactory
		<< self methodNamesCommand;
		sendAndWait.

	self assert: declarativeViews asSet equals: self declarativeViewNames asSet.

	^ viewedObject
]
