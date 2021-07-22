Class {
	#name : 'GtRemotePhlowDeclarativeTable',
	#superclass : 'GtRemotePhlowDeclarativeView',
	#instVars : [
		'items'
	],
	#category : 'GToolkit-RemotePhlow'
}

{ #category : 'instance creation' }
GtRemotePhlowDeclarativeTable class >> fromJSONDictionary: aDictionary [

	| table |

	table := super fromJSONDictionary: aDictionary.
	table dataTransport = self dataIncluded ifTrue: 
		[ table items: (aDictionary at: #items) ].
	^table
]

{ #category : 'converting' }
GtRemotePhlowDeclarativeTable >> asDictionaryForExport [ 

	| dictionary |

	dictionary := super asDictionaryForExport.
	self dataTransport = self class dataIncluded ifTrue: [ 
		dictionary at: #data put: items ].
	^dictionary
]

{ #category : 'accessing' }
GtRemotePhlowDeclarativeTable >> data [ 

	^ items
]

{ #category : 'accessing' }
GtRemotePhlowDeclarativeTable >> items [
	^ items
]

{ #category : 'accessing' }
GtRemotePhlowDeclarativeTable >> items: anObject [
	items := anObject
]

{ #category : 'accessing' }
GtRemotePhlowDeclarativeTable >> viewName [ 

	^ #GtDeclarativeTable
]
