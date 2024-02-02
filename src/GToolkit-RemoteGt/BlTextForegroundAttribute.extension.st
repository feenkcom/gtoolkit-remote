Extension { #name : #BlTextForegroundAttribute }

{ #category : #'*GToolkit-RemoteGt' }
BlTextForegroundAttribute >> asGtRemotePhlowTextAttribute [
	self assert: [ self paint isColor ].
	
	^ GtPhlowTextForegroundAttribute new 
		color: (GtPhlowColor r: paint red g: paint green b: paint blue alpha: paint alpha)
]
