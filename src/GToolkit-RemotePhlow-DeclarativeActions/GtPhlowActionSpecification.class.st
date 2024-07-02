Class {
	#name : #GtPhlowActionSpecification,
	#superclass : #GtPhlowDeclarativeSpecification,
	#instVars : [
		'id',
		'priority',
		'tooltipText',
		'methodSelector',
		'phlowDataSource'
	],
	#category : #'GToolkit-RemotePhlow-DeclarativeActions'
}

{ #category : #'instance creation' }
GtPhlowActionSpecification class >> fromDictionary: aSpecificationDictionary [
	"Answer the specification based on its exported data"
	| typeName |

	typeName := aSpecificationDictionary at: '__typeName'.
	^(Smalltalk globals at: typeName asSymbol) 
		fromJSONDictionary: aSpecificationDictionary.
]

{ #category : #accessing }
GtPhlowActionSpecification class >> typeLabel [
	^ nil
]

{ #category : #converting }
GtPhlowActionSpecification >> asDictionaryForExport [
	"Answer the receiver as a dictionary ready for JSON serialisation.
	Subclasses will override and add to the dictionary"

	^ super asDictionaryForExport
		at: '__typeLabel' put: self class typeLabel;
		at: 'priority' put: priority;
		at: 'methodSelector' put: methodSelector;
		yourself
]

{ #category : #initialization }
GtPhlowActionSpecification >> initializeFromInspector: anInspector [
]

{ #category : #initialization }
GtPhlowActionSpecification >> initializeFromJSONDictionary: aDictionary [
	super initializeFromJSONDictionary: aDictionary.

	self
		priority: (aDictionary at: 'priority' ifAbsent: [ nil ]);
		methodSelector: (aDictionary at: 'methodSelector' ifAbsent: [ nil ]);
		tooltipText: (aDictionary  at: 'tooltipText' ifAbsent: [ nil ])
]

{ #category : #accessing }
GtPhlowActionSpecification >> methodSelector [
	^ methodSelector
]

{ #category : #accessing }
GtPhlowActionSpecification >> methodSelector: aSelector [
	methodSelector := aSelector
]

{ #category : #accessing }
GtPhlowActionSpecification >> phlowDataSource [
	^ phlowDataSource
]

{ #category : #accessing }
GtPhlowActionSpecification >> phlowDataSource: aDataSource [
	phlowDataSource := aDataSource
]

{ #category : #accessing }
GtPhlowActionSpecification >> priority [
	^ priority
]

{ #category : #accessing }
GtPhlowActionSpecification >> priority: aNumber [
	priority := aNumber
]

{ #category : #accessing }
GtPhlowActionSpecification >> tooltipText [
	^ tooltipText
]

{ #category : #accessing }
GtPhlowActionSpecification >> tooltipText: aTextOrString [
	tooltipText := aTextOrString
]
