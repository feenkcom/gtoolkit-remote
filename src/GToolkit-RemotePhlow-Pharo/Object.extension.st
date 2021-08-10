Extension { #name : #Object }

{ #category : #'*GToolkit-RemotePhlow-Pharo' }
Object >> gtRemoteVariableValuePairsIn: aCollection [
	| variableNodes |
	variableNodes := OrderedCollection new: self class allSlots size.
	
	self gtInspectorVariableNodesIn: variableNodes.
	variableNodes do: [ :aVariableNode |
		aCollection add: aVariableNode label -> aVariableNode rawValue ]
]

{ #category : #'*GToolkit-RemotePhlow-Pharo' }
Object >> gtRemoteVariableValuePairsWithSelfIf: aBoolean [
	| variableBindings |
	variableBindings := OrderedCollection new: self class allSlots size + 1.
	aBoolean ifTrue: [ 
		variableBindings add: ('self' -> self) ].
	self gtRemoteVariableValuePairsIn: variableBindings.
	^ variableBindings
]

{ #category : #'*GToolkit-RemotePhlow-Pharo' }
Object >> gtSystemIconName [
	^ self systemIconName
]
