Class {
	#name : #GtPhlowDeclarativeSpecification,
	#superclass : #Object,
	#category : #'GToolkit-RemotePhlow-DeclarativeSpecification'
}

{ #category : #'instance creation' }
GtPhlowDeclarativeSpecification class >> fromJSONDictionary: aDictionary [
	"Answer an instance of the receiver from the supplied dictionary."

	^self new 
		initializeFromJSONDictionary: aDictionary
]

{ #category : #accessing }
GtPhlowDeclarativeSpecification class >> typeLabel [
	^ nil
]

{ #category : #converting }
GtPhlowDeclarativeSpecification >> asDictionaryForExport [
	"Answer the receiver as a dictionary ready for JSON serialisation.
	Subclasses will override and add to the dictionary"
	| specificationData |
	
	specificationData :=  Dictionary new 
		at: '__typeName' put: self class name;
		yourself.
	
	self class typeLabel ifNotNil: [ :aLabel |
		specificationData at: '__typeLabel' put: aLabel ].
		
	^ specificationData
]

{ #category : #initialization }
GtPhlowDeclarativeSpecification >> initializeFromJSONDictionary: aDictionary [
]
