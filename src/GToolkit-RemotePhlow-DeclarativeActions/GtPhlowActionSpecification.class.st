Class {
	#name : #GtPhlowActionSpecification,
	#superclass : #GtPhlowDeclarativeSpecification,
	#instVars : [
		'id',
		'priority',
		'tooltipText',
		'methodSelector',
		'phlowDataSource',
		'target'
	],
	#category : #'GToolkit-RemotePhlow-DeclarativeActions'
}

{ #category : #'instance creation' }
GtPhlowActionSpecification class >> phlowActionFromDictionary: aSpecificationDictionary [
	^ self fromDictionary: aSpecificationDictionary
]

{ #category : #serialization }
GtPhlowActionSpecification >> asDictionaryForExport [
	| dict |
	dict := super asDictionaryForExport
		at: 'priority' put: priority;
		at: 'methodSelector' put: methodSelector;
		yourself.
	id ifNotNil: [ :anId |
		dict at: 'id' put: anId asDictionaryForExport ].
	target ifNotNil: [ :aTarget |
		dict at: 'target' put: aTarget asDictionaryForExport ].
	^ dict
]

{ #category : #converting }
GtPhlowActionSpecification >> asDictionaryForExportWithPhlowDataSource [
	| specificationData|
	specificationData := self asDictionaryForExport.
	
	specificationData 
			at: 'phlowDataSource' 
			put: self phlowDataSource.
	
	^ specificationData
]

{ #category : #accessing }
GtPhlowActionSpecification >> definingMethod [
	^ phlowDataSource ifNotNil: [ :aDataSource | 
			aDataSource definingMethod ]
]

{ #category : #printing }
GtPhlowActionSpecification >> descriptOn: aStream [
	tooltipText ifNotNil: [ :aText |
		aStream nextPutAll: aText ].
	priority ifNotNil: [ :aPriority |
		tooltipText ifNotNil: [ aStream nextPutAll: ', ' ].
		aStream
			nextPutAll: 'priority: ';
			print: aPriority ]
]

{ #category : #accessing }
GtPhlowActionSpecification >> id [
	^ id
]

{ #category : #accessing }
GtPhlowActionSpecification >> id: aPhlowId [
	id := aPhlowId
]

{ #category : #initialization }
GtPhlowActionSpecification >> initializeFromInspector: anInspector [
]

{ #category : #serialization }
GtPhlowActionSpecification >> initializeFromJSONDictionary: aDictionary [
	super initializeFromJSONDictionary: aDictionary.

	self
		priority: (aDictionary at: 'priority' ifAbsent: [ nil ]);
		methodSelector: (aDictionary at: 'methodSelector' ifAbsent: [ nil ]);
		tooltipText: (aDictionary at: 'tooltipText' ifAbsent: [ nil ]);
		phlowDataSource: (aDictionary
			at: 'phlowDataSource' ifAbsent: [ nil ]).
	aDictionary
		at: 'id'
		ifPresent: [ :anIdDict |
			anIdDict ifNotNil: [
				self id: (GtPhlowDeclarativeSpecification fromDictionary: anIdDict) ] ].
	aDictionary
		at: 'target'
		ifPresent: [ :aTargetDict |
			aTargetDict ifNotNil: [
				self target: (GtPhlowDeclarativeSpecification fromDictionary: aTargetDict) ] ]
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

{ #category : #printing }
GtPhlowActionSpecification >> printOn: aStream [
	super printOn: aStream.
	aStream parenthesize: [
		self descriptOn: aStream ]
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
GtPhlowActionSpecification >> target [
	^ target
]

{ #category : #accessing }
GtPhlowActionSpecification >> target: aGtRemotePhlowActionTarget [
	target := aGtRemotePhlowActionTarget
]

{ #category : #accessing }
GtPhlowActionSpecification >> tooltipText [
	^ tooltipText
]

{ #category : #accessing }
GtPhlowActionSpecification >> tooltipText: aTextOrString [
	tooltipText := aTextOrString
]
