Extension { #name : #BrStencilBuilder }

{ #category : #'*GToolkit-RemoteGt' }
BrStencilBuilder >> asPhlowDeclarativeStencilBuilder [
	<return: #BrStencilBuilder>

	^ Error signal: 'The default builder is not declarative'
]

{ #category : #'*GToolkit-RemoteGt' }
BrStencilBuilder >> isPhlowDeclarativeStencilBuilder [
	^ false
]
