Extension { #name : #BlTextDecorationAttribute }

{ #category : #'*GToolkit-RemoteGt' }
BlTextDecorationAttribute >> asGtRemotePhlowTextAttribute [
	^ GtPhlowTextDecorationAttribute new 
		decoration: self decoration asGtRemotePhlowTextDecoration
]
