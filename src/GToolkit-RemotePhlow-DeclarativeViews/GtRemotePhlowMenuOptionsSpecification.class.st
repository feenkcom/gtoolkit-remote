Class {
	#name : #GtRemotePhlowMenuOptionsSpecification,
	#superclass : #GtPhlowDeclarativeSpecification,
	#instVars : [
		'menuPreview',
		'menuGroup',
		'menuPinSubmenu',
		'menuHideOnClick',
		'menuShortcut',
		'menuDisable'
	],
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #accessing }
GtRemotePhlowMenuOptionsSpecification class >> typeLabel [
	^ 'remotePhlowMenuOptions'
]

{ #category : #actions }
GtRemotePhlowMenuOptionsSpecification >> applyToLocalAction: aLocalAction [
	menuPreview ifNotNil: [ :anObject |
		aLocalAction menuItemPreview: anObject ].
	menuGroup ifNotNil: [ :anObject |
		aLocalAction menuItemGroup: anObject asMenuItemGroupConfiguration ].
	menuPinSubmenu ifNotNil: [ :anObject |
		aLocalAction menuItemPinSubmenu ].
	menuHideOnClick ifNotNil: [ :anObject |
		aLocalAction menuItemHideOnClick: anObject ].
	menuShortcut ifNotNil: [ :anObject |
		aLocalAction menuShortcut: anObject ].
	menuDisable ifNotNil: [ :anObject |
		aLocalAction menuDisable: [ anObject ] ].
]

{ #category : #serialization }
GtRemotePhlowMenuOptionsSpecification >> asDictionaryForExport [
	| exportData |
	exportData := super asDictionaryForExport.
	menuPreview ifNotNil: [ :anObject |
		exportData at: 'menuPreview' put: anObject ].
	menuGroup ifNotNil: [ :anObject |
		exportData at: 'menuGroup' put: anObject asDictionaryForExport ].
	menuPinSubmenu ifNotNil: [ :anObject |
		exportData at: 'menuPinSubmenu' put: anObject ].
	menuHideOnClick ifNotNil: [ :anObject |
		exportData at: 'menuHideOnClick' put: anObject ].
	menuShortcut ifNotNil: [ :anObject |
		exportData at: 'menuShortcut' put: anObject ].
	menuDisable ifNotNil: [ :anObject |
		exportData at: 'menuDisable' put: anObject ].
	^ exportData
]

{ #category : #testing }
GtRemotePhlowMenuOptionsSpecification >> hasAnyOptions [
	^ menuPreview notNil
		or: [ menuGroup notNil
		or: [ menuPinSubmenu notNil
		or: [ menuHideOnClick notNil
		or: [ menuShortcut notNil
		or: [ menuDisable notNil ] ] ] ] ]
]

{ #category : #serialization }
GtRemotePhlowMenuOptionsSpecification >> initializeFromJSONDictionary: aDictionary [
	super initializeFromJSONDictionary: aDictionary.
	aDictionary at: 'menuPreview' ifPresent: [ :anObject |
		self menuPreview: anObject ].
	aDictionary at: 'menuGroup' ifPresent: [ :anObject |
		self menuGroup: (GtRemotePhlowMenuItemGroupConfiguration new
			initializeFromJSONDictionary: anObject) ].
	aDictionary at: 'menuPinSubmenu' ifPresent: [ :anObject |
		self menuPinSubmenu: anObject ].
	aDictionary at: 'menuHideOnClick' ifPresent: [ :anObject |
		self menuHideOnClick: anObject ].
	aDictionary at: 'menuShortcut' ifPresent: [ :anObject |
		self menuShortcut: anObject ].
	aDictionary at: 'menuDisable' ifPresent: [ :anObject |
		self menuDisable: anObject ].
]

{ #category : #accessing }
GtRemotePhlowMenuOptionsSpecification >> menuDisable [
	^ menuDisable
]

{ #category : #accessing }
GtRemotePhlowMenuOptionsSpecification >> menuDisable: anObject [
	menuDisable := anObject
]

{ #category : #accessing }
GtRemotePhlowMenuOptionsSpecification >> menuGroup [
	^ menuGroup
]

{ #category : #accessing }
GtRemotePhlowMenuOptionsSpecification >> menuGroup: anObject [
	menuGroup := anObject
]

{ #category : #accessing }
GtRemotePhlowMenuOptionsSpecification >> menuHideOnClick [
	^ menuHideOnClick
]

{ #category : #accessing }
GtRemotePhlowMenuOptionsSpecification >> menuHideOnClick: anObject [
	menuHideOnClick := anObject
]

{ #category : #accessing }
GtRemotePhlowMenuOptionsSpecification >> menuPinSubmenu [
	^ menuPinSubmenu
]

{ #category : #accessing }
GtRemotePhlowMenuOptionsSpecification >> menuPinSubmenu: anObject [
	menuPinSubmenu := anObject
]

{ #category : #accessing }
GtRemotePhlowMenuOptionsSpecification >> menuPreview [
	^ menuPreview
]

{ #category : #accessing }
GtRemotePhlowMenuOptionsSpecification >> menuPreview: anObject [
	menuPreview := anObject
]

{ #category : #accessing }
GtRemotePhlowMenuOptionsSpecification >> menuShortcut [
	^ menuShortcut
]

{ #category : #accessing }
GtRemotePhlowMenuOptionsSpecification >> menuShortcut: anObject [
	menuShortcut := anObject
]
