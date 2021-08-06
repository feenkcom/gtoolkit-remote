Extension { #name : #Object }

{ #category : #'*GToolkit-RemoteGt' }
Object >> gtDeclarativeViewSelectors [
	"Answer a collection of the object's declarative view selectors"

	^Array streamContents: [ :stream |
		(self gtViewsInContext: GtPhlowContext null) do: [ :view | 
			view canBeGtDeclarativeView ifTrue: [
				stream nextPut: view definingMethod selector ] ] ].
]

{ #category : #'*GToolkit-RemoteGt' }
Object >> gtRemoteVariableValuePairsIn: aCollection [
	| variableNodes |
	variableNodes := OrderedCollection new: self class allSlots size.
	
	self gtInspectorVariableNodesIn: variableNodes.
	variableNodes do: [ :aVariableNode |
		aCollection add: aVariableNode label -> aVariableNode rawValue ]
]

{ #category : #'*GToolkit-RemoteGt' }
Object >> gtRemoteVariableValuePairsWithSelfIf: aBoolean [
	| variableBindings |
	variableBindings := OrderedCollection new: self class allSlots size + 1.
	aBoolean ifTrue: [ 
		variableBindings add: ('self' -> self) ].
	self gtRemoteVariableValuePairsIn: variableBindings.
	^ variableBindings
]
