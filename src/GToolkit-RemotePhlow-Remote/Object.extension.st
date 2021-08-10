Extension { #name : #Object }

{ #category : #'*GToolkit-RemotePhlow-Remote' }
Object >> gtDeclarativeViewPragms [
	"Answer a collection of the object's declarative view selectors"

	^ Pragma 
		allNamed: #gtView
		from: self class
		to: Object
]

{ #category : #'*GToolkit-RemotePhlow-Remote' }
Object >> gtViewsInCurrentContext [
	"Answer a collection of the object's declarative views"

	^ self gtDeclarativeViewPragms collect: [ :aPragma |
		| methodSelector phlowView |
		methodSelector := aPragma method selector.
		phlowView := self  
			perform: methodSelector
			with: GtRemotePhlowDeclarativeProtoView new.
		phlowView definingSelector: methodSelector.
		phlowView ]
]
