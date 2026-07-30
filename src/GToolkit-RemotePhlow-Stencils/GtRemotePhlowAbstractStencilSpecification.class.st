Class {
	#name : #GtRemotePhlowAbstractStencilSpecification,
	#superclass : #GtPhlowDeclarativeSpecification,
	#instVars : [
		'dataSerializationStrategy',
		'properties'
	],
	#category : #'GToolkit-RemotePhlow-Stencils'
}

{ #category : #accessing }
GtRemotePhlowAbstractStencilSpecification >> asDictionaryForExport [
	^(super asDictionaryForExport)
		at: 'dataSerializationStrategy' put: self dataSerializationStrategy asDictionaryForExport;
		at: 'properties' put: self properties;
		yourself
]

{ #category : #accessing }
GtRemotePhlowAbstractStencilSpecification >> dataSerializationStrategy [
	^ dataSerializationStrategy
]

{ #category : #accessing }
GtRemotePhlowAbstractStencilSpecification >> dataSerializationStrategy: anObject [
	dataSerializationStrategy := anObject
]

{ #category : #updating }
GtRemotePhlowAbstractStencilSpecification >> handleStencilSpecificationAfterDeserializationFrom: aViewSpecification [
	self dataSerializationStrategy 
		updateStencilSpecificationAfterDeserializationFor: self
		from: aViewSpecification.
]

{ #category : #updating }
GtRemotePhlowAbstractStencilSpecification >> handleStencilSpecificationBeforeSerializationFrom: aViewSpecification [
	self dataSerializationStrategy 
		prepareStencilSpecificationForSerializationFor: self
		from: aViewSpecification.
]

{ #category : #testing }
GtRemotePhlowAbstractStencilSpecification >> hasProperty: aKey [
	self propertyAt: aKey ifAbsent: [ ^ false ].
	^ true
]

{ #category : #initialization }
GtRemotePhlowAbstractStencilSpecification >> initializeFromJSONDictionary: aDictionary [
	super initializeFromJSONDictionary: aDictionary.
	
	aDictionary at: 'dataSerializationStrategy' ifPresent: [ :data |
		self dataSerializationStrategy: (GtPhlowStencilDataSerializationStrategy
			fromDictionary:  data ) ].
	aDictionary at: 'properties' ifPresent: [ :data |
		self properties: data]
]

{ #category : #testing }
GtRemotePhlowAbstractStencilSpecification >> isPhlowErrorSpecification [
	^ false
]

{ #category : #accessing }
GtRemotePhlowAbstractStencilSpecification >> properties [
	^ properties ifNil: [ 
		properties := Dictionary new ]
]

{ #category : #accessing }
GtRemotePhlowAbstractStencilSpecification >> properties: aDictionary [ 
	properties := aDictionary 
]

{ #category : #accessing }
GtRemotePhlowAbstractStencilSpecification >> propertyAt: aKey [
	"Answer the property value associated with aKey."

	^ self propertyAt: aKey ifAbsent: [ self error: 'Property not found' ]
]

{ #category : #accessing }
GtRemotePhlowAbstractStencilSpecification >> propertyAt: propertyName ifAbsent: aBlock [
	^ self properties
		at: propertyName
		ifAbsent: aBlock
]

{ #category : #accessing }
GtRemotePhlowAbstractStencilSpecification >> propertyAt: propertyName ifPresent: aBlock [
	^ self properties
		at: propertyName
		ifPresent: aBlock
]

{ #category : #accessing }
GtRemotePhlowAbstractStencilSpecification >> propertyAt: propertyName ifPresent: aPresentBlock ifAbsent: anAbsentBlock [
	^ self properties
		at: propertyName
		ifPresent: aPresentBlock
		ifAbsent: anAbsentBlock
]

{ #category : #accessing }
GtRemotePhlowAbstractStencilSpecification >> propertyAt: aKey put: aValue [
	^ self properties at: aKey put: aValue
]
