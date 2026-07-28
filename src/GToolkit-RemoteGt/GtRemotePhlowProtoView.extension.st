Extension { #name : #GtRemotePhlowProtoView }

{ #category : #'*GToolkit-RemoteGt' }
GtRemotePhlowProtoView >> updateLocalDefiningMethodProviderFor: aLocalView [
	aLocalView
			localDefiningMethodProvider: (GtPhlowDefiningMethodsCollector
						forContext: thisContext) collect
]
