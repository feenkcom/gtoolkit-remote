Extension { #name : #GtPhlowThemeIconNameStencil }

{ #category : #'*GToolkit-RemoteGt-Icons' }
GtPhlowThemeIconNameStencil >> create [
	^ (Smalltalk ui icons 
		iconNamed: self iconName) asElement
]
