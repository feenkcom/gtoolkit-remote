Extension { #name : #BlTextHighlightAttribute }

{ #category : #'*GToolkit-RemoteGt' }
BlTextHighlightAttribute >> asGtRemotePhlowTextAttribute [
	self assert: [ self paint isColor ].
	
	^ GtPhlowTextHighlightAttribute new 
		color: (GtPhlowColor 
			r: paint red 
			g: paint green 
			b: paint blue 
			alpha: paint alpha)
]
