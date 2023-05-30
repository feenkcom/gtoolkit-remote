Class {
	#name : #GtPhlowTableViewSpecification,
	#superclass : #GtPhlowViewSpecification,
	#instVars : [
		'items'
	],
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #'instance creation' }
GtPhlowTableViewSpecification class >> fromJSONDictionary: aDictionary [

	| table |

	table := super fromJSONDictionary: aDictionary.
	table dataTransport = self dataIncluded ifTrue: 
		[ table items: (aDictionary at: #items) ].
	^table
]

{ #category : #converting }
GtPhlowTableViewSpecification >> asDictionaryForExport [ 

	| dictionary |

	dictionary := super asDictionaryForExport.
	self dataTransport = self class dataIncluded ifTrue: [ 
		dictionary at: #data put: items ].
	^dictionary
]

{ #category : #accessing }
GtPhlowTableViewSpecification >> items [
	^ items
]

{ #category : #accessing }
GtPhlowTableViewSpecification >> items: anObject [
	items := anObject
]
