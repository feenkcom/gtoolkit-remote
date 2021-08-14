Extension { #name : 'Object' }

{ #category : '*GToolkit-RemoteGt' }
Object >> gtRemoteStoreOn: aStream [

	^ self storeOn: aStream
]

{ #category : '*GToolkit-RemoteGt' }
Object >> gtRemoteVariableValuePairsIn: aCollection [
	| variableNodes |
	variableNodes := OrderedCollection new: self class allSlots size.
	
	self gtInspectorVariableNodesIn: variableNodes.
	variableNodes do: [ :aVariableNode |
		aCollection add: aVariableNode label -> aVariableNode rawValue ]
]

{ #category : '*GToolkit-RemoteGt' }
Object >> gtRemoteVariableValuePairsWithSelfIf: aBoolean [
	| variableBindings |
	variableBindings := OrderedCollection new: self class allSlots size + 1.
	aBoolean ifTrue: [ 
		variableBindings add: ('self' -> self) ].
	self gtRemoteVariableValuePairsIn: variableBindings.
	^ variableBindings
]

{ #category : '*GToolkit-RemoteGt' }
Object >> gtViewsInCurrentContext [
	^ self gtViewsInContext: GtPhlowContext null
]
