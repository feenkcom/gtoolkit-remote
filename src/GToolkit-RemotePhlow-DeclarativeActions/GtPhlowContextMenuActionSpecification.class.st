Class {
	#name : #GtPhlowContextMenuActionSpecification,
	#superclass : #GtPhlowActionSpecification,
	#instVars : [
		'label',
		'iconStencil'
	],
	#category : #'GToolkit-RemotePhlow-DeclarativeActions'
}

{ #category : #accessing }
GtPhlowContextMenuActionSpecification class >> typeLabel [
	^ 'phlowContextMenuActionSpecification'
]

{ #category : #converting }
GtPhlowContextMenuActionSpecification >> asDictionaryForExport [
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

	^ specificationData
]

{ #category : #accessing }
GtPhlowContextMenuActionSpecification >> iconStencil [
	^ iconStencil
]

{ #category : #accessing }
GtPhlowContextMenuActionSpecification >> iconStencil: anIconStencil [
	iconStencil := anIconStencil
]

{ #category : #initialization }
GtPhlowContextMenuActionSpecification >> initializeFromJSONDictionary: aDictionary [
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
GtPhlowContextMenuActionSpecification >> label [
	^ label
]

{ #category : #accessing }
GtPhlowContextMenuActionSpecification >> label: aString [
	label := aString
]
