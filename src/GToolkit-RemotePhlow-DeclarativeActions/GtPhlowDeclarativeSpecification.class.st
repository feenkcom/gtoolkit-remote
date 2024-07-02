Class {
	#name : #GtPhlowDeclarativeSpecification,
	#superclass : #Object,
	#category : #'GToolkit-RemotePhlow-DeclarativeActions'
}

{ #category : #'instance creation' }
GtPhlowDeclarativeSpecification class >> fromJSONDictionary: aDictionary [
	"Answer an instance of the receiver from the supplied dictionary."

	^self new 
		initializeFromJSONDictionary: aDictionary
]

{ #category : #converting }
GtPhlowDeclarativeSpecification >> asDictionaryForExport [
	"Answer the receiver as a dictionary ready for JSON serialisation.
	Subclasses will override and add to the dictionary"

	^ Dictionary new 
		at: '__typeName' put: self class name;
		yourself
]

{ #category : #initialization }
GtPhlowDeclarativeSpecification >> initializeFromJSONDictionary: aDictionary [
]
