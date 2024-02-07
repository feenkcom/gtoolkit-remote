Extension { #name : #BlFontFamilyDefaultAttribute }

{ #category : #'*GToolkit-RemoteGt' }
BlFontFamilyDefaultAttribute >> asGtRemotePhlowTextAttribute [
	^ GtPhlowFontNameAttribute new 
		fontName:  self name
]
