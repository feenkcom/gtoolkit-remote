Class {
	#name : #GtRemotePhlowMenuOptions,
	#superclass : #Object,
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

{ #category : #'instance creation' }
GtRemotePhlowMenuOptions class >> new [
	^ super new initialize
]

{ #category : #converting }
GtRemotePhlowMenuOptions >> asMenuOptionsSpecification [
	| specification |
	specification := GtRemotePhlowMenuOptionsSpecification new.
	menuPreview ifPresent: [ :anObject | 
			specification menuPreview: (anObject value 
				ifNotNil: [ :aValue | aValue gtDisplayText]) ].
	menuGroup ifPresent: [ :anObject |
		specification menuGroup: anObject ].
	menuPinSubmenu ifPresent: [ :anObject |
		specification menuPinSubmenu: anObject ].
	menuHideOnClick ifPresent: [ :anObject |
		specification menuHideOnClick: anObject ].
	menuShortcut ifPresent: [ :anObject |
		specification menuShortcut: anObject ].
	menuDisable ifPresent: [ :anObject |
		specification menuDisable: anObject value ].
	^ specification
]

{ #category : #testing }
GtRemotePhlowMenuOptions >> hasAnyOptions [
	^ menuPreview isPresent
		or: [ menuGroup isPresent
		or: [ menuPinSubmenu isPresent
		or: [ menuHideOnClick isPresent
		or: [ menuShortcut isPresent
		or: [ menuDisable isPresent ] ] ] ] ]
]

{ #category : #initialization }
GtRemotePhlowMenuOptions >> initialize [
	| absent |
	
	super initialize.
	
	absent := GtRemotePhlowAbsentValue new.
	menuPreview := absent.
	menuGroup := absent.
	menuPinSubmenu := absent.
	menuHideOnClick := absent.
	menuShortcut := absent.
	menuDisable := absent.
]

{ #category : #accessing }
GtRemotePhlowMenuOptions >> menuDisable: anObject [
	menuDisable := GtRemotePhlowPresentValue new targetValue: anObject
]

{ #category : #accessing }
GtRemotePhlowMenuOptions >> menuGroup: aGroupConfiguration [
	menuGroup := GtRemotePhlowPresentValue new targetValue: aGroupConfiguration
]

{ #category : #accessing }
GtRemotePhlowMenuOptions >> menuHideOnClick: aBoolean [
	menuHideOnClick := GtRemotePhlowPresentValue new targetValue: aBoolean
]

{ #category : #accessing }
GtRemotePhlowMenuOptions >> menuPinSubmenu [
	menuPinSubmenu := GtRemotePhlowPresentValue new targetValue: true
]

{ #category : #accessing }
GtRemotePhlowMenuOptions >> menuPreview: anObject [
	menuPreview := GtRemotePhlowPresentValue new targetValue: anObject
]

{ #category : #accessing }
GtRemotePhlowMenuOptions >> menuShortcut: aShortcut [
	menuShortcut := GtRemotePhlowPresentValue new targetValue: aShortcut
]
