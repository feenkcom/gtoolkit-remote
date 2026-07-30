Extension { #name : #GtRemotePhlowProtoView }

{ #category : #'*GToolkit-RemoteGt' }
GtRemotePhlowProtoView >> updateLocalDefiningMethodProviderFor: aLocalView [
	aLocalView
			localDefiningMethodProvider: (GtPhlowConcreteDefiningMethodProvider new
				definingMethod:(GtPhlowDefiningMethodsCollector
						forContext: thisContext sender sender sender sender) collect)
]
