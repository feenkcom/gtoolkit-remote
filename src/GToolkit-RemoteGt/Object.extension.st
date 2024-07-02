Extension { #name : #Object }

{ #category : #'*GToolkit-RemoteGt' }
Object >> gtActionsInCurrentContext [
	^ self gtActionsInContext: GtPhlowContext new
]

{ #category : #'*GToolkit-RemoteGt' }
Object >> gtRemoteGtRawFor: aView [
	"Define a fallback Raw view for use by PharoLink.
	This will be called explicitly if needed."

	^ aView columnedList
		title: 'Raw';
		priority: 100;
		items: [ self gtRemoteVariableValuePairsWithSelfIf: true ];
		column: 'Icon' 
			iconName: [ :anAssociation | anAssociation value class gtSystemIconName ]
			width: 36;
		column: 'Variable' text: [ :anAssociation | anAssociation key ];
		column: 'Value' text: [ :anAssociation | anAssociation value gtDisplayString ];
		send: [ :anAssociation | anAssociation value ]
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

{ #category : #'*GToolkit-RemoteGt' }
Object >> gtViewsInCurrentContext [
	^ self gtViewsInContext: GtPhlowContext new
]
