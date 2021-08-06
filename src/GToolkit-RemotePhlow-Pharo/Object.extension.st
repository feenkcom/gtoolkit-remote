Extension { #name : #Object }

{ #category : #'*GToolkit-RemotePhlow-Pharo' }
Object >> gtDeclarativeViewPragms [
	"Answer a collection of the object's declarative view selectors"

	^ Pragma 
		allNamed: #gtView
		from: self class
		to: Object
]

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

{ #category : #'*GToolkit-RemotePhlow-Pharo' }
Object >> gtViewsInCurrentContext [
	"Answer a collection of the object's declarative views"

	^ self gtDeclarativeViewPragms collect: [ :aPragma |
		self  
			perform: aPragma selector 
			with: GtRemotePhlowDeclarativeProtoView new ]
]
