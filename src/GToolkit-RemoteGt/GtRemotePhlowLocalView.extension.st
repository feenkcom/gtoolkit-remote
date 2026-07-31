Extension { #name : #GtRemotePhlowLocalView }

{ #category : #'*GToolkit-RemoteGt' }
GtRemotePhlowLocalView >> definingMethod: anObject [
	localDefiningMethodProvider := GtPhlowConcreteDefiningMethodProvider new
				definingMethod: anObject
]

{ #category : #'*GToolkit-RemoteGt' }
GtRemotePhlowLocalView >> object: anObject arguments: theExecutionArguments [
	self buildContext: ((GtPhlowBuildContext new)
				object: anObject;
				arguments: theExecutionArguments)
]

{ #category : #'*GToolkit-RemoteGt' }
GtRemotePhlowLocalView >> transformIfNeededForLocalRendering [
	| spec localView |
	spec := self asGtDeclarativeView.
	localView := spec viewFor: GtPhlowView empty.
	localDefiningMethodProvider
		ifNotNil: [ :provider | 
			localView definingMethodProvider: provider].
	^localView
]
