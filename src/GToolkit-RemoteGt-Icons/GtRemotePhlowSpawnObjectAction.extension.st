Extension { #name : #GtRemotePhlowSpawnObjectAction }

{ #category : #'*GToolkit-RemoteGt-Icons' }
GtRemotePhlowSpawnObjectAction >> applyOn: aLocalElement [ 
	aLocalElement phlow spawnObject: targetObject
]

{ #category : #'*GToolkit-RemoteGt-Icons' }
GtRemotePhlowSpawnObjectAction >> applyPrimaryModifierOn: aLocalElement [ 
	aLocalElement phlow showObject: targetObject
]
