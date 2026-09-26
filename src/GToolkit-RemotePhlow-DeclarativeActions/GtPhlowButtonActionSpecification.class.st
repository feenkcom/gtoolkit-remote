Class {
	#name : #GtPhlowButtonActionSpecification,
	#superclass : #GtPhlowActionSpecification,
	#instVars : [
		'label',
		'iconStencil',
		'menuOptions'
	],
	#category : #'GToolkit-RemotePhlow-DeclarativeActions'
}

{ #category : #accessing }
GtPhlowButtonActionSpecification class >> typeLabel [
	^ 'phlowButtonActionSpecification'
]

{ #category : #serialization }
GtPhlowButtonActionSpecification >> asDictionaryForExport [
	| specificationData |
	specificationData := super asDictionaryForExport.
	
	label ifNotNil: [ :aText |
		specificationData at: 'label' put: aText ].
	iconStencil ifNotNil: [ :anIconStencil |
		specificationData 
			at: 'iconStencil' 
			put: anIconStencil asDictionaryForExport ].
	tooltipText ifNotNil: [ :aText |
		specificationData at: 'tooltipText' put: aText ].
	menuOptions ifNotNil: [ :options |
		options hasAnyOptions ifTrue: [
			specificationData at: 'menuOptions' put: options asDictionaryForExport ] ].

	^ specificationData
]

{ #category : #printing }
GtPhlowButtonActionSpecification >> descriptOn: aStream [
	label ifNotNil: [ :aLabel |
		aStream nextPutAll: aLabel ].
	self priority ifNotNil: [ :aPriority |
		label ifNotNil: [ aStream nextPutAll: ', ' ].
		aStream
			nextPutAll: 'priority: ';
			print: aPriority ]
]

{ #category : #accessing }
GtPhlowButtonActionSpecification >> iconStencil [
	^ iconStencil
]

{ #category : #accessing }
GtPhlowButtonActionSpecification >> iconStencil: anIconStencil [
	iconStencil := anIconStencil
]

{ #category : #initialization }
GtPhlowButtonActionSpecification >> initializeFromInspector: anInspector [
	self phlowDataSource ifNil: [
		self phlowDataSource: (anInspector 
			getDeclarativeActionDataSourceFor: self methodSelector) ]
]

{ #category : #serialization }
GtPhlowButtonActionSpecification >> initializeFromJSONDictionary: aDictionary [
	super initializeFromJSONDictionary: aDictionary.
	
	aDictionary 
		at: 'label' 
		ifPresent: [ :aText |
			self label: aText ].
	aDictionary 
		at: 'tooltipText' 
		ifPresent: [ :aText |
			self tooltipText: aText ].
	aDictionary 
		at: 'iconStencil' 
		ifPresent: [ :anIconStencilData |
			anIconStencilData ifNotNil: [
				self iconStencil: (GtPhlowIconStencil 
					phlowIconStencilFromDictionary: anIconStencilData) ] ].
	aDictionary
		at: 'menuOptions'
		ifPresent: [ :optionsData |
			self menuOptions: (GtRemotePhlowMenuOptionsSpecification new
				initializeFromJSONDictionary: optionsData;
				yourself) ].
]

{ #category : #accessing }
GtPhlowButtonActionSpecification >> label [
	^ label
]

{ #category : #accessing }
GtPhlowButtonActionSpecification >> label: aLabel [
	label := aLabel
]

{ #category : #accessing }
GtPhlowButtonActionSpecification >> menuOptions [
	^ menuOptions
]

{ #category : #accessing }
GtPhlowButtonActionSpecification >> menuOptions: aGtRemotePhlowMenuOptions [
	menuOptions := aGtRemotePhlowMenuOptions
]
