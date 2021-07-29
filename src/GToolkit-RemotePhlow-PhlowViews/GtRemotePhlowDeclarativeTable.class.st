Class {
	#name : 'GtRemotePhlowDeclarativeTable',
	#superclass : 'GtRemotePhlowDeclarativeView',
	#instVars : [
		'items'
	],
	#category : 'GToolkit-RemotePhlow-PhlowViews'
}

{ #category : 'instance creation' }
GtRemotePhlowDeclarativeTable class >> fromJSONDictionary: aDictionary [

	| table |

	table := super fromJSONDictionary: aDictionary.
	table dataTransport = self dataIncluded ifTrue: 
		[ table items: (aDictionary at: #items) ].
	^table
]

{ #category : 'accessing' }
GtRemotePhlowDeclarativeTable >> items [
	^ items
]

{ #category : 'accessing' }
GtRemotePhlowDeclarativeTable >> items: anObject [
	items := anObject
]
