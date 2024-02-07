Extension { #name : #BlFontEmphasisAttribute }

{ #category : #'*GToolkit-RemoteGt' }
BlFontEmphasisAttribute >> asGtRemotePhlowTextAttribute [
	^ GtPhlowFontEmphasisAttribute new 
		emphasis:  self emphasisName
]
