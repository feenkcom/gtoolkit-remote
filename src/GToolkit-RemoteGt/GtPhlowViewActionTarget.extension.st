Extension { #name : #GtPhlowViewActionTarget }

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowViewActionTarget >> asRemotePhlowActionTarget [
	^ GtRemotePhlowViewActionTarget new
		definingMethodSelector: self definingMethodSelector
]
