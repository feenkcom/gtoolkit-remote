Extension { #name : #BlFontFamilyAttribute }

{ #category : #'*GToolkit-RemoteGt' }
BlFontFamilyAttribute >> asGtRemotePhlowTextAttribute [
	^ GtPhlowFontNameAttribute new 
		fontName:  self name
]
