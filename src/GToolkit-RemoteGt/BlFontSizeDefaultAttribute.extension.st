Extension { #name : #BlFontSizeDefaultAttribute }

{ #category : #'*GToolkit-RemoteGt' }
BlFontSizeDefaultAttribute >> asGtRemotePhlowTextAttribute [
	^ GtPhlowFontSizeAttribute new 
		sizeValue:  self size
]
