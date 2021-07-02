Class {
	#name : #GtPharoDeclarativeTable,
	#superclass : #GtPharoDeclarativeView,
	#instVars : [
		'items'
	],
	#category : #'GToolkit-RemotePharo-Server'
}

{ #category : #'instance creation' }
GtPharoDeclarativeTable class >> fromJSONDictionary: aDictionary [

	| table |

	table := super fromJSONDictionary: aDictionary.
	table dataTransport = self dataIncluded ifTrue: 
		[ table items: (aDictionary at: #items) ].
	^table
]

{ #category : #converting }
GtPharoDeclarativeTable >> asDictionaryForExport [ 

	| dictionary |

	dictionary := super asDictionaryForExport.
	self dataTransport = self class dataIncluded ifTrue: [ 
		dictionary at: #data put: items ].
	^dictionary
]

{ #category : #accessing }
GtPharoDeclarativeTable >> data [ 

	^ items
]

{ #category : #accessing }
GtPharoDeclarativeTable >> items [
	^ items
]

{ #category : #accessing }
GtPharoDeclarativeTable >> items: anObject [
	items := anObject
]

{ #category : #accessing }
GtPharoDeclarativeTable >> viewName [ 

	^ #GtDeclarativeTable
]
