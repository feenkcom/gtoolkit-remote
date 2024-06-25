Class {
	#name : #GtPhlowBitmapViewSpecification,
	#superclass : #GtPhlowViewSpecification,
	#instVars : [
		'bitmap'
	],
	#category : #'GToolkit-RemotePhlow-DeclarativeViews-GTSpecific'
}

{ #category : #'instance creation' }
GtPhlowBitmapViewSpecification class >> fromJSONDictionary: aDictionary [
	| editor |

	editor := super fromJSONDictionary: aDictionary.
	editor dataTransport = self dataIncluded
		ifTrue: [ editor bitmap: (GtRemotePhlowBitmapSpecification fromJSONDictionary: (aDictionary at: 'bitmap')) ].

	^ editor
]

{ #category : #converting }
GtPhlowBitmapViewSpecification >> asDictionaryForExport [ 

	| dictionary |

	dictionary := super asDictionaryForExport.
	self dataTransport = self class dataIncluded ifTrue: [ 
		dictionary at: 'bitmap' put: bitmap asDictionaryForExport ].
		
	^ dictionary
]

{ #category : #accessing }
GtPhlowBitmapViewSpecification >> bitmap [
	^ bitmap
]

{ #category : #accessing }
GtPhlowBitmapViewSpecification >> bitmap: anObject [
	bitmap := anObject
]
