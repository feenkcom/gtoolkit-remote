Class {
	#name : #GtRemotePhlowContextMenuItemBoundActionSpecification,
	#superclass : #GtPhlowActionSpecification,
	#instVars : [
		'label',
		'iconStencil',
		'menuOptions',
		'disabled'
	],
	#category : #'GToolkit-RemotePhlow-DeclarativeActions'
}

{ #category : #accessing }
GtRemotePhlowContextMenuItemBoundActionSpecification class >> typeLabel [
	^ 'phlowContextMenuActionSpecification'
]

{ #category : #serialization }
GtRemotePhlowContextMenuItemBoundActionSpecification >> asDictionaryForExport [
	| specificationData |
	specificationData := super asDictionaryForExport.
	
	label ifNotNil: [ :aText |
		specificationData at: 'label' put: aText ].
	specificationData at: 'disabled' put: self disabled.
	iconStencil ifNotNil: [ :anIconStencil |
		specificationData 
			at: 'iconStencil' 
			put: anIconStencil asDictionaryForExport ].
	tooltipText ifNotNil: [ :aText |
		specificationData at: 'tooltipText' put: aText ].

	^ specificationData
]

{ #category : #accessing }
GtRemotePhlowContextMenuItemBoundActionSpecification >> disabled [
	^ disabled ifNil: [ false ]
]

{ #category : #accessing }
GtRemotePhlowContextMenuItemBoundActionSpecification >> disabled: aBoolean [
	disabled := aBoolean
]

{ #category : #accessing }
GtRemotePhlowContextMenuItemBoundActionSpecification >> iconStencil [
	^ iconStencil
]

{ #category : #accessing }
GtRemotePhlowContextMenuItemBoundActionSpecification >> iconStencil: anIconStencil [
	iconStencil := anIconStencil
]

{ #category : #serialization }
GtRemotePhlowContextMenuItemBoundActionSpecification >> initializeFromJSONDictionary: aDictionary [
	super initializeFromJSONDictionary: aDictionary.
	
	aDictionary 
		at: 'label' 
		ifPresent: [ :aText |
			self label: aText ].
	aDictionary 
		at: 'disabled' 
		ifPresent: [ :aBoolean |
			self disabled: aBoolean ].
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
