Extension { #name : #Object }

{ #category : #'*GToolkit-RemotePhlow-GemStone' }
Object >> asRopedText [
	^ GtPhlowText forString: self asString
]

{ #category : #'*GToolkit-RemotePhlow-GemStone' }
Object >> gtDeclarativeViewSelectors [
	"Answer a collection of the object's declarative view selectors"

	^ ((Pragma 
		allNamed: #gtView
		from: self class
		to: Object) collect: [ :each | each method selector ]) asSet asArray
]

{ #category : #'*GToolkit-RemotePhlow-GemStone' }
Object >> gtDisplayOn: writeStream [
	self printOn: writeStream
]

{ #category : #'*GToolkit-RemotePhlow-GemStone' }
Object >> gtDisplayString [
  | ws contents |
  ws := PrintStream printingOn: String new "maxSize: 100".

  [ self gtDisplayOn: ws ] 
	on: Error 
	do: [ :error | ^ '<error printing>' ].
  contents := ws _collection.

  ^ contents size > 200
    ifTrue: [ (contents copyFrom: 1 to: 200) , '...' ]
    ifFalse: [ contents ]
]

{ #category : #'*GToolkit-RemotePhlow-GemStone' }
Object >> gtGsInspectorIconName [
	^ #classIcon
]

{ #category : #'*GToolkit-RemotePhlow-GemStone' }
Object >> gtRemoteVariableValuePairsWithSelfIf: aBoolean [
	| instVarNames bindings indexedVarsSize |
	instVarNames := self class allInstVarNames.
	indexedVarsSize := self basicSize - instVarNames size.
	bindings := OrderedCollection new: instVarNames size + 1.
	
	aBoolean ifTrue: [ bindings add: 'self' -> self ].
	
	instVarNames doWithIndex: [ :each :index | 
		bindings add: (each -> (self instVarAt: index))].
	
	1 to: (indexedVarsSize min: 21) do: [ :index | 
		bindings add: (index asString -> (self _at: index)) ].
	
	((indexedVarsSize - 20) max: 22) to: indexedVarsSize do: [ :index | 
		bindings add: (index asString -> (self _at: index)) ].
	
	^ bindings
]

{ #category : #'*GToolkit-RemotePhlow-GemStone' }
Object >> gtSystemIconName [
	^ self gtGsInspectorIconName
]
