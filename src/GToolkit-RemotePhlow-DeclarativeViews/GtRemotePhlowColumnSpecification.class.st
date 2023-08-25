Class {
	#name : #GtRemotePhlowColumnSpecification,
	#superclass : #Object,
	#instVars : [
		'title',
		'cellWidth',
		'type',
		'spawnsObjects',
		'properties'
	],
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #'instance creation' }
GtRemotePhlowColumnSpecification class >> fromJSONDictionary: aDictionary [
	| column |

	column := self new.
	column
		title: (aDictionary at: #title);
		cellWidth: (aDictionary at: #cellWidth);
		type: (self instantiateTypeFrom: (aDictionary at: #type));
		spawnsObjects: (aDictionary at: #spawnsObjects);
		properties: (aDictionary at: #properties) asOrderedCollection.
		
	^column
]

{ #category : #'instance creation' }
GtRemotePhlowColumnSpecification class >> instantiateTypeFrom: aValue [
	 ^ GtPhlowDeclarativeListingType forTypeLabel: aValue
]

{ #category : #conversion }
GtRemotePhlowColumnSpecification >> asDictionaryForExport [ 
	| dictionary |

	dictionary := Dictionary new 
		at: #title put: title;
		at: #cellWidth put: cellWidth;
		at: #type put: type typeLabel;
		at: #spawnsObjects put: spawnsObjects;
		at: #properties put: self properties asArray;
		yourself.

	^ dictionary
]

{ #category : #accessing }
GtRemotePhlowColumnSpecification >> cellWidth [
	^ cellWidth
]

{ #category : #accessing }
GtRemotePhlowColumnSpecification >> cellWidth: anObject [
	cellWidth := anObject
]

{ #category : #testing }
GtRemotePhlowColumnSpecification >> hasBackground [
	^ self hasPropertyNamed: #background
]

{ #category : #testing }
GtRemotePhlowColumnSpecification >> hasPropertyNamed: aString [ 
	^ self properties includes: #background
]

{ #category : #testing }
GtRemotePhlowColumnSpecification >> isTextSpawn [
	^ self spawnsObjects and: [
		self type isText ]
]

{ #category : #testing }
GtRemotePhlowColumnSpecification >> markAsHavingBackground [
	self markAsHavingPropertyNamed: #background
]

{ #category : #testing }
GtRemotePhlowColumnSpecification >> markAsHavingPropertyNamed: aSymbol [ 
	(self hasPropertyNamed:  aSymbol) ifTrue: [ ^ self ].
	
	self properties add: aSymbol
]

{ #category : #accessing }
GtRemotePhlowColumnSpecification >> printOn: aStream [
	super printOn: aStream.
	
	aStream parenthesize: [
		aStream << self title.
		self type ifNotNil: [
			aStream 
				<< ', ';
				<< self type typeLabel ]]
]

{ #category : #accessing }
GtRemotePhlowColumnSpecification >> properties [
	^ properties ifNil: [ 
		properties := OrderedCollection new ]
]

{ #category : #accessing }
GtRemotePhlowColumnSpecification >> properties: anObject [
	properties := anObject
]

{ #category : #accessing }
GtRemotePhlowColumnSpecification >> spawnsObjects [
	^ spawnsObjects
]

{ #category : #accessing }
GtRemotePhlowColumnSpecification >> spawnsObjects: anObject [
	spawnsObjects := anObject
]

{ #category : #accessing }
GtRemotePhlowColumnSpecification >> title [
	^ title
]

{ #category : #accessing }
GtRemotePhlowColumnSpecification >> title: anObject [
	title := anObject
]

{ #category : #accessing }
GtRemotePhlowColumnSpecification >> type [
	^ type
]

{ #category : #accessing }
GtRemotePhlowColumnSpecification >> type: anObject [
	type := anObject
]
