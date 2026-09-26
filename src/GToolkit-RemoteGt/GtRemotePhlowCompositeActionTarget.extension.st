Extension { #name : #GtRemotePhlowCompositeActionTarget }

{ #category : #'*GToolkit-RemoteGt' }
GtRemotePhlowCompositeActionTarget >> asLocalPhlowTarget [
	| localTargets |
	localTargets := self targets collect: [ :each | each asLocalPhlowTarget ].
	^ GtPhlowCompositeActionTarget new targets: localTargets
]
