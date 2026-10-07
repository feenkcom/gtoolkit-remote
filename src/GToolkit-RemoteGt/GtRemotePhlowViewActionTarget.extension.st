Extension { #name : #GtRemotePhlowViewActionTarget }

{ #category : #'*GToolkit-RemoteGt' }
GtRemotePhlowViewActionTarget >> asLocalPhlowTarget [
	| target |
	target := GtPhlowViewActionTarget new.
	target definingMethodSelector: self definingMethodSelector.
	^ target
]
