Extension { #name : #GtPhlowAction }

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowAction >> asGtDeclarativeAction [
	^ nil
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowAction >> asMenuOptionsSpecification [
	| specification |
	self hasOptions ifFalse: [ ^ nil ].
	specification := GtRemotePhlowMenuOptionsSpecification new.
	self optionAt: #menuPreview
		ifPresent: [ :anObject | specification menuPreview: anObject value ]
		ifAbsent: [].
	self optionAt: #menuItemGroup
		ifPresent: [ :anObject | specification menuGroup: anObject asRemotePhlowMenuItemGroupConfiguration ]
		ifAbsent: [].
	self optionAt: #menuItemPinSubmenu
		ifPresent: [ :anObject | specification menuPinSubmenu: anObject ]
		ifAbsent: [].
	self optionAt: #menuItemHideOnClick
		ifPresent: [ :anObject | specification menuHideOnClick: anObject ]
		ifAbsent: [].
	self optionAt: #menuShortcut
		ifPresent: [ :anObject | specification menuShortcut: anObject ]
		ifAbsent: [].
	self optionAt: #menuDisable
		ifPresent: [ :anObject | specification menuDisable: anObject value ]
		ifAbsent: [].
	specification hasAnyOptions ifFalse: [ ^ nil ].
	^ specification
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowAction >> canBeGtDeclarativeAction [
	^ false
]
