Class {
	#name : 'GtDeclarativeTableView',
	#superclass : 'GtDeclarativeView',
	#instVars : [
		'items'
	],
	#category : 'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : 'instance creation' }
GtDeclarativeTableView class >> fromJSONDictionary: aDictionary [

	| table |

	table := super fromJSONDictionary: aDictionary.
	table dataTransport = self dataIncluded ifTrue: 
		[ table items: (aDictionary at: #items) ].
	^table
]

{ #category : 'converting' }
GtDeclarativeTableView >> asDictionaryForExport [ 

	| dictionary |

	dictionary := super asDictionaryForExport.
	self dataTransport = self class dataIncluded ifTrue: [ 
		dictionary at: #data put: items ].
	^dictionary
]

{ #category : 'accessing' }
GtDeclarativeTableView >> items [
	^ items
]

{ #category : 'accessing' }
GtDeclarativeTableView >> items: anObject [
	items := anObject
]
