Class {
	#name : #GtRemotePhlowContextMenuItemBoundActionSpecification,
	#superclass : #GtPhlowActionSpecification,
	#instVars : [
		'label',
		'iconStencil',
		'menuOptions'
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
GtRemotePhlowContextMenuItemBoundActionSpecification >> label [
	^ label
]

{ #category : #accessing }
GtRemotePhlowContextMenuItemBoundActionSpecification >> label: aString [
	label := aString
]

{ #category : #accessing }
GtRemotePhlowContextMenuItemBoundActionSpecification >> menuOptions [
	^ menuOptions
]

{ #category : #accessing }
GtRemotePhlowContextMenuItemBoundActionSpecification >> menuOptions: aGtRemotePhlowMenuOptions [
	menuOptions := aGtRemotePhlowMenuOptions
]
