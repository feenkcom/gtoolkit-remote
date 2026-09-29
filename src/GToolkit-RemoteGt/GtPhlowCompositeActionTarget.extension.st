Extension { #name : #GtPhlowCompositeActionTarget }

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowCompositeActionTarget >> asRemotePhlowActionTarget [
	| remoteTargets |
	remoteTargets := self targets 
		collect: [ :each | each asRemotePhlowActionTarget ].
	(remoteTargets anySatisfy: [ :each | each isNil ])
		ifTrue: [ ^ nil ].
	^ GtRemotePhlowCompositeActionTarget new
		targets: remoteTargets
]
