Extension { #name : #GtRemotePhlowThemeIconNameColumn }

{ #category : #'*GToolkit-RemoteGt-LocalPhlow' }
GtRemotePhlowThemeIconNameColumn >> createIconElementFromName: anIconName [ 
	^ (Smalltalk ui icons 
		iconNamed: anIconName) asElement
]
