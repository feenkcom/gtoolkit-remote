Class {
	#name : #PlpoGtRemotePhlowDeclarativeTestInspectable,
	#superclass : #PharoLinkProxyObject,
	#category : 'GToolkit-RemoteExamples-Pharo'
}

{ #category : #accessing }
PlpoGtRemotePhlowDeclarativeTestInspectable class >> remoteClassName [

	^ #GtRemotePhlowDeclarativeTestInspectable
]

{ #category : #accessing }
PlpoGtRemotePhlowDeclarativeTestInspectable >> collectionOfObjects [ 

	^ self proxyPerform: #collectionOfObjects
]

{ #category : #accessing }
PlpoGtRemotePhlowDeclarativeTestInspectable >> string [ 

	^ self proxyPerform: #string
]
