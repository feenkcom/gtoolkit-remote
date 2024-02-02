Extension { #name : #BlFontSizeAttribute }

{ #category : #'*GToolkit-RemoteGt' }
BlFontSizeAttribute >> asGtRemotePhlowTextAttribute [
	^ GtPhlowFontSizeAttribute new 
		sizeValue:  self size
]
