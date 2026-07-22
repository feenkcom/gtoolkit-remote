Class {
	#name : #GtPhlowButtonActionSpecification,
	#superclass : #GtPhlowActionSpecification,
	#instVars : [
		'label',
		'iconStencil'
	],
	#category : #'GToolkit-RemotePhlow-DeclarativeActions'
}

{ #category : #accessing }
GtPhlowButtonActionSpecification class >> typeLabel [
	^ 'phlowButtonActionSpecification'
]

{ #category : #converting }
GtPhlowButtonActionSpecification >> asDictionaryForExport [
	| specificationData|
	specificationData := super asDictionaryForExport.
	
	label ifNotNil: [ :aText |
		specificationData at: 'label' put: aText ].
	iconStencil ifNotNil: [ :anIconStencil |
		specificationData 
			at: 'iconStencil' 
			put: anIconStencil asDictionaryForExport ].
	tooltipText ifNotNil: [ :aText |
		specificationData at: 'tooltipText' put: aText ].

	^ specificationData
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

{ #category : #initialization }
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
]

{ #category : #accessing }
GtPhlowButtonActionSpecification >> label [
	^ label
]

{ #category : #accessing }
GtPhlowButtonActionSpecification >> label: aLabel [
	label := aLabel
]
