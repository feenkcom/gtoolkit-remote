Class {
	#name : #GtPhlowDeclarativeTableView,
	#superclass : #GtPhlowDeclarativeView,
	#instVars : [
		'items'
	],
	#category : 'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #'instance creation' }
GtPhlowDeclarativeTableView class >> fromJSONDictionary: aDictionary [

	| table |

	table := super fromJSONDictionary: aDictionary.
	table dataTransport = self dataIncluded ifTrue: 
		[ table items: (aDictionary at: #items) ].
	^table
]

{ #category : #converting }
GtPhlowDeclarativeTableView >> asDictionaryForExport [ 

	| dictionary |

	dictionary := super asDictionaryForExport.
	self dataTransport = self class dataIncluded ifTrue: [ 
		dictionary at: #data put: items ].
	^dictionary
]

{ #category : #accessing }
GtPhlowDeclarativeTableView >> items [
	^ items
]

{ #category : #accessing }
GtPhlowDeclarativeTableView >> items: anObject [
	items := anObject
]
