Class {
	#name : #GtRemotePhlowContextMenuItemBoundActionSpecification,
	#superclass : #GtPhlowActionSpecification,
	#instVars : [
		'label',
		'iconStencil'
	],
	#category : #'GToolkit-RemotePhlow-DeclarativeActions'
}

{ #category : #accessing }
GtRemotePhlowContextMenuItemBoundActionSpecification class >> typeLabel [
	^ 'phlowContextMenuActionSpecification'
]

{ #category : #converting }
GtRemotePhlowContextMenuItemBoundActionSpecification >> asDictionaryForExport [
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
GtRemotePhlowContextMenuItemBoundActionSpecification >> iconStencil [
	^ iconStencil
]

{ #category : #accessing }
GtRemotePhlowContextMenuItemBoundActionSpecification >> iconStencil: anIconStencil [
	iconStencil := anIconStencil
]

{ #category : #initialization }
GtRemotePhlowContextMenuItemBoundActionSpecification >> initializeFromJSONDictionary: aDictionary [
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
GtRemotePhlowContextMenuItemBoundActionSpecification >> label [
	^ label
]

{ #category : #accessing }
GtRemotePhlowContextMenuItemBoundActionSpecification >> label: aString [
	label := aString
]
