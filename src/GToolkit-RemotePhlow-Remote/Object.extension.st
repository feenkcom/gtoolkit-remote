Extension { #name : 'Object' }

{ #category : '*GToolkit-RemotePhlow-Remote' }
Object >> gtActionsInCurrentContext [
	"Answer a collection of the object's declarative actions"

	^ self gtDeclarativeActionPragmas collect: [ :aPragma |
		| methodSelector phlowAction |
		methodSelector := aPragma method selector.
			
		phlowAction := GtRemotePhlowAction new  noAction
			on: self
			perform: methodSelector.
		
		phlowAction definingSelector: methodSelector.
		phlowAction definingClass: self class.
		phlowAction ]
]

{ #category : '*GToolkit-RemotePhlow-Remote' }
Object >> gtDeclarativeActionPragmas [
	"Answer a collection of the object's declarative view selectors"

	^ Pragma 
		allNamed: #gtAction
		from: self class
		to: Object
]

{ #category : '*GToolkit-RemotePhlow-Remote' }
Object >> gtDeclarativeViewPragmas [
	"Answer a collection of the object's declarative view selectors"

	^ Pragma 
		allNamed: #gtView
		from: self class
		to: Object
]

{ #category : '*GToolkit-RemotePhlow-Remote' }
Object >> gtDeclarativeViewPragms [
	"Answer a collection of the object's declarative view selectors"

	^ self gtDeclarativeViewPragmas
]

{ #category : '*GToolkit-RemotePhlow-Remote' }
Object >> gtViewsInCurrentContext [
	"Answer a collection of the object's declarative views"

	^ self gtDeclarativeViewPragmas collect: [ :aPragma |
		| methodSelector phlowView |
		methodSelector := aPragma method selector.
			
		phlowView := GtRemotePhlowProtoView new empty 
			on: self
			perform: methodSelector.
		
		phlowView definingSelector: methodSelector.
		phlowView definingClass: self class.
		phlowView ]
]
